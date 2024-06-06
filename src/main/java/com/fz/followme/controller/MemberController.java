package com.fz.followme.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Year;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fz.followme.dto.AccountDto;
import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.AttendanceDto;
import com.fz.followme.dto.EmailDto;
import com.fz.followme.dto.LeavepDto;
import com.fz.followme.dto.LicenseDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.service.AttendanceService;
import com.fz.followme.service.CheckAccountService;
import com.fz.followme.service.EmailSender;
import com.fz.followme.service.MemberService;
import com.fz.followme.util.FileUtil;
import com.fz.followme.util.PagingUtil;
import com.fz.followme.util.ProfileUtil;
import com.fz.followme.util.SignatureUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@RequiredArgsConstructor
@Controller
public class MemberController {
	
	private final AttendanceService attendanceService;
	private final MemberService memberService;
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	private final FileUtil fileUtil;
	private final ProfileUtil profileUtil;
	private final SignatureUtil signatureUtil;
	private final PagingUtil pagingUtil;
	private final EmailSender emailSender;
	private final CheckAccountService checkAccountService;
	
	// 로그인
	@PostMapping("/login.do")
	public void login(MemberDto m,
						HttpServletRequest request,
						HttpServletResponse response) throws IOException {
						
		
		log.debug("m: {}", m);
	    MemberDto loginUser = memberService.selectMember(m);

	    response.setContentType("text/html; charset=utf-8");
	    PrintWriter out = response.getWriter();
	    
	    out.println("<script>");

	    if (loginUser == null) {
	        out.println("alert('존재하지 않는 회원입니다.');");
	        out.println("history.back();");
	    } else {
	        AttendanceDto userAtt = attendanceService.selectAttendance(loginUser.getMemNo());
	        log.debug("att: {}", userAtt);

	        if ("N".equals(loginUser.getStatus())) {
	            out.println("alert('퇴사한 직원은 로그인할 수 없습니다.');");
	            out.println("history.back();");
	        } else if ("R".equals(loginUser.getStatus())) {
	            out.println("alert('휴직 중인 직원은 로그인할 수 없습니다.');");
	            out.println("history.back();");
	        } else if (bcryptPwdEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {
	            request.getSession().setAttribute("loginUser", loginUser);
	            request.getSession().setAttribute("userAtt", userAtt);

	            // 로그인 시 사번 저장 (쿠키 저장)
	            if ("SAVE".equals(request.getParameter("memNoSaveCheck"))) {
	                Cookie cookie = new Cookie("savedMemNo", loginUser.getMemNo());
	                cookie.setMaxAge(30 * 24 * 60 * 60); // 30일 저장 유효기간
	                cookie.setPath("/");
	                response.addCookie(cookie);
	            } else {
	                Cookie cookie = new Cookie("savedMemNo", loginUser.getMemNo());
	                cookie.setMaxAge(0);
	                cookie.setPath("/");
	                response.addCookie(cookie);
	            }

	            out.println("alert('" + loginUser.getMemName() + "님 환영합니다.');");
	            out.println("location.href = '" + request.getContextPath() + "/ceoMain.page';");
	        } else {
	            out.println("alert('로그인에 실패했습니다. 사번 및 비밀번호를 다시 확인해주세요.');");
	            out.println("history.back();");
	        }
	    }

	    out.println("</script>");
	    out.flush();
	}
	
	// 마이페이지로 이동
	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest request, Model model) {
		
		// 마이페이지로 로그인한 사용자 데이터 조회해오기
		MemberDto m = (MemberDto)request.getSession().getAttribute("loginUser");
		MemberDto mypageUser = memberService.selectMember(m);
		
		model.addAttribute("mypageUser", mypageUser);
		
		// 마이페이지로 로그인한 사용자의 자격증 정보 데이터 조회해오기
		String memNo = mypageUser.getMemNo();
		List<LicenseDto> licenseList = memberService.selectLicense(memNo);
		
		
		// 자격증 첨부파일 조회 및 license 속성에 추가
	    AttachmentDto attachment = new AttachmentDto();
	    for (LicenseDto license : licenseList) {
	        attachment = memberService.selectAttachment(license.getLicNo());
	        license.setAttachment(attachment);
	    }

	    model.addAttribute("licenseList", licenseList);
		
		
		// 마이페이지로 로그인한 사용자의 계좌정보 데이터 조회해오기
		AccountDto bankAccount = memberService.selectAccount(memNo);
		
		model.addAttribute("bankAccount", bankAccount);
		
		
		return "member/mypage";
	}
	
	
	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 비밀번호 재설정 페이지로 이동
	@RequestMapping("/resetPwd.page")
	public String resetPwdPage() {
		return "member/resetPwd";
	} 

