package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.CalendarDto;



public interface CalendarService {

		// 일정관리 - 일정 리스트 조회 서비스 
		List<CalendarDto> selectCalendarList();

		// 일정추가 - 일정 등록 서비스
		int insertCalendar(CalendarDto calendar);

		
}
