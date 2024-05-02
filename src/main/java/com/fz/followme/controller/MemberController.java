package com.fz.followme.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fz.followme.dto.EmailDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.service.EmailSender;
import com.fz.followme.service.MemberService;
import com.fz.followme.util.FileUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@RequiredArgsConstructor
@Controller
public class MemberController {
	
	private final MemberService memberService;
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	private final FileUtil fileUtil;
	private final EmailSender emailSender;

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
		
		if(loginUser != null && bcryptPwdEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {
			request.getSession().setAttribute("loginUser", loginUser);
			
			// 로그인 시 사번 저장 (쿠키 저장)
			if ("SAVE".equals(request.getParameter("memNoSaveCheck"))) {
				Cookie cookie = new Cookie("savedMemNo", loginUser.getMemNo());
				cookie.setMaxAge(30*24*60*60); // 30일 저장 유효기간
				cookie.setPath("/");
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("savedMemNo", loginUser.getMemNo());
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			
			out.println("alert('" + loginUser.getMemName() + "님 환영합니다.');");
			
			if(loginUser.getAuthLevel().equals("3")) {
				out.println("location.href = '" + request.getContextPath() + "/ceoMain.page';");
			} else {
				out.println("location.href = '" + request.getContextPath() + "/employeeMain.page';");
			}
			
		} else {
			out.println("alert('로그인에 실패했습니다. 사번 및 비밀번호를 다시 확인해주세요.');");
			out.println("history.back();");
		}
		out.println("</script>");
		
	}
	
	// 마이페이지로 이동
	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest request, Model model) {
		
		MemberDto m = (MemberDto)request.getSession().getAttribute("loginUser");
		MemberDto mypageUser = memberService.selectMember(m);
		
		model.addAttribute("mypageUser", mypageUser);
		
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
	                    .fromEmail("chennychat@gmail.com")
	                    .toEmail(memEmail)
	                    .title("[Follow Me] 임시 비밀번호가 발급되었습니다.")
	                    .content(String.format("안녕하세요 %s님\n 발급된 임시 비밀번호는 %d입니다.", isMember.getMemName(), tempPwd))
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
	
	// 인사관리 페이지로 이동
	@RequestMapping("/empManagement.page")
	public void empManagementPage() {}

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
	
}




	
	