	// 임시 비밀번호 발급 및 입력한 이메일로 발송
	@PostMapping("/resetPwd.do")
	public String resetPwd(String memEmail, RedirectAttributes redirectAttributes) {

		
	    // 사용자가 입력한 이메일로 존재하는 사용자인지 확인
	    MemberDto isMember = memberService.memEmailCheck(memEmail);

	    if (isMember != null) {

	        Random r = new Random();
	        int tempPwd = r.nextInt(900000)+100000; // 랜덤 난수

	        if (isMember.getMemEmail().equals(memEmail)) {

	            EmailDto email = EmailDto.builder()
	                    .emailFrom("chennychat@gmail.com")
	                    .emailTo(memEmail)
	                    .subject("[Follow Me] 임시 비밀번호가 발급되었습니다.")
	                    .text(String.format("안녕하세요 %s님\n 발급된 임시 비밀번호는 %d입니다.", isMember.getMemName(), tempPwd))
	                    .build();

	            // 새로운 임시 비밀번호(암호화 필요)를 DB에 업데이트
	            String hashedPassword = bcryptPwdEncoder.encode(String.valueOf(tempPwd)); // 비밀번호 해싱
	            
	            isMember.setHashedPassword(hashedPassword);
	            
	            memberService.updateTempPwd(isMember);
	            
	            // 임시 비밀번호 발급 이메일 발송
	            emailSender.sendMail(email);
	            redirectAttributes.addFlashAttribute("alertMsg", "임시 비밀번호가 발급되었습니다. 이메일을 확인해주세요.");
	            return "redirect:/";

	        } else {
	        	redirectAttributes.addFlashAttribute("alertMsg", "이메일 주소가 일치하지 않습니다.");
	        }
	    } else {
	    	redirectAttributes.addFlashAttribute("alertMsg", "존재하지 않는 이메일입니다.");
	    
	    }

	    return "redirect:/member/resetPwd.page"; 
	}
	
	// 마이페이지 - 이메일 변경 기능
	@RequestMapping("/changeEmail.do")
	public String changeEmail(String originalEmail, String newEmail, RedirectAttributes redirectAttributes) {
		
		// 사용자의 기존 이메일로 존재하는 사용자인지 확인
	    MemberDto isMember = memberService.memEmailCheck(originalEmail);
	    
	    // 새로운 이메일이 DB에 있는 기존 이메일들과 중복되지 않는지 확인
	    MemberDto isMemberDouble = memberService.memEmailDoubleCheck(newEmail);
	    
	    if(isMemberDouble != null) { // 이메일 중복
	    	redirectAttributes.addFlashAttribute("alertMsg", "중복된 이메일입니다.");
	    } else {
	    	// isMember 객체에 새로운 이메일 담기
		    isMember.setMemNewEmail(newEmail);
		    
		    // 이메일 변경 서비스 호출
		    int result2 = memberService.changeEmail(isMember);
		    
			if(result2 > 0) { // 이메일 변경 성공
				redirectAttributes.addFlashAttribute("alertMsg", "이메일이 변경되었습니다.");
			} else { // 이메일 변경 실패
				redirectAttributes.addFlashAttribute("alertMsg", "이메일 변경에 실패하였습니다.");
			}
			
	    }
	    
	    
		return "redirect:/member/mypage.do"; 
	}
	
