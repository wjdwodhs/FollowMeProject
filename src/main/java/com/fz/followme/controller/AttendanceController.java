package com.fz.followme.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fz.followme.dto.AttendanceDto;
import com.fz.followme.dto.CalendarDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.service.AttendanceService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/attendance")
@RequiredArgsConstructor
@Controller
public class AttendanceController {
	
	private final AttendanceService attendanceService;
	
	// 출근 시간 입력
    @PostMapping(value = "/insert.do", produces = "application/json; charset=utf-8", consumes = "application/json")
    @ResponseBody
    public String attendanceInsert(HttpSession session) {
      
        MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
        String memNo = loginUser.getMemNo();
        
       
        
        int result = attendanceService.insertWorktime(memNo);
        
        if (result > 0) {
            // 성공적으로 출퇴근 시간을 추가한 경우
            return "{\"result\": \"success\"}";
        } else {
            // 실패한 경우
            return "{\"result\": \"fail\"}";
        }
        
    }
    
    // 퇴근 시간 입력
    @GetMapping(value = "/update.do", produces = "application/json; charset=utf-8", consumes = "application/json")
    @ResponseBody
    public String attendanceUpdate(HttpSession session) {
      
        MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
        String memNo = loginUser.getMemNo();
        
        int result = attendanceService.updateWorktime(memNo);
        
        if (result > 0) {
            // 성공적으로 출퇴근 시간을 추가한 경우
            return "{\"result\": \"success\"}";
        } else {
            // 실패한 경우
            return "{\"result\": \"fail\"}";
        }
        
    }

     // 근태 유형 조회
    @RequestMapping("/ceoMain.page")
	public ModelAndView ceoMainPage(ModelAndView mv, HttpSession session) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
	    String memNo = loginUser.getMemNo();
	    
	    AttendanceDto Dto = attendanceService.selectStatus(memNo);
		mv.addObject("Dto",Dto)
		  .setViewName("ceoMain");
		
		return mv;
		
	}
    
    
    
    
    
    
    
    
    
    
    
    
    
}
