package com.fz.followme.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
	@PostMapping("/login.do")
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
			
			// 로그인 시 사번 저장 (쿠키 저장)
			if ("SAVE".equals(request.getParameter("memNoSaveCheck"))) {
				Cookie cookie = new Cookie("savedMemNo", loginUser.getMemNo());
				cookie.setMaxAge(30*24*60*60); // 30일 저장 유효기간
				cookie.setPath("/");
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("savedMemNo", loginUser.getMemNo());
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			
			out.println("alert('" + loginUser.getMemName() + "님 환영합니다.');");
			
			if(loginUser.getAuthLevel().equals("3")) {
				out.println("location.href = '" + request.getContextPath() + "/ceoMain.page';");
			} else {
				out.println("location.href = '" + request.getContextPath() + "/employeeMain.page';");
			}
			
		} else {
			out.println("alert('로그인에 실패했습니다. 사번 및 비밀번호를 다시 확인해주세요.');");
			out.println("history.back();");
		}
		out.println("</script>");
		
	}
	
	// 마이페이지로 이동
	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest request, Model model) {
		
		MemberDto m = (MemberDto)request.getSession().getAttribute("loginUser");
		MemberDto mypageUser = memberService.selectMember(m);
		
		model.addAttribute("mypageUser", mypageUser);
		
		return "member/mypage";
	}
	
	
	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 마이페이지 계좌실명인증
	
	
	
	
	
	

}
