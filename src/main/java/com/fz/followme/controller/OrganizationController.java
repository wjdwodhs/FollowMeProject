package com.fz.followme.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fz.followme.dto.OrganizationDto;
import com.fz.followme.service.OrganizationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/organization")
@RequiredArgsConstructor
@Controller
public class OrganizationController {
	
	private final OrganizationService organizationService;

	@GetMapping("/organizationList")
	public ModelAndView selectOrganizationList(ModelAndView mv){
		
		List<OrganizationDto> oList = organizationService.selectOrganizationList();
		
		mv.addObject("oList", oList)
		  .setViewName("/organizationChart/organizationChart");
		return mv;
	}
	
}
