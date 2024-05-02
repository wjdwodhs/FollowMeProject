package com.fz.followme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board")
@Controller
public class BoardController {
	
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
