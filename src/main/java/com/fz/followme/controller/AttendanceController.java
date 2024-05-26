package com.fz.followme.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fz.followme.dto.AttendanceDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.handler.AlarmEchoHandler;
import com.fz.followme.service.AttendanceService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/attendance")
@RequiredArgsConstructor
@Controller
public class AttendanceController {
	
	private final AttendanceService attendanceService;
	private final AlarmEchoHandler handler;

	// 출근 시간 입력
    @PostMapping(value = "/insert.do", produces = "application/json; charset=utf-8", consumes = "application/json")
    @ResponseBody
    public String attendanceInsert(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
      
        MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
        String memNo = loginUser.getMemNo();
 
        int result = attendanceService.insertWorktime(memNo);
        AttendanceDto userAtt = attendanceService.selectAttendance(memNo);
        request.getSession().setAttribute("userAtt", userAtt);
        
        log.debug("insert 후 userAtt: {}", userAtt);
        
        if (result > 0) {
            
            TextMessage message = new TextMessage("성공");
        	handler.broadcastMessageToUser(memNo, message);
        	
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
    public String attendanceUpdate(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
      
        MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
        String memNo = loginUser.getMemNo();
        
        int result = attendanceService.updateWorktime(memNo);
        AttendanceDto userAtt = attendanceService.selectAttendance(memNo);
        request.getSession().setAttribute("userAtt", userAtt);
        log.debug("update 후 userAtt: {}", userAtt);
        
        if (result > 0) {
        	
            TextMessage message = new TextMessage("성공");
        	handler.broadcastMessageToUser(memNo, message);
        	
            // 성공적으로 출퇴근 시간을 추가한 경우
            return "{\"result\": \"success\"}";
        } else {
            // 실패한 경우
            return "{\"result\": \"fail\"}";
        }
        
    }

     // 근태 조회
    @RequestMapping("/list.do")
	public ResponseEntity <AttendanceDto> ceoMainPage(ModelAndView mv, HttpSession session) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
	    String memNo = loginUser.getMemNo();
	    
	    AttendanceDto attDto = attendanceService.selectAttendance(memNo);

	    return ResponseEntity.ok(attDto); // JSON 형태로 AttendanceDto 리스트 반환
		
	}
    
    
    
    
    
    
    
    
    
    
    
    
    
}
