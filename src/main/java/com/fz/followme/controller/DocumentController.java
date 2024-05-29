package com.fz.followme.controller;

import java.time.LocalDate;
import java.time.Year;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.socket.TextMessage;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.DocumentDto;
import com.fz.followme.dto.LeavepDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.handler.AlarmEchoHandler;
import com.fz.followme.service.AttendanceService;
import com.fz.followme.service.DocumentService;
import com.fz.followme.util.FileUtil;
import com.fz.followme.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequiredArgsConstructor
@RequestMapping("/document")
@Controller
public class DocumentController {

	private final DocumentService documentService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	private String status;
	
	private final AlarmEchoHandler handler;
	private final AttendanceService attendanceService;

	
	// 전체 리스트조회 -----------------------------------------------
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(value="page", defaultValue="1") int currentPage
			       , ModelAndView mv, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		MemberDto m = new MemberDto();
		m.setMemNo(loginUser.getMemNo());
		m.setDeptNo(loginUser.getDeptNo());
		m.setMemGrade(loginUser.getMemGrade());
		
		int listCount = documentService.selectDocumentListCount(m);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<DocumentDto> list = documentService.selectDocumentList(pi, m);

		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/list");
		
		return mv;
	}
	
	// 검색 리스트조회 -----------------------------------------------
	@GetMapping("/search.do")
	public ModelAndView search(@RequestParam Map<String, String> search
							 , @RequestParam(value="page", defaultValue="1") int currentPage
							 , ModelAndView mv, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		
		log.debug("search: {}", search);
		search.put("memNo", loginUser.getMemNo());
		search.put("deptNo", String.valueOf(loginUser.getDeptNo()));
		search.put("memGrade", loginUser.getMemGrade());
		
		int listCount = documentService.selectSearchListCount(search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		
		List<DocumentDto> list = documentService.selectSearchList(search, pi);
		
		log.debug("list: {}" ,list);
		
		mv.addObject("pi",pi)
		  .addObject("list", list)
		  .addObject("search", search)
		  .setViewName("document/list");
		
		return mv;
	}
	
	// status에 따른 검색 리스트조회 -----------------------------------------------
	@GetMapping("/status")
	public ModelAndView statusSearch(@RequestParam Map<String, String> search
							 , @RequestParam(value="page", defaultValue="1") int currentPage
							 , ModelAndView mv, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		
		log.debug("search: {}", search);
		search.put("status", status);
		search.put("memNo", loginUser.getMemNo());
		search.put("deptNo", String.valueOf(loginUser.getDeptNo()));
		search.put("memGrade", loginUser.getMemGrade());
		
		int listCount = documentService.statusSearchListCount(search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		
		List<DocumentDto> list = documentService.statusSearchList(search, pi);

		  if(status.equals("0")) {
			  mv.addObject("pi",pi)
				.addObject("list", list)
				.addObject("search", search)
				.setViewName("document/pendList");
		  }else if(status.equals("1")) {
			  mv.addObject("pi",pi)
				.addObject("list", list)
				.addObject("search", search)			  
				.setViewName("document/approvalList");
		  }else if(status.equals("2")) {
			  mv.addObject("pi",pi)
				.addObject("list", list)
				.addObject("search", search)
				.setViewName("document/reject");
		  }else if(status.equals("3")) {
			  mv.addObject("pi",pi)
				.addObject("list", list)
				.addObject("search", search)
				.setViewName("document/recall");
		  }
		
		return mv;
	}
	
	// 진행중 리스트조회 -----------------------------------------------
	@GetMapping("/pendList")
	public ModelAndView pendList(@RequestParam(value="page", defaultValue="1") int currentPage
			   , @RequestParam(value="status", defaultValue="0") String status
		       , ModelAndView mv, HttpSession session) {
	
		//Map<String, Object> map = new HashMap<>();
		
		this.status = status;
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		MemberDto m = new MemberDto();
		m.setMemNo(loginUser.getMemNo());
		m.setDeptNo(loginUser.getDeptNo());
		m.setMemGrade(loginUser.getMemGrade());
		
		int listCount = documentService.selectPendListCount(m);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<DocumentDto> list = documentService.selectPendList(pi, m);
	
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/pendList");
		
		return mv;
	}
	
	// 승인 리스트조회 -----------------------------------------------
	@GetMapping("/approvalList")
	public ModelAndView approvalList(@RequestParam(value="page", defaultValue="1") int currentPage
			, @RequestParam(value="status", defaultValue="1") String status   
			, ModelAndView mv, HttpSession session) {
	
		this.status = status;	
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		MemberDto m = new MemberDto();
		m.setMemNo(loginUser.getMemNo());
		m.setDeptNo(loginUser.getDeptNo());
		m.setMemGrade(loginUser.getMemGrade());
		
		int listCount = documentService.selectApprovalListCount(m);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<DocumentDto> list = documentService.selectApprovalList(pi, m);
		
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/approvalList");
		
		return mv;
	}
	
	// 반려 리스트조회 -----------------------------------------------
	@GetMapping("/rejectList")
	public ModelAndView rejectList(@RequestParam(value="page", defaultValue="1") int currentPage
			 , @RequestParam(value="status", defaultValue="2") String status   
			 , ModelAndView mv, HttpSession session) {
	
		this.status = status;
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		MemberDto m = new MemberDto();
		m.setMemNo(loginUser.getMemNo());
		m.setDeptNo(loginUser.getDeptNo());
		m.setMemGrade(loginUser.getMemGrade());
		
		int listCount = documentService.selectRejectListCount(m);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<DocumentDto> list = documentService.selectRejectList(pi, m);
		
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/rejectList");
		
		return mv;
	}
	
	// 회수 리스트조회 -----------------------------------------------
	@GetMapping("/recallList")
	public ModelAndView recallList(@RequestParam(value="page", defaultValue="1") int currentPage
			 , @RequestParam(value="status", defaultValue="3") String status   
			 , ModelAndView mv, HttpSession session, DocumentDto d) {
	
		this.status = status;
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		MemberDto m = new MemberDto();
		m.setMemNo(loginUser.getMemNo());
		m.setDeptNo(loginUser.getDeptNo());
		m.setMemGrade(loginUser.getMemGrade());
		
		int listCount = documentService.selectRecallListCount(m);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<DocumentDto> list = documentService.selectRecallList(pi, m);
		
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/recallList");
		
		return mv;
	}
	
	
	
	
	// 참조 리스트조회 -----------------------------------------------
	@GetMapping("/refList")
	public ModelAndView refList(@RequestParam(value="page", defaultValue="1") int currentPage
		       , ModelAndView mv, HttpSession session) {
	
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String memNo = loginUser.getMemNo();
		
		
		int listCount = documentService.selectRefListCount(memNo);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<DocumentDto> list = documentService.selectRefList(pi, memNo);
		
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/refList");
		
		return mv;
	}

	// 미결재 리스트조회 -----------------------------------------------
	@GetMapping("/notDoneList")
	public ModelAndView notDoneList(@RequestParam(value="page", defaultValue="1") int currentPage
		       , ModelAndView mv, HttpSession session) {
	
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String memNo = loginUser.getMemNo();
		
		int listCount = documentService.selectNotDoneListCount(memNo);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<DocumentDto> list = documentService.selectNotDoneList(pi, memNo);
	
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/notDoneList");
		
		return mv;
	}
	
	// 글 작성 관련 ---------------------------------------------------
	@GetMapping("/insertForm")
	public void insertForm() {

	}
		
	@PostMapping("/insert.do")
	public String regist(DocumentDto document
					   , String[] docuSpendDate, String[] docuSpendItems, String[] docuSpendPrice, String[] docuSpendRemark
					   , String[] docuBuyItems, String[] docuBuyCount, String[] docuBuyPrice, String[] docuBuySumPrice, String[] docuBuyRemark
					   , List<MultipartFile> uploadFiles
			      	   , HttpSession session
			      	   , RedirectAttributes redirectAttributes) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		document.setMemNo(loginUser.getMemNo());
		int ableDate = Year.now().getValue();
		log.debug("document:{}",document);
		// docuStartDate=2024-06-05, docuEndDate=2024-06-15
		// endDate에서 startDate를 뺀값 +1 이 잔여휴가보다 많다면 등록이 안되게끔
		
		if(document.getDocuCategory() == 4) {
			document.setDocuStartDate(String.join(",", docuSpendDate));
			document.setDocuItem(String.join(",", docuSpendItems));
			document.setDocuEtcCost(String.join(",", docuSpendPrice));
			document.setDocuRemark(String.join(",", docuSpendRemark));
		}else if(document.getDocuCategory() == 5) {
			document.setDocuItem(String.join(",", docuBuyItems));
			document.setDocuCount(String.join(",", docuBuyCount));
			document.setDocuEtcCost(String.join(",", docuBuyPrice));
			document.setDocuCost(String.join(",", docuBuySumPrice));
			document.setDocuRemark(String.join(",", docuBuyRemark));
		}else if(document.getDocuCategory() == 3) { 
			// 해당 memNo과 ableDate로 잔여 연차 조회해와서 
			// endDate에서 startDate를 뺀값과 비교 후 만약 잔여 연차보다 이 값이 크다면 alert
			String memNo = document.getMemNo();
			String startDate = document.getDocuStartDate(); // 2024-05-20
			String endDate = document.getDocuEndDate(); // 2024-05-25
			
			// 날짜 문자열을 LocalDate로 변환
	        LocalDate start = LocalDate.parse(startDate);
	        LocalDate end = LocalDate.parse(endDate);

	        // 날짜 차이 계산 (종료 날짜 - 시작 날짜 + 1)
	        long daysDifference = ChronoUnit.DAYS.between(start, end) + 1;
	        int intDaysDifference = (int) daysDifference;
	        log.debug("날짜차이 계산 결과:{}",intDaysDifference);
	        
			
			LeavepDto docu = LeavepDto.builder()
            		.memNo(memNo)
	                .ableDate(ableDate)
	                .build();
			int leave = attendanceService.selectLeave(docu); // 잔여 연차 개수
			log.debug("잔여휴가 개수:{}",leave);
			redirectAttributes.addFlashAttribute("alertTitle", "전자결재 작성 서비스");
			if(intDaysDifference > leave) {
				redirectAttributes.addFlashAttribute("alertMsg", "잔여 연차보다 사용한 일수가 더 많습니다.");
		        return "redirect:/document/insertForm";
			}
			
			
			
			
		}
		
		
		
		List<AttachmentDto> attachList = new ArrayList<>();
		log.debug("document: {}", document);
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				// 파일 업로드
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "document");
				
				// insert할 데이터 => AttachDto객체 만들고 => attachList쌓기
				attachList.add(AttachmentDto.builder()
									    .filePath(map.get("filePath"))
									    .systemName(map.get("filesystemName"))
									    .originName(map.get("originalName"))
									    .type("D")
									    .build());
			}
		}
		
		document.setAttachList(attachList); // 첨부파일이 없었을 경우 텅빈 리스트가 담김
		
		int result = documentService.insertDocument(document);
		
		// 성공시 => alert메세지와 함께 목록페이지로 이동
		// 실패시 => alert메세지와 함께 작성페이지에 그대로
		
		redirectAttributes.addFlashAttribute("alertTitle", "전자결재 작성 서비스");
		if(attachList.isEmpty() && result == 1 || !attachList.isEmpty() && result == attachList.size()) {
			redirectAttributes.addFlashAttribute("alertMsg", "전자문서 등록에 성공하셨습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "전자문서 등록에 실패했습니다.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		
		return "redirect:/document/list";
	}

	@RequestMapping("/detail")
	public String detail(int no, Model model) {
		
		model.addAttribute("document", documentService.selectDocument(no));
		return "document/detailForm";
	}
	
	@PostMapping("/recall.do")
	public String recallDocument(DocumentDto document, RedirectAttributes redirectAttributes) {
		int result = documentService.recallDocument(document);
		
		redirectAttributes.addFlashAttribute("alertTitle", "문서 상태 변경");
		if(result > 0) {
			// 성공시
			redirectAttributes.addFlashAttribute("alertMsg", "전자문서가 회수 처리 되었습니다.");			
		}else {
			// 실패시
			redirectAttributes.addFlashAttribute("alertMsg", "전자문서 회수에 실패했습니다.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		
		return "redirect:/document/detail?no=" + document.getDocuNo();	
	}
	
	// 전자문서 중간결재자 승인처리
	@PostMapping("/midApprove.do")
	public String updateMidApprove(DocumentDto document 
								 , RedirectAttributes redirectAttributes
								 , HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String midApprover = documentService.selectMidApprover(document);
		// 로그인유저가 중간결재자일때
		log.debug("midApprover: {}", midApprover);
		log.debug("login: {}", loginUser.getMemNo());
		if(midApprover != null && midApprover.equals(loginUser.getMemNo())){
			
			int result = documentService.updateMidApprove(document);
			
			redirectAttributes.addFlashAttribute("alertTitle", "전자문서 결재 승인");
			if(result > 0) {
				// 성공시
				redirectAttributes.addFlashAttribute("alertMsg", "전자문서가 승인 처리 되었습니다.");
				
			}else {
				// 실패시
				redirectAttributes.addFlashAttribute("alertMsg", "전자문서의 승인 처리에 실패했습니다.");
				redirectAttributes.addFlashAttribute("historyBackYN", "Y");
			}
		}else { // 중간결재자가 아닐때
			redirectAttributes.addFlashAttribute("alertMsg", "전자문서의 처리 권한이 없습니다.");
		}
		
		return "redirect:/document/detail?no=" + document.getDocuNo();
	}
	
	// 전자문서 최종결재자 승인처리
	@PostMapping("/finalApprove.do")
	public String updateFinalApprove(DocumentDto document 
								 , RedirectAttributes redirectAttributes
								 , HttpSession session
								 ) throws Exception{
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String finalApprover = documentService.selectFinalApprover(document);
		// 로그인유저가 최종결재자일때
		if(finalApprover != null && finalApprover.equals(loginUser.getMemNo())){
			
			int result = documentService.updateFinalApprove(document);
			
			redirectAttributes.addFlashAttribute("alertTitle", "전자문서 결재 승인");
			if(result > 0) {
				// 성공시
				log.debug("memNo: {} ", document.getMemNo());
				log.debug("document:{}",document);
					
	            TextMessage message = new TextMessage("성공");
	        	handler.broadcastMessageToUser(document.getMemNo(), message);
	        	
	        	DocumentDto docu = documentService.selectDocument(document.getDocuNo());
	        	
			if(docu.getDocuCategory() == 3) { // 카테고리가 3이면 휴가 신청 전자결재
						
					// 연차테이블의 연차 정보 입력
					attendanceService.insertLeave(docu); 
					
					int ableDate = Year.now().getValue(); // 연차테이블의 사용가능연도 (현재날짜 년도)
					String startDate = docu.getDocuStartDate();  // ex) 2024-05-28
					String endDate = docu.getDocuEndDate();  // ex) 2024-05-30
					String memNo = docu.getMemNo();
					
					LeavepDto docum = LeavepDto.builder()
		            		.memNo(memNo)
			                .startDate(startDate)
			                .endDate(endDate)
			                .ableDate(ableDate)
			                .build();
					
					// 회원번호 , 연차사용가능날짜, 연차사용일수 (end - start)
					attendanceService.updateLeavep(docum); 
					
				}
				
				redirectAttributes.addFlashAttribute("alertMsg", "전자문서가 승인 처리 되었습니다.");
		       		        
				// 전자결재 update 성공 시, String msg 생성해서 핸들러 메소드로 메시지를 보낸 후, 
				// 핸들러에서 클라이언트단으로 msg를 보내게 
				
			}else {
				// 실패시
				redirectAttributes.addFlashAttribute("alertMsg", "전자문서의 승인 처리에 실패했습니다.");
				redirectAttributes.addFlashAttribute("historyBackYN", "Y");
			}
		}else { // 최종결재자가 아닐때
			redirectAttributes.addFlashAttribute("alertMsg", "전자문서의 처리 권한이 없습니다.");
		}
		
		return "redirect:/document/detail?no=" + document.getDocuNo();
	}
	
	// 전자문서 중간결재자 반려처리
	@PostMapping("/midReject.do")
	public String updateMidReject(DocumentDto document 
								 , RedirectAttributes redirectAttributes
								 , HttpSession session) throws Exception {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String midApprover = documentService.selectMidApprover(document);

		if(midApprover != null && midApprover.equals(loginUser.getMemNo())){
			
			int result = documentService.updateMidReject(document);
			
			redirectAttributes.addFlashAttribute("alertTitle", "전자문서 결재 반려");
			if(result > 0) {
	            TextMessage message = new TextMessage("성공");
	        	handler.broadcastMessageToUser(document.getMemNo(), message);
				
				// 성공시
				redirectAttributes.addFlashAttribute("alertMsg", "전자문서가 반려 처리 되었습니다.");
									
			}else {
				// 실패시
				redirectAttributes.addFlashAttribute("alertMsg", "전자문서의 반려 처리에 실패했습니다.");
				redirectAttributes.addFlashAttribute("historyBackYN", "Y");
			}
		}else { // 중간결재자가 아닐때
			redirectAttributes.addFlashAttribute("alertMsg", "전자문서의 처리 권한이 없습니다.");
		}
		
		return "redirect:/document/detail?no=" + document.getDocuNo();
	}
	
	// 전자문서 최종결재자 반려 처리 
	@PostMapping("/finalReject.do")
	public String updateFinalReject(DocumentDto document 
								 , RedirectAttributes redirectAttributes
								 , HttpSession session) throws Exception {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String finalApprover = documentService.selectFinalApprover(document);
		// 로그인유저가 최종결재자일때
		if(finalApprover != null && finalApprover.equals(loginUser.getMemNo())){
			
			int result = documentService.updateFinalReject(document);
			
			redirectAttributes.addFlashAttribute("alertTitle", "전자문서 결재 반려");
			if(result > 0) {
				
	            TextMessage message = new TextMessage("성공");
	        	handler.broadcastMessageToUser(document.getMemNo(), message);
				// 성공시
				redirectAttributes.addFlashAttribute("alertMsg", "전자문서가 반려 처리 되었습니다.");
	
			}else {
				// 실패시
				redirectAttributes.addFlashAttribute("alertMsg", "전자문서 반려 처리에 실패했습니다.");
				redirectAttributes.addFlashAttribute("historyBackYN", "Y");
			}
		}else { // 최종결재자가 아닐때
			redirectAttributes.addFlashAttribute("alertMsg", "전자문서의 처리 권한이 없습니다.");
		}
		
		return "redirect:/document/detail?no=" + document.getDocuNo();
	}
	
	// select 첨부파일 ajax 조회
	@ResponseBody
	@PostMapping(value="/selectAt.do", produces="application/json; charset=utf-8")
	public List<AttachmentDto> selectAttachmentList(@RequestParam("no") int no){
		return documentService.selectAttachmentList(no); 
	}
	
	// insert 참조인 ajax 조회
	@ResponseBody
	@GetMapping(value="/selectRefMem.do", produces="application/json; charset=utf-8")
	public List<MemberDto> selectMemberList(){
		return documentService.selectMemberList();
	}
	
	// insert 4,5번 양식 컬럼 리스트로 반환 ajax
	@ResponseBody
	@PostMapping(value="/spendList.do", produces="application/json; charset=utf-8")
	public DocumentDto spendList(int no){ 
			
		return documentService.selectDocument(no);
	}
	
}
