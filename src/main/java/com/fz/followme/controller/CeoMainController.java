package com.fz.followme.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.TodoDto;
import com.fz.followme.service.TodoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/ceoMain")
@RequiredArgsConstructor
@Controller
public class CeoMainController {
	
	private final TodoService todoService;

	@ResponseBody
	@PostMapping("/insertTodo")
	public TodoDto todoInsert(String todoText, HttpServletRequest request) {
	    MemberDto loginUser = (MemberDto)request.getSession().getAttribute("loginUser");
	    String memNo = loginUser.getMemNo();
	    
	    TodoDto newTodo = new TodoDto();
	    newTodo.setContent(todoText);
	    newTodo.setMemNo(memNo);
	    
	    int result = todoService.insertTodo(newTodo);
	    
	    TodoDto insertedTodo = todoService.selectTodo(todoText);
	    		
	    log.debug("newTodo : {}", newTodo);
	    log.debug("insertedTodo : {}", insertedTodo);
	    
	    if(result > 0) {
	        return insertedTodo; // 새로 생성된 Todo의 정보를 반환
	    } else {
	        return null;
	    }
	}

	
	
	@ResponseBody
	@PostMapping("/deleteTodo")
	public int deleteTodo(int todoNo) {
		
		int result = todoService.deleteTodo(todoNo);
		
		return result;
		
	}
	
	
	@ResponseBody
	@GetMapping("/getTodo")
	public Map<String, Object> getTodo(HttpServletRequest request) {
		
		MemberDto loginUser = (MemberDto)request.getSession().getAttribute("loginUser");
		String memNo = loginUser.getMemNo();
		
		List<TodoDto> todoList = todoService.getTodo(memNo);
		log.debug("todoList : {}", todoList);
		
		Map<String, Object> response = new HashMap<>();
	    response.put("todoList", todoList);
	    return response;
	}
}
