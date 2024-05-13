package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.CalendarDao;
import com.fz.followme.dto.CalendarDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CalendarServiceImpl implements CalendarService{

	private final CalendarDao calendarDao;
	
	@Override
	public List<CalendarDto> selectCalendarList() {
		return  calendarDao.selectCalendarList();
	}

	@Override
	public int insertCalendar(CalendarDto calendar) {
		
		return calendarDao.insertCalendar(calendar);
	}

	@Override
	public int updateCalendar(CalendarDto calendar) {
		return calendarDao.updateCalendar(calendar);
	}

	@Override
	public int deleteCalendar(int calNo) {
		return calendarDao.deleteCalendar(calNo);
	}

	

}