	// 마이페이지 - 비밀번호 변경 기능
	@RequestMapping("/changePwd.do")
	public String changePwd(String newMemPwd, MemberDto m, RedirectAttributes redirectAttributes) {
		
		// 로그인한 사용자 MemberDto 객체 불러오기
		MemberDto member = memberService.selectMember(m);
		
		if(member != null) {
			// 새로운 pwd 암호화 해서 저장해두기
			String hashedPassword = bcryptPwdEncoder.encode(String.valueOf(newMemPwd)); // 비밀번호 해싱
			member.setHashedPassword(hashedPassword);
			
			// 비밀번호 업데이트
			int result = memberService.updateTempPwd(member); // 임시 비밀번호 발급 때 만든 메소드인데 똑같이 활용
			
			if(result > 0) {
				redirectAttributes.addFlashAttribute("alertMsg", "비밀번호가 변경되었습니다.");
			} else {
				redirectAttributes.addFlashAttribute("alertMsg", "비밀번호 변경에 실패하였습니다.");
			}
		}
		
		return "redirect:/member/mypage.do";
	}
	
	
	// 마이페이지 - 계좌실명인증 기능 
	@PostMapping("/checkAccount")
	public ResponseEntity<Map<String, String>> checkAccount(@RequestBody Map<String, String> requestData) {
	    String bankCode = requestData.get("bank_code");
	    String bankNumber = requestData.get("bank_num");
	    
	    Map<String, String> response = new HashMap<>();
	    try {
	        Map<String, String> map = checkAccountService.getAccessToken1(bankCode, bankNumber);
	        String bankHolderInfo = map.get("bankHolderInfo");
	        Object errorObj = map.get("error");
	        if (errorObj instanceof String) {
	            String errorStr = (String) errorObj;
	            int error = Integer.parseInt(errorStr);
	            response.put("errormsg", String.valueOf(error));
	        }
	        response.put("bankHolderInfo", bankHolderInfo);
	        return ResponseEntity.ok(response);
	    } catch (Exception e) {
	        response.put("errormsg", e.getMessage());
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
	}
	
	// 마이페이지 - 자격증 정보 수정 기능 
	@PostMapping("/modifyLicense")
	public String modifyLicense(LicenseDto license, RedirectAttributes redirectAttributes) {
		
		int result = memberService.updateLicense(license);
		
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "자격증 정보가 수정되었습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "자격증 정보 수정에 실패했습니다.");
		}
		
		return "redirect:/member/mypage.do";
	}
	
	// 마이페이지 - 자격증 정보 삭제 기능
	@PostMapping("/deleteLicense")
	public String deleteLicense(LicenseDto license, RedirectAttributes redirectAttributes) {
		int result = memberService.deleteLicense(license);
		
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "해당 자격증 정보가 삭제되었습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "해당 자격증 정보 삭제에 실패했습니다.");
		}
		
