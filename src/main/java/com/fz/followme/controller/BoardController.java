package com.fz.followme.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.service.BoardService;
import com.fz.followme.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@RequiredArgsConstructor
@Controller
public class BoardController {
	
	private final BoardService boardService;
	private final PagingUtil pagingUtil;
	
	@RequestMapping("/socialFeed.page")
	public void socialFeedPage() {}
	
	
	
	/**
	 * 
	 * @author SungBum
	 * @return
	 */
	@RequestMapping("/list.do")
	public ModelAndView boardList(@RequestParam(value="page", defaultValue="1")int page, ModelAndView mv) {
		
		int boardListCount = boardService.selectBoardListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(boardListCount, page, 5, 20);
		List<BoardDto> list = boardService.selectBoardList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("/board/boardList");
		
		return mv;
	}
	
	
	
	@RequestMapping("/boardInsert.page")
	public String boardInsertPage() {
		return "board/boardInsert";
	}
	
	
	
}
