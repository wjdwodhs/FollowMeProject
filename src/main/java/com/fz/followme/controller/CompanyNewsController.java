package com.fz.followme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CompanyNewsController {

	@RequestMapping("/companyNewsList.page")
	public String companyNewsList() {
		return "companyNews/companyNewsList";
	}
}