		return "redirect:/member/mypage.do";
		
	}
	
	// 마이페이지 - 자격증 정보 추가 기능
	@PostMapping("/addLicense")
	public String addLicense(LicenseDto license, RedirectAttributes redirectAttributes) {
		int result = memberService.addLicense(license);
		
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "해당 자격증 정보가 추가되었습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "해당 자격증 정보 추가에 실패했습니다.");
		}
		
		return "redirect:/member/mypage.do";
	}
	
	// 마이페이지 - 프로필 사진 변경용
	@ResponseBody
	@PostMapping("/modifyProfile")
	public String ajaxModifyProfile(MultipartFile uploadFile
								, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String originalProfileURL = loginUser.getProfileImgPath();
		
		// 파일업로드 
		Map<String, String> map = profileUtil.fileUpload(uploadFile, "profile");
		loginUser.setProfileImgPath(map.get("filePath") + "/" + map.get("filesystemName"));
				
		int result = memberService.updateProfileImg(loginUser);
		
		if(result > 0) {
			if(originalProfileURL != null) {
				new File(originalProfileURL).delete();
			}
			return "SUCCESS";
		}else {
			new File(map.get("filePath") + "/" + map.get("filesystemName")).delete();
			return "FAIL";
		}
		
	}
	
	// 마이페이지 - 전자도장 이미지 등록용
	@ResponseBody
	@PostMapping("/modifySignature")
	public String ajaxModifySignature(MultipartFile uploadFile, 
									  HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String originalSigImgPath = loginUser.getSigImgPath();
		
		// 파일 업로드
		Map<String, String> map = signatureUtil.fileUpload(uploadFile, "signature");
		loginUser.setSigImgPath(map.get("filePath") + "/" + map.get("filesystemName"));
		
		int result = memberService.updateSigImg(loginUser);
		
		if(result > 0) {
			if(originalSigImgPath != null) {
				new File(originalSigImgPath).delete();
			}
			return "SUCCESS";
		}else {
			new File(map.get("filePath") + "/" + map.get("filesystemName")).delete();
			return "FAIL";
		}
		
	}
	
	
	
	// 마이페이지 - 전체 페이지 업데이트 저장 및 파일 업로드 기능
	@PostMapping("/updateMypage")
	public String updateMypage(MemberDto m
	                         , AccountDto ac
	                         , MultipartFile[] uploadFiles
	                         , HttpSession session
	                         , RedirectAttributes redirectAttributes) {

		int result1 = memberService.updatePersonalInfo(m);
		int result2 = 1; // 초기값 설정
		
		log.debug("accountDto ac : {}", ac);
		
		// 세션에서 loginUser 객체 가져오기
	    MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
	    
	    // 계좌정보가 null이 아니고, accountNo가 0보다 큰 경우에만 업데이트
	    if (ac != null && ac.getAccountNo() > 0) {
	        // accountHolder가 loginUser의 이름과 일치하는 경우에만 업데이트
	        if (ac.getAccountHolder().equals(loginUser.getMemName())) {
	            result2 = memberService.updateAccountInfo(ac);
	        } else {
	            redirectAttributes.addFlashAttribute("alertMsg", "예금주 이름이 일치하지 않아 계좌 정보 업데이트에 실패했습니다.");
	            return "redirect:/member/mypage.do";
	        }
	    } else if (ac != null && ac.getAccountNo() == 0) {
	        // 새로운 계좌 정보로 간주하여 삽입
	        if (ac.getAccountHolder().equals(loginUser.getMemName())) {
	            int newAccountNo = memberService.insertAccountInfo(ac);
	            log.debug("newAccountNo : {}", newAccountNo);
	            
	            loginUser.setAccountNo(newAccountNo);
	            session.setAttribute("loginUser", loginUser);

	            // MemberDto 객체에도 반영
	            m.setAccountNo(newAccountNo);
	            
	            // 변경 사항을 데이터베이스에 반영
	            result1 = memberService.updatePersonalInfo(m);
	        } else {
	            redirectAttributes.addFlashAttribute("alertMsg", "예금주 이름이 일치하지 않아 계좌 정보 신규 등록에 실패했습니다.");
	            return "redirect:/member/mypage.do";
	        }
	    }
	   
	    
	    int result3 = 1; // 초기값 설정

	    
	    // 자격증 파일 업데이트 (첨부파일 교체 포함)
	    // 자격증 리스트가 null이 아니고 비어있지 않은지 확인
	    if (m.getLicenseList() != null && !m.getLicenseList().isEmpty()) {
	        // 자격증 파일 업데이트 (첨부파일 교체 포함)
	        for (int i = 0; i < m.getLicenseList().size(); i++) {
	            LicenseDto lc = m.getLicenseList().get(i);

	            MultipartFile uploadFile = (uploadFiles != null && uploadFiles.length > i) ? uploadFiles[i] : null; // 각 자격증에 해당하는 파일 가져오기

	            if (uploadFile != null && !uploadFile.isEmpty()) {
	                
	                // 이전 첨부 파일 삭제
	                AttachmentDto oldAttachment = lc.getAttachment();
	                
	                if (oldAttachment != null) {
	                    memberService.deleteAttachment(lc.getLicNo());
	                    fileUtil.deleteFile(oldAttachment.getFilePath());
	                }
	                
	                // 새로운 파일 업로드 및 첨부파일 설정
	                Map<String, String> map = fileUtil.fileUpload(uploadFile, "license");
	                
	                AttachmentDto newAttachment = AttachmentDto.builder()
	                                                .originName(map.get("originalName"))
	                                                .filePath(map.get("filePath"))
	                                                .systemName(map.get("filesystemName"))
	                                                .type("L")
	                                                .refNo(lc.getLicNo())
	                                                .build();
	                lc.setAttachment(newAttachment);
	                
	                // DB에 첨부파일 추가
	                result3 *= memberService.insertAttachment(newAttachment);
	            }
	        }
	    }


	    // 최종 결과에 따라 리다이렉트 및 알림 메시지 설정
	    if (result1 > 0 && result2 > 0 && result3 > 0) {
	        redirectAttributes.addFlashAttribute("alertMsg", "인사정보 업데이트에 성공했습니다.");
	    } else {
	        redirectAttributes.addFlashAttribute("alertMsg", "인사정보 업데이트에 실패했습니다.");
	    }

	    return "redirect:/member/mypage.do";
	}
	

	
	// 인사관리 페이지로 이동 (리스트 페이징 처리 추가)
	@RequestMapping("/empManagement.page")
	public ModelAndView empManagementPage(@RequestParam(value="page", defaultValue="1") int currentPage
		     							 , ModelAndView mv) {
		
		int listCount = memberService.selectMemberListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 7);
		List<MemberDto> memberList = memberService.selectMemberList(pi);
		
		
		mv.addObject("memberList", memberList)
		  .addObject("pi", pi)
		  .setViewName("member/empManagement");
		
		return mv;
	}
	
	// 인사관리 페이지 - 키워드 검색어가 없을 경우 전체 리스트 호출
	@GetMapping("/allList")
	@ResponseBody
	public Map<String, Object> ajaxSearchList(@RequestParam(value="pageNo", defaultValue="1") int currentPage) {
		
		int listCount = memberService.selectMemberListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 7);
		List<MemberDto> memberList = memberService.selectMemberList(pi);
		
		Map<String, Object> response = new HashMap<>();
		response.put("memberList", memberList);
		response.put("pi", pi);
		
		return response;
    }
	
	
	
	// 인사관리 페이지 - 검색처리
	@GetMapping("/searchList")
	@ResponseBody
	public Map<String, Object> ajaxSearchList(String keyword
							   				, @RequestParam(value="pageNo", defaultValue="1") int currentPage) {
		
		int listCount = memberService.searchMemberListCount(keyword);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 7);
		List<MemberDto> memberList = memberService.searchMemberList(keyword, pi);
		
		Map<String, Object> response = new HashMap<>();
		response.put("memberList", memberList);
		response.put("pi", pi);
		
		return response;
    }
	
	// 인사관리 페이지 - 신규 직원정보 등록
	@PostMapping("/insertNewEmp")
	public String insertNewEmp(MemberDto m
							 , RedirectAttributes redirectAttributes) {
		
		
		// memNo 중복 체크 먼저 진행
		String memNoCheck = m.getMemNo();
		
		// email 중복 체크도 진행
		String memEmailCheck = m.getMemEmail();
		
		if(memberService.memNoCheck(memNoCheck) > 0) { // 중복된 사원번호 존재
			redirectAttributes.addFlashAttribute("alertMsg", "중복된 사원번호가 존재합니다.");
		} 
		if(memberService.memEmailCheck(memEmailCheck) != null) {
			redirectAttributes.addFlashAttribute("alertMsg", "중복된 이메일이 존재합니다.");
		}
		
		else {
			// 임시비밀번호 암호화 후 memberService로 전달
			String hashedPassword = bcryptPwdEncoder.encode(String.valueOf(m.getMemPwd()));
			log.debug(m.getMemPwd());
			m.setMemPwd(hashedPassword);
			
			int result = memberService.insertNewEmp(m);
			
			if(result > 0) {
				redirectAttributes.addFlashAttribute("alertMsg", "신규 직원 등록에 성공했습니다.");
				// 사원 등록 시 기본 연차 넣어주기
				LeavepDto leave = LeavepDto.builder()
		                .memNo(m.getMemNo())
		                .ableDate(Year.now().getValue()) // 연차 이용가능년도
		                .build();
		            
		            int leaveResult = attendanceService.insertDefaultLeave(leave);
				
				
			}else {
				redirectAttributes.addFlashAttribute("alertMsg", "신규 직원 등록에 실패했습니다.");
			}
			
		}
		
		return "redirect:/member/empManagement.page";
	}
	
	// 인사관리 페이지 - 직원정보 수정
	@PostMapping("/modifyEmpInfo")
	public String modifyEmp(MemberDto m
						   , RedirectAttributes redirectAttributes) {
		
		
		int result = memberService.modifyEmpInfo(m);
		
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "직원 정보 수정에 성공했습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "직원 정보 수정에 실패했습니다.");
		}
		
		return "redirect:/member/empManagement.page";
		
	}
	
	// 인사관리 페이지 - 직원정보 삭제
	@PostMapping("/deleteEmpInfo")
	public String deleteEmpInfo(String memNo
							  , RedirectAttributes redirectAttributes) {
		
		
		int result = memberService.deleteEmpInfo(memNo.trim());
		
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "직원 정보 삭제에 성공했습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "직원 정보 삭제에 실패했습니다.");
		}
		
		return "redirect:/member/empManagement.page";
		
	}
	
	
	// 인사관리 페이지 - 엑셀 내려받기
	@PostMapping("/excelDownload")
    public ResponseEntity<byte[]> excelDownload(@RequestBody List<List<String>> data) throws IOException {
        // 엑셀 워크북 생성
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Data");

        // 데이터를 엑셀에 기록하는 작업
        for (int i = 0; i < data.size(); i++) {
            List<String> rowData = data.get(i);
            Row row = sheet.createRow(i);
            for (int j = 0; j < rowData.size(); j++) {
                Cell cell = row.createCell(j);
                cell.setCellValue(rowData.get(j));
            }
        }

        // 엑셀 파일을 byte 배열로 변환하여 HTTP 응답으로 반환
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        workbook.write(out);
        byte[] bytes = out.toByteArray();
        workbook.close();

        return ResponseEntity
                .ok()
                .contentLength(bytes.length)
                .header("Content-Disposition", "attachment; filename=data.xlsx")
                .body(bytes);
    }
}




	
	