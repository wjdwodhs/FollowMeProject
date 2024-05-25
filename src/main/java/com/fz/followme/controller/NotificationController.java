package com.fz.followme.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fz.followme.dao.NotificationDao;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.NotificationDto;
import com.fz.followme.handler.AlarmEchoHandler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping
@Controller
public class NotificationController {
	
	
	private final AlarmEchoHandler handler;
	private final NotificationDao notiDao;
	
	@ResponseBody
	@PostMapping(value="/echo", produces="application/json; charset=utf-8")
	public List<NotificationDto> selectList(HttpSession session){
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String memNo = loginUser.getMemNo();
		return notiDao.selectList(memNo);
	}
	
	@ResponseBody
	@PostMapping(value="/updateAlarm", produces="application/json; charset=utf-8")
	public String updateAlarm(HttpSession session){
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");

		return notiDao.updateAlarm(loginUser) > 0 ? "SUCCESS" : "FAIL" ;
	}

	@ResponseBody
	@PostMapping(value="/deleteAlarm", produces="application/json; charset=utf-8")
	public String deleteAlarm(HttpSession session){
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");

		return notiDao.deleteAlarm(loginUser) > 0 ? "SUCCESS" : "FAIL" ;
	}
	
	
}
