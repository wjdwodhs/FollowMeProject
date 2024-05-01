package com.fz.followme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/email")
@Controller
public class EmailController {

	@RequestMapping("/email.page")
	public String emailIndob() {
		return "email/emailInbox";
	}


	@RequestMapping("/composeForm.do")
	public String emailCompose() {
		return "email/emailComposeForm";
	}
	
	// 메일 상세내용 수정해야함
	@RequestMapping("/readMail.do")
	public String emailRead() {
		return "email/emailRead";
	}
	
}
