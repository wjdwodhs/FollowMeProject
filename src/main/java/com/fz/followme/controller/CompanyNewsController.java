package com.fz.followme.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.dto.ReplyDto;
import com.fz.followme.service.CompanyNewsService;
import com.fz.followme.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/companyNews")
@RequiredArgsConstructor
@Controller
public class CompanyNewsController {

	private final CompanyNewsService companyNewsService;
	private final PagingUtil pagingUtil;
	
	@RequestMapping("/list.do")
	public ModelAndView comapnyNewsList (@RequestParam(value="page", defaultValue="1") int page, ModelAndView mv){
		
		int companyNewsListCount = companyNewsService.selectCompanyNewsListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(companyNewsListCount, page, 5, 20);
		List<BoardDto> allList = companyNewsService.selectCompanyNewsList(pi);
		log.debug("allList:{}", allList);
		List<BoardDto> newList = companyNewsService.selectLatestPostList();
		
		mv.addObject("pi", pi)
		  .addObject("allList", allList)
		  .addObject("newList", newList)
		  .setViewName("/companyNews/companyNewsList");
		
		return mv;
	
	}
	
	@GetMapping("/increase.do")
	public String increase(int no) {
		
		companyNewsService.updateIncreaseCount(no);
		
		return "redirect:/companyNews/detail.do?no=" + no;
	}
	
	
	@GetMapping("/detail.do")
	public String selectBoardDetail(int no 
								  , Model model
								  , HttpSession session) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		log.debug("no:{}", no);
		BoardDto companyNews = companyNewsService.selectCompanyNewsDetail(no);
		
		model.addAttribute("companyNews",companyNews);
		log.debug("companyNews:{}", companyNews);
		
		return "companyNews/companyNewsDetail";
	}
	
	
	@ResponseBody
	@PostMapping("/replyInsert.do")
	public String replyInsert(ReplyDto reply
							, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		reply.setMemNo(loginUser.getMemNo());
		log.debug("reply:{}", reply);
		return companyNewsService.insertReply(reply) > 0 ? "SUCCESS":"FAIL";
													
	}
	
	@ResponseBody
	@GetMapping(value="/replyList.do", produces="application/json; charset=utf-8")
	public List<ReplyDto> ajaxReplyList(int no){
		log.debug("no: {}", no);
		List<ReplyDto> rList = companyNewsService.selectReplyList(no);
		log.debug("rList: {}", rList);
		return rList;
		
	}
	
	
	@ResponseBody
	@GetMapping("/replyDelete.do")
	public String replyDelete(int no) {
		return companyNewsService.deleteReply(no) > 0 ? "SUCCESS":"FAIL";
	}
	
	
	
	
	
}
