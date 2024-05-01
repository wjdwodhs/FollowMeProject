package com.fz.followme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DocumentController {

	// * 전자결재페이지 관련 ---------------------------
	@RequestMapping("/document/list.page")
	public void allList() {
		
	}
	
	@RequestMapping("/document/pendList.page")
	public void pendList() {
		
	}
	
	@RequestMapping("/document/approvalList.page")
	public void approvalList(){
		
	}
	
	@RequestMapping("/document/rejectList.page")
	public void rejectList() {
		
	}
	
	@RequestMapping("/document/recallList.page")
	public void recallList() {
		
	}
	
	@RequestMapping("/document/refList.page")
	public void refList() {
		
	}
	
	@RequestMapping("/document/notDoneList.page")
	public void notDoneList() {
		
	}
	
	@RequestMapping("/document/insertForm.page")
	public void insertForm() {
		
	}
	
	@GetMapping("/document/loadDocument")
	public String loadDocument(@RequestParam("selectedOption") String selectedOption, Model model) {
	    String documentContent = ""; // 선택된 옵션에 따라 JSP 파일의 내용을 가져오는 코드 작성
	    model.addAttribute("documentContent", documentContent);
	    return "documentContent"; // div의 ID인 documentContent를 반환합니다.
	}
	
	
	@RequestMapping("/document/sample1.page")
	public void insertSample1() {
	
	}
	
	@RequestMapping("/document/sample2.page")
	public void insertSample2() {
	}

	
}
