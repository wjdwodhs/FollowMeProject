package com.fz.followme.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.TodoDto;
import com.fz.followme.service.DocumentService;
import com.fz.followme.service.TodoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/ceoMain")
@RequiredArgsConstructor
@Controller
public class CeoMainController {
	
	private final TodoService todoService;
	private final DocumentService documentService;

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
	
	

	/**
	 * 메인화면 오늘의 전자결재 문서의 개수를 반환하는 메소드
	 * @param count 전자문서의 갯수
	 * @param loginUser : session 로그인한 사원 정보가 담겨있는 Member 객체
	 * @author 이주리 
	 *
	@GetMapping
	public String countDocument(Model model, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		
		MemberDto m = new MemberDto();
		m.setMemNo(loginUser.getMemNo());
		m.setDeptNo(loginUser.getDeptNo());
		m.setMemGrade(loginUser.getMemGrade());
		
		// 본인이 결재권자일때, 미처리 결재건의 갯수
		int notDoneCount = documentService.notDoneCount(m);
		// 본인이 조회할 권한이 있는 문서 중, '진행중'인 문서의 모든 갯수
		int pendCount = documentService.pendCount(m);
		// 본인이 조회할 권한이 있는 문서 중, 오늘자로 최종 승인 처리된 문서의 갯수
		int approvalCount = documentService.approvalCount(m);
		// 본인이 조회할 권한이 있는 문서 중, 오늘자로 반려 처리된 문서의 갯수
		int rejectCount = documentService.rejectCount(m);
		
		log.debug("notDoneCount: {}", notDoneCount);
		log.debug("pendCount: {}", pendCount);
		log.debug("approvalCount: {}", approvalCount);
		log.debug("rejectCount: {}", rejectCount);

		model.addAttribute("notDoneCount", notDoneCount);
	    model.addAttribute("pendCount", pendCount);
	    model.addAttribute("approvalCount", approvalCount);
	    model.addAttribute("rejectCount", rejectCount);
		
		return "ceoMain";
	}
	*/
}
