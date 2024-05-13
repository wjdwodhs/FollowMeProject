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
import org.springframework.web.servlet.ModelAndView;

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
			public ModelAndView calendarPage(ModelAndView mv) {
				List<CalendarDto> list = calendarService.selectCalendarList();
				mv.addObject("list",list)
				  .setViewName("calendar/calendar");
				
				return mv;
			}
		
			// 일정 조회
			@GetMapping(value="/list.do", produces="application/json; charset=utf-8")
		    @ResponseBody
			public List<Map<String, Object>> calendarList() {
			    List<CalendarDto> list = calendarService.selectCalendarList();
			    List<Map<String, Object>> jsonArr = new ArrayList<>();
			    log.debug("list: {}",list);
	
			    for (CalendarDto dto : list) {
			        Map<String, Object> map = new HashMap<>();
			        map.put("calNo", dto.getCalNo());
			        map.put("title", dto.getTitle());
			        map.put("start", dto.getStart());
			        map.put("end", dto.getEnd());
			        map.put("content",dto.getContent());
			        map.put("category", dto.getCategory());
			        map.put("backgroundColor", dto.getCategory());
			        jsonArr.add(map);
			    }
			        log.debug("jsonArrCheck: {}", jsonArr);
			        return jsonArr;
			}
		
		
			// 일정 추가
		    @PostMapping(value = "/insert.do", produces = "application/json; charset=utf-8", consumes = "application/json")
		    @ResponseBody
		    public String calendarInsert(@RequestBody CalendarDto eventData, HttpSession session) {
		        // 일정관리페이지에서 로그인한 회원 번호 뽑아오기
		        MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		        String memNo = loginUser.getMemNo();
		        
		        String title = eventData.getTitle();
		        String content = eventData.getContent();
		        String category = eventData.getCategory();
		        String type = null;
		        // category == red이면 E(직원), blue이면, D(부서), purple이면 C(회사)
		        if(category.equals("#CA848A")) {
		        	type="E";
		        }else if(category.equals("#A78C7B")) {
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
		        
		        if (result > 0) {
		            // 성공적으로 일정을 추가한 경우
		            return "{\"result\": \"success\"}";
		        } else {
		            // 일정 추가 실패한 경우
		            return "{\"result\": \"fail\"}";
		        }
		        
		    }
		    
		    // 일정 수정
		    @PostMapping(value = "/update.do", produces = "application/json; charset=utf-8")
		    @ResponseBody
		    public String calendarUpdate(@RequestBody CalendarDto eventData, HttpSession session) {
		        log.debug("eventData: {}", eventData);

		        // 로그인한 회원 정보 가져오기
		        MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		        String memNo = loginUser.getMemNo();

		        // 이벤트의 제목, 내용, 시작일, 종료일, 카테고리 가져오기
		        int calNo = eventData.getCalNo();
		        String title = eventData.getTitle();
		        String content = eventData.getContent();
		        Date start = eventData.getStart();
		        Date end = eventData.getEnd();
		        String category = eventData.getCategory();
		        String type = null;
		        // category == red이면 E(직원), blue이면, D(부서), purple이면 C(회사)
		        if(category.equals("#CA848A")) {
		        	type="E";
		        }else if(category.equals("#A78C7B")) {
		        	type="D";
		        }else {
		        	type="C";
		        }
		        
		        CalendarDto calendar = CalendarDto.builder()
	                    .memNo(memNo)
	                    .calNo(calNo)
	                    .title(title)
	                    .content(content)
	                    .start(start)
	                    .end(end)
	                    .category(category)
	                    .type(type)
	                    .build();

		        // 여기서 DB 업데이트 로직 수행
		        // updateCalendar 메서드는 이벤트의 ID를 기준으로 DB에서 해당 이벤트를 찾아 업데이트합니다.
		        // 업데이트가 성공하면 true를 반환하고, 실패하면 false를 반환합니다.
		        int result = calendarService.updateCalendar(calendar);
		        
		        if (result > 0) {
		            // 성공적으로 일정을 수정한 경우
		            return "{\"result\": \"success\"}";
		        } else {
		            // 일정 수정 실패한 경우
		            return "{\"result\": \"fail\"}";
		        }
		        
		    }
		    
		    // 일정 삭제
		    @PostMapping(value = "/delete.do", produces = "application/json; charset=utf-8")
		    @ResponseBody
		    public String calendarDelete(@RequestBody Map<String, String> requestData, HttpSession session) {
		        log.debug("requestData: {}", requestData);
		        String calNoStr = requestData.get("no");
		        int calNo = Integer.parseInt(calNoStr);
		     
		        int result = calendarService.deleteCalendar(calNo);
		        
		        if (result > 0) {
		            // 성공적으로 일정을 수정한 경우
		            return "{\"result\": \"success\"}";
		        } else {
		            // 일정 수정 실패한 경우
		            return "{\"result\": \"fail\"}";
		        }
		        
		    }
	

}
