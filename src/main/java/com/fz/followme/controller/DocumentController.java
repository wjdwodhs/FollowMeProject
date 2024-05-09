package com.fz.followme.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		search.put("status", status);
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
		  .setViewName("document/ApprovalList");
		
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
	public ModelAndView List(@RequestParam(value="page", defaultValue="1") int currentPage
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

//	
//	@RequestMapping("/notDoneList.page")
//	public void notDoneList() {
//		
//	}
	
//	@RequestMapping("/insertForm.page")
//	public void insertForm() {
//		
//	}
//	
//	@RequestMapping("/detailForm.page")
//	public void detailForm() {
		
	
	
}
