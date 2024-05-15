package com.fz.followme.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.controller.CalendarController;
import com.fz.followme.dto.CalendarDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Repository
public class CalendarDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<CalendarDto> selectCalendarList(String memNo) {
		return sqlSessionTemplate.selectList("calendarMapper.selectCalendarList",memNo);
	}

	public int insertCalendar(CalendarDto calendar) {
		return sqlSessionTemplate.insert("calendarMapper.insertCalendar", calendar);
	}

	public int updateCalendar(CalendarDto calendar) {
		return sqlSessionTemplate.update("calendarMapper.updateCalendar",calendar);
	}

	public int deleteCalendar(int calNo) {
		return sqlSessionTemplate.delete("calendarMapper.deleteCalendar",calNo);
	}

	public List<CalendarDto> selectCalendarTypeList(CalendarDto calendar) {
		return sqlSessionTemplate.selectList("calendarMapper.selectCalendarTypeList",calendar);
	}
}
