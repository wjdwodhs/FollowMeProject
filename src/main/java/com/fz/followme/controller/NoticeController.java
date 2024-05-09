package com.fz.followme.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.service.NoticeService;
import com.fz.followme.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/notice")
@RequiredArgsConstructor
@Controller
public class NoticeController {
	
	private final NoticeService noticeService;
	private final PagingUtil pagingUtil;
	
	@RequestMapping("/list.do")
	public ModelAndView noticeList(@RequestParam(value="page", defaultValue="1") int page, ModelAndView mv) {
		
		int noticeListCount = noticeService.selectNoticeListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(noticeListCount, page, 5, 20);
		List<BoardDto> allList = noticeService.selectNoticeList(pi);
		log.debug("allList:{}",allList);
		List<BoardDto> newList = noticeService.selectLatestPostList();
		log.debug("newList:{}",newList);

		mv.addObject("pi", pi)
		  .addObject("allList", allList)
		  .addObject("newList", newList)
		  .setViewName("/notice/noticeList");
		
		return mv;
	}
	
	
	
	
	
}
