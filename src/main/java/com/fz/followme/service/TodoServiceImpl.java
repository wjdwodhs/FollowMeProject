package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.TodoDao;
import com.fz.followme.dto.TodoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TodoServiceImpl implements TodoService {
	
	private final TodoDao todoDao;

	@Override
	public int insertTodo(TodoDto newTodo) {
		return todoDao.insertTodo(newTodo);
	}

	@Override
	public int deleteTodo(int todoNo) {
		return todoDao.deleteTodo(todoNo);
	}

	@Override
	public List<TodoDto> getTodo(String memNo) {
		return todoDao.getTodo(memNo);
	}

}
