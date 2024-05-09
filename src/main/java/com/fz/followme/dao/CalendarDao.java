package com.fz.followme.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.CalendarDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CalendarDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<CalendarDto> selectCalendarList() {
		return sqlSessionTemplate.selectList("calendarMapper.selectCalendarList");
	}
}
