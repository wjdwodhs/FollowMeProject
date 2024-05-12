package com.fz.followme.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.DocumentDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;
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
	
	// 전체 리스트조회 -----------------------------------------------
	@GetMapping("/list.page")
	public ModelAndView list(@RequestParam(value="page", defaultValue="1") int currentPage
			       , ModelAndView mv, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		MemberDto m = new MemberDto();
		m.setMemNo(loginUser.getMemNo());
		m.setDeptNo(loginUser.getDeptNo());
		m.setMemGrade(loginUser.getMemGrade());
		
		int listCount = documentService.selectDocumentListCount(m);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
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
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		
		List<DocumentDto> list = documentService.selectSearchList(search, pi);
		
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
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		
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
	@GetMapping("/pendList.page")
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
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<DocumentDto> list = documentService.selectPendList(pi, m);
	
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/pendList");
		
		return mv;
	}
	
	// 승인 리스트조회 -----------------------------------------------
	@GetMapping("/approvalList.page")
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
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<DocumentDto> list = documentService.selectApprovalList(pi, m);
		
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/approvalList");
		
		return mv;
	}
	
	// 반려 리스트조회 -----------------------------------------------
	@GetMapping("/rejectList.page")
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
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<DocumentDto> list = documentService.selectRejectList(pi, m);
		
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/rejectList");
		
		return mv;
	}
	
	// 회수 리스트조회 -----------------------------------------------
	@GetMapping("/recallList.page")
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
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<DocumentDto> list = documentService.selectRecallList(pi, m);
		
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/recallList");
		
		return mv;
	}
	
	
	
	
	// 참조 리스트조회 -----------------------------------------------
	@GetMapping("/refList.page")
	public ModelAndView refList(@RequestParam(value="page", defaultValue="1") int currentPage
		       , ModelAndView mv, HttpSession session) {
	
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String memNo = loginUser.getMemNo();
		
		
		int listCount = documentService.selectRefListCount(memNo);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<DocumentDto> list = documentService.selectRefList(pi, memNo);
		
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/refList");
		
		return mv;
	}

	// 미결재 리스트조회 -----------------------------------------------
	@GetMapping("/notDoneList.page")
	public ModelAndView notDoneList(@RequestParam(value="page", defaultValue="1") int currentPage
		       , ModelAndView mv, HttpSession session) {
	
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String memNo = loginUser.getMemNo();
		
		int listCount = documentService.selectNotDoneListCount(memNo);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<DocumentDto> list = documentService.selectNotDoneList(pi, memNo);
	
		mv.addObject("pi", pi)
		  .addObject("list",list)
		  .setViewName("document/notDoneList");
		
		return mv;
	}
	
	// 글 작성 관련 ---------------------------------------------------
	@GetMapping("/insertForm.page")
	public void insertForm() {

	}
	
	/*
	@GetMapping("/submitCategory")
	public String insertForm(@RequestParam("docuCategory") int docuCategory
						  , HttpSession session
						  , Model model) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("documentCategory", docuCategory);
		map.put("loginUser", loginUser);
		documentService.selectApprover(map);
		
		return "document/insertForm";
	}
	*/
		
	@PostMapping("/insert.do")
	public String regist(DocumentDto document
					   , String[] docuSpendDate, String[] docuSpendItems, String[] docuSpendPrice, String[] docuSpendRemark
					   , String[] docuBuyItems, String[] docuBuyCount, String[] docuBuyPrice, String[] docuBuySumPrice, String[] docuBuyRemark
					   , List<MultipartFile> uploadFiles
			      	   , HttpSession session
			      	   , RedirectAttributes redirectAttributes) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		document.setMemNo(loginUser.getMemNo());

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
		
		redirectAttributes.addFlashAttribute("alertTitle", "게시판 작성 서비스");
		if(attachList.isEmpty() && result == 1 || !attachList.isEmpty() && result == attachList.size()) {
			redirectAttributes.addFlashAttribute("alertMsg", "전자문서 등록에 성공하셨습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "전자문서 등록에 실패했습니다.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		
		return "redirect:/document/list.page";
	}

	@RequestMapping("/detail.do")
	public String detail(int no, Model model) {
		
		model.addAttribute("document", documentService.selectDocument(no));
		return "document/detailForm";
	}
}
