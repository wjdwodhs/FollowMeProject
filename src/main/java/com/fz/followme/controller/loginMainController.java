package com.fz.followme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginMainController {
	
	@RequestMapping("/loginForm.me")
	public String loginMainPage() {

		return "login";
	}
}
