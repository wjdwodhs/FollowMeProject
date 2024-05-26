package com.fz.followme.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fz.followme.dto.AttendanceDto;
import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.OrderDto;
import com.fz.followme.service.AttendanceService;
import com.fz.followme.service.DocumentService;
import com.fz.followme.service.MemberService;
import com.fz.followme.service.NoticeService;
import com.fz.followme.service.OrderService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class HomeController {

	
	private final OrderService orderService;
	private final NoticeService noticeService;
	private final DocumentService documentService;
	private final AttendanceService attendanceService;
	private final MemberService memberService;
	
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
		AttendanceDto userAtt = (AttendanceDto)session.getAttribute("userAtt");
		
		

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

		model.addAttribute("userAtt",userAtt);
		model.addAttribute("revenueList", revenueList);	
		model.addAttribute("todayInfo", todayInfo);
		
		List<BoardDto> latestNoticeList = noticeService.selectLatestPostList();
		
		model.addAttribute("latestNoticeList", latestNoticeList);
		
		return "ceoMain";
	}
	
	// 상단바 검색창에서 직원 검색 시 직원 정보 조회
	@GetMapping("/memberSearchPopUp")
    public String getEmployeeInfo(@RequestParam("memName") String memName, Model model) {
		log.debug("memName : {}", memName);
        MemberDto member = memberService.searchMemberInfoByName(memName);
        log.debug("member : {}", member);
        
        if (member != null) {
            model.addAttribute("member", member);
        } else {
            model.addAttribute("errorMessage", "직원 정보를 찾을 수 없습니다.");
        }

        return "member/memberInfoPopUp";
    }

}