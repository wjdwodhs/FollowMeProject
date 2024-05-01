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
	
	
	
	
}
