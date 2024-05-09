package com.fz.followme.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fz.followme.dto.CalendarDto;
import com.fz.followme.service.CalendarService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/calendar")
@RequiredArgsConstructor
@Controller
public class CalendarController {
	
	private final CalendarService calendarService;
	
	public ModelAndView selectCalendarList(ModelAndView mv) {
		
		List<CalendarDto> list = null;
		list = calendarService.selectCalendarList();
	
		
		mv.addObject("list", list)
		  .setViewName("calendar/calendar");
		
		return mv;
	}
	

}
