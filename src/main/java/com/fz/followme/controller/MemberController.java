package com.fz.followme.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fz.followme.dto.MemberDto;
import com.fz.followme.service.MemberService;
import com.fz.followme.util.FileUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@RequiredArgsConstructor
@Controller
public class MemberController {
	
	private final MemberService memberService;
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	private final FileUtil fileUtil;

	// 로그인
	@RequestMapping("/login.do")
	public void login(MemberDto m,
						HttpServletRequest request,
						HttpServletResponse response) throws IOException {
						
		
		log.debug("m: {}", m);
		MemberDto loginUser = memberService.selectMember(m);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		
		if(loginUser != null && bcryptPwdEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {
			request.getSession().setAttribute("loginUser", loginUser);
			out.println("alert('" + loginUser.getMemName() + "님 환영합니다.');");
			out.println("location.href = '" + request.getContextPath() + "/employeeMain.page';");
		} else {
			out.println("alert('로그인에 실패했습니다. 사번 및 비밀번호를 다시 확인해주세요.');");
			out.println("history.back();");
		}
		out.println("</script>");
		
	}
}
