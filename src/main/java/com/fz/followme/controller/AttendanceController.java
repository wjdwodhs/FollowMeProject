package com.fz.followme.controller;

import java.time.LocalTime;
import java.time.Year;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.TextMessage;

import com.fz.followme.dto.AttendanceDto;
import com.fz.followme.dto.LeavepDto;
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

	@RequestMapping("/attendance.page")
	public ModelAndView attendancePage(ModelAndView mv, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
	    String memNo = loginUser.getMemNo();
	    int ableDate = Year.now().getValue();

	    // 월별 근무시간 및 평균 근무시간
	    AttendanceDto attDto = attendanceService.monthAttendanceTime(memNo);
	    
	    // 총 근무시간 및 근무일수
	    AttendanceDto totalDto = attendanceService.totalAttendanceTime(memNo);
	    
	    LeavepDto le = LeavepDto.builder()
	    		.memNo(memNo)
	    		.ableDate(ableDate)
	    		.build();
	    
	    
	    // 잔여 연차 정보 조회
	    
	    int defaultLeave = 12; 
	    int leftLeave = attendanceService.selectLeave(le);
	    
	    if (leftLeave == 0) {
	        leftLeave = defaultLeave;
	    } 
	   
	    if (attDto == null) {
	        attDto = new AttendanceDto();
	        attDto.setWorkingDays(0); 
	        attDto.setMonthWorkTime(0); 
	        attDto.setAvgWorkTime(0); 
	    }

	    if (totalDto == null) {
	        totalDto = new AttendanceDto();
	        totalDto.setTotalWorkingDays(0); 
	        totalDto.setTotalWorkTime(0); 
	    }
	    
	    // 타입별 출석 데이터
	    List<AttendanceDto> countList = attendanceService.countAttendanceByType(memNo);
	    Map<String, Integer> countMap = new HashMap<>();

        for (AttendanceDto attendance : countList) {
            countMap.put(attendance.getType(), attendance.getCount());
        }

        for (String type : new String[]{"B", "C", "D", "E"}) {
            countMap.putIfAbsent(type, 0);
        }
        
		mv.addObject("countMap",countMap)
		  .addObject("attDto",attDto)
		  .addObject("totalDto",totalDto)
		  .addObject("leftLeave",leftLeave)
		  .setViewName("attendance/attendance");
		
		return mv;
	
	}
	
	// 출근 시간 입력
    @PostMapping(value = "/insert.do", produces = "application/json; charset=utf-8", consumes = "application/json")
    @ResponseBody
    public String attendanceInsert(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
      
        MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
        String memNo = loginUser.getMemNo();
 
        LocalTime currentTime = LocalTime.now();
        LocalTime startTime = LocalTime.of(9, 0); // 출근 시간
        
        
        String attendanceType = "A"; // 기본값은 정상 출근
        if (currentTime.isAfter(startTime)) {
        	attendanceType = "E"; // 현재 시간이 출근 시간을 넘었을 경우 지각으로 변경
        }
        
        AttendanceDto att = AttendanceDto.builder()
                .memNo(memNo)
                .type(attendanceType)
                .build();
        
        
        int result = attendanceService.insertWorktime(att);
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

     // 근태 조회 (오늘 날짜)
    @RequestMapping("/list.do")
	public ResponseEntity <AttendanceDto> ceoMainPage(ModelAndView mv, HttpSession session) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
	    String memNo = loginUser.getMemNo();
	    
	    AttendanceDto attDto = attendanceService.selectAttendance(memNo);

	    return ResponseEntity.ok(attDto); // JSON 형태로 AttendanceDto 리스트 반환
		
	}
    
    // Ajax 월별 근태 조회
	@GetMapping(value="/attlist.do", produces="application/json; charset=utf-8")
    @ResponseBody
	public ResponseEntity<Map<String, Object>> attList(@RequestParam String year, 
						@RequestParam String month, HttpSession session) {
		
		 MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
	     String memNo = loginUser.getMemNo();
	     
	     AttendanceDto att = AttendanceDto.builder()
	                .memNo(memNo)
	                .currentYear(year)
	                .currentMonth(month)
	                .build();
	     
	    // 월별 근무시간 및 평균 근무시간
	    AttendanceDto attDto = attendanceService.AjaxMonthAttendanceTime(att);
	    
	    // 결과가 없는 경우 기본값으로 0으로 설정
	    if (attDto == null) {
	        attDto = new AttendanceDto();
	        attDto.setWorkingDays(0); 
	        attDto.setMonthWorkTime(0); 
	        attDto.setAvgWorkTime(0); 
	    }
	    
	    // 타입별 출석 데이터
	    List<AttendanceDto> countList = attendanceService.AjaxCountAttendanceByType(att);
	    Map<String, Integer> countMap = new HashMap<>();

        for (AttendanceDto attendance : countList) {
            countMap.put(attendance.getType(), attendance.getCount());
        }

        // 모든 타입(B, C, D, E)에 대해 기본 값 0을 설정
        for (String type : new String[]{"B", "C", "D", "E"}) {
            countMap.putIfAbsent(type, 0);
        }
	    
	    Map<String, Object> data = new HashMap<>();
        data.put("attDto", attDto);
        data.put("countMap", countMap);

	    
	    return ResponseEntity.ok(data);
	     
	}
    
    
    
    
    
    
    
    
    
    
    
    
    
}
