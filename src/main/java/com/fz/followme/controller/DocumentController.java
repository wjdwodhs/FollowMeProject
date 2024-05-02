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
	
	
	@RequestMapping("/document/sample1.page")
	public void insertSample1() {
	
	}
	
	@RequestMapping("/document/sample2.page")
	public void insertSample2() {
	}

	
}
