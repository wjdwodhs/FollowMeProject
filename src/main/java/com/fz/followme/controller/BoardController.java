package com.fz.followme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/insert.do")
	public String boardInsert() {
		return "/board/boardInsert";
	}
	
	@RequestMapping("/list.do")
	public String boardList() {
		return "/board/boardList";
	}
	
	
}
