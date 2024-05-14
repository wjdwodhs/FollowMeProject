package com.fz.followme.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.TodoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class TodoDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	// todo Insert
	public int insertTodo(TodoDto newTodo) {
		return sqlSessionTemplate.insert("todoMapper.insertTodo", newTodo);
	}
	
	// todo Delete
	public int deleteTodo(int todoNo) {
		return sqlSessionTemplate.delete("todoMapper.deleteTodo", todoNo);
	}
	
	// todo 불러오기
	public List<TodoDto> getTodo(String memNo) {
		return sqlSessionTemplate.selectList("todoMapper.getTodo", memNo);
	}
}
