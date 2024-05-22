package com.fz.followme.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fz.followme.dto.AttendanceDto;
import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.OrderDto;
import com.fz.followme.service.AttendanceService;
import com.fz.followme.service.DocumentService;
import com.fz.followme.service.NoticeService;
import com.fz.followme.service.OrderService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HomeController {

	
	private final OrderService orderService;
	private final NoticeService noticeService;
	private final DocumentService documentService;
	private final AttendanceService attendanceService;
	
	@RequestMapping("/")
	public String mainPage() {

		return "loginMain";
	}
	
	@RequestMapping("/employeeMain.page")
	public String employeeMainPage() {
		return "employeeMain";
	}
	
	@RequestMapping("/ceoMain.page")
	public String ceoMainPage(Model model, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String memNo = loginUser.getMemNo();
		AttendanceDto Dto = attendanceService.selectStatus(memNo); // 로그인한 유저의 근태 유형 가져오기
		List<AttendanceDto> attDtoList = attendanceService.selectAttendance(memNo);
		
		MemberDto m = new MemberDto();
		m.setMemNo(loginUser.getMemNo());
		m.setDeptNo(loginUser.getDeptNo());
		m.setMemGrade(loginUser.getMemGrade());
		
		// 본인이 결재권자일때, 미처리 결재건의 갯수
		int notDoneCount = documentService.notDoneCount(m);
		// 본인이 조회할 권한이 있는 문서 중, '진행중'인 문서의 모든 갯수
		int pendCount = documentService.pendCount(m);
		// 본인이 조회할 권한이 있는 문서 중, 오늘자로 최종 승인 처리된 문서의 갯수
		int approvalCount = documentService.approvalCount(m);
		// 본인이 조회할 권한이 있는 문서 중, 오늘자로 반려 처리된 문서의 갯수
		int rejectCount = documentService.rejectCount(m);

		model.addAttribute("notDoneCount", notDoneCount);
	    model.addAttribute("pendCount", pendCount);
	    model.addAttribute("approvalCount", approvalCount);
	    model.addAttribute("rejectCount", rejectCount);
		
		OrderDto revenueList = orderService.selectRevenue();
		OrderDto todayInfo = orderService.selectTodayInfo();
		
		model.addAttribute("attDtoList",attDtoList);
		model.addAttribute("Dto",Dto);
		model.addAttribute("revenueList", revenueList);	
		model.addAttribute("todayInfo", todayInfo);
		
		List<BoardDto> latestNoticeList = noticeService.selectLatestPostList();
		
		model.addAttribute("latestNoticeList", latestNoticeList);
		
		return "ceoMain";
	}
	
	
	@RequestMapping("/attendance.page")
	public String attendancePage() {
		return "attendance/attendance";
	}

   
}