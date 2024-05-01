package com.fz.followme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/document")
@Controller
public class DocumentController {

	// * 전자결재페이지 관련 ---------------------------
	@RequestMapping("/list.page")
	public void allList() {
		
	}
	
	@RequestMapping("/pendList.page")
	public void pendList() {
		
	}
	
	@RequestMapping("/approvalList.page")
	public void approvalList(){
		
	}
	
	@RequestMapping("/rejectList.page")
	public void rejectList() {
		
	}
	
	@RequestMapping("/recallList.page")
	public void recallList() {
		
	}
	
	@RequestMapping("/refList.page")
	public void refList() {
		
	}
	
	@RequestMapping("/notDoneList.page")
	public void notDoneList() {
		
	}
	
	
	
	@RequestMapping("/insertSample1.page")
	public void insertSample1() {
	
	}
	
	@RequestMapping("/insertSample2.page")
	public void insertSample2() {
	}

	
}
