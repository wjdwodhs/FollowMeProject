package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.TodoDto;

public interface TodoService {

	// to-do Insert
	int insertTodo(TodoDto newTodo);
	
	// to-do delete
	int deleteTodo(int todoNo);
	
	// to-do 불러오기
	List<TodoDto> getTodo(String memNo);
}
