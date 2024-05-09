package com.fz.followme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.fz.followme.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@RequiredArgsConstructor
@Controller
public class BoardController {
	
	
	private final PagingUtil pagingUtil;
	
	@RequestMapping("/socialFeed.page")
	public void socialFeedPage() {}
	
	
	@RequestMapping("/boardList.page")
	public String boardListPage() {
		return "board/boardList";
	}
	
	@RequestMapping("/boardInsert.page")
	public String boardInsertPage() {
		return "board/boardInsert";
	}
	
	
	
}
