package com.fz.followme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	@RequestMapping("/noticeList.page")
	public String boardInsert() {
		return "notice/noticeList";
	}
	
	
	
}
