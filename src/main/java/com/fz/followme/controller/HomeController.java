package com.fz.followme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String mainPage() {

		return "loginMain";
	}
	
	@RequestMapping("/employeeMain.page")
	public String employeeMainPage() {
		return "employeeMain";
	}
	
	@RequestMapping("/ceoMain.page")
	public String ceoMainPage() {
		return "ceoMain";
	}
	
	@RequestMapping("/calendar.page")
	public String calendarPage() {
		return "calendar/calendar";
	}
	
	@RequestMapping("/attendance.page")
	public String attendancePage() {
		return "attendance/attendance";
	}
}
