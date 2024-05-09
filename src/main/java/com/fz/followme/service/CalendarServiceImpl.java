package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.CalendarDao;
import com.fz.followme.dto.CalendarDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CalendarServiceImpl implements CalendarService{

	private final CalendarDao CalendarDao;
	
	@Override
	public List<CalendarDto> selectCalendarList() {
		return  CalendarDao.selectCalendarList();
	}

}
