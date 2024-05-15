package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.CalendarDto;



public interface CalendarService {

		// 일정조회 - 일정 리스트 조회 서비스 
		List<CalendarDto> selectCalendarList(String memNo);

		// 일정추가 - 일정 등록 서비스
		int insertCalendar(CalendarDto calendar);

		// 일정수정 - 일정 수정 서비스
		int updateCalendar(CalendarDto calendar);

		// 일정삭제 - 일정 삭제 서비스
		int deleteCalendar(int calNo);

		// 일정조회 - 일정 카테고리별 조회 서비스 
		List<CalendarDto> selectCalendarTypeList(CalendarDto calendar);

		
}
