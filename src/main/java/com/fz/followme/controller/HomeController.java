package com.fz.followme.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fz.followme.dto.OrderDto;
import com.fz.followme.service.OrderService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HomeController {
	
	private final OrderService orderService;
	
	@RequestMapping("/")
	public String mainPage() {

		return "loginMain";
	}
	
	@RequestMapping("/employeeMain.page")
	public String employeeMainPage() {
		return "employeeMain";
	}
	
	@RequestMapping("/ceoMain.page")
	public String ceoMainPage(Model model) {
		
		OrderDto revenueList = orderService.selectRevenue();
		OrderDto todayInfo = orderService.selectTodayInfo();
		
		model.addAttribute("revenueList", revenueList);	
		model.addAttribute("todayInfo", todayInfo);
		
		return "ceoMain";
	}
	
	
	@RequestMapping("/attendance.page")
	public String attendancePage() {
		return "attendance/attendance";
	}
	


	
	
}
