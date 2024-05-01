package com.fz.followme.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.OrderDto;
import com.fz.followme.service.MemberService;
import com.fz.followme.service.OrderService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/chart")
@Controller
public class ChartController {
	
	private final OrderService orderService;
	private final MemberService memberService;

	@ResponseBody
	@GetMapping("/revenue.do")
	public List<OrderDto> selectOrder() {
		return orderService.selectOrder();
	}
	
}
