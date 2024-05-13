package com.fz.followme.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fz.followme.dto.CalendarDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.service.CalendarService;
import com.fz.followme.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/calendar")
@RequiredArgsConstructor
@Controller
public class CalendarController {
	
	private final CalendarService calendarService;
	
		@RequestMapping("/calendar.page")
		public String calendarPage() {
			return "calendar/calendar";
		}
	
		// 일정 리스트 조회
		@GetMapping(value="/calendar.do", produces="application/json; charset=utf-8")
	    @ResponseBody
		public List<Map<String, Object>> calendarList() {
		    List<CalendarDto> list = calendarService.selectCalendarList();
		    List<Map<String, Object>> jsonArr = new ArrayList<>();
		    log.debug("list: {}",list);

		    for (CalendarDto dto : list) {
		        Map<String, Object> map = new HashMap<>();
		        map.put("title", dto.getTitle());
		        map.put("start", dto.getStart());
		        map.put("end", dto.getEnd());
		        map.put("content",dto.getContent());
		        map.put("category", dto.getCategory());
		        jsonArr.add(map);
		    }
		    log.debug("jsonArrCheck: {}", jsonArr);
		    return jsonArr;
		}
		
		
			// 일정 추가
		    @PostMapping(value = "/calendarInsert.do", produces = "application/json; charset=utf-8")
		    @ResponseBody
		    public String calendarInsert(@RequestBody CalendarDto eventData, HttpSession session) {
		        log.debug("eventData: {}", eventData);
		        
		        // 일정관리페이지에서 로그인한 회원 번호 뽑아오기
		        MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		        String memNo = loginUser.getMemNo();
		        String title = eventData.getTitle();
		        String content = eventData.getContent();
		        String category = eventData.getCategory();
		        String type = null;
		        // category == red이면 E, blue이면, D, purple이면 C
		        if(category.equals("red")) {
		        	type="E";
		        }else if(category.equals("blue")) {
		        	type="D";
		        }else {
		        	type="C";
		        }
		        Date start = eventData.getStart();
		        Date end = eventData.getEnd();
		        
	
		        CalendarDto calendar = CalendarDto.builder()
	                    .memNo(memNo)
	                    .title(title)
	                    .content(content)
	                    .start(start)
	                    .end(end)
	                    .category(category)
	                    .type(type)
	                    .build();
		        int result = calendarService.insertCalendar(calendar);
		        
		        
		        if(result>0) {
		        	return "success"; 
		        }else {
		        	return "fail";
		        }
		        
		    }
	

}
