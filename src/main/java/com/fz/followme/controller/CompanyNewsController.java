package com.fz.followme.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.service.CompanyNewsService;
import com.fz.followme.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/companyNews")
@RequiredArgsConstructor
@Controller
public class CompanyNewsController {

	private final CompanyNewsService companyNewsService;
	private final PagingUtil pagingUtil;
	
	@RequestMapping("/list.do")
	public ModelAndView comapnyNewsList (@RequestParam(value="page", defaultValue="1") int page, ModelAndView mv){
		
		int companyNewsListCount = companyNewsService.selectCompanyNewsListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(companyNewsListCount, page, 5, 20);
		List<BoardDto> list = companyNewsService.selectCompanyNewsList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("/companyNews/companyNewsList");
		
		return mv;
		
	}
	
}
