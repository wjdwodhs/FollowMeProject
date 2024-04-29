package com.fz.followme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class employeeMainController {

	@RequestMapping("/main")
	public String mainPage() {
		return "employeeMain";
	}
}
