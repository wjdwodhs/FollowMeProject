package com.fz.followme.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.dto.ReplyDto;
import com.fz.followme.service.NoticeService;
import com.fz.followme.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/notice")
@RequiredArgsConstructor
@Controller
public class NoticeController {
	
	private final NoticeService noticeService;
	private final PagingUtil pagingUtil;
	
	@RequestMapping("/list.do")
	public ModelAndView noticeList(@RequestParam(value="page", defaultValue="1") int page, ModelAndView mv) {
		
		int noticeListCount = noticeService.selectNoticeListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(noticeListCount, page, 5, 20);
		List<BoardDto> allList = noticeService.selectNoticeList(pi);
		log.debug("allList:{}",allList);
		List<BoardDto> newList = noticeService.selectLatestPostList();
		log.debug("newList:{}",newList);

		mv.addObject("pi", pi)
		  .addObject("allList", allList)
		  .addObject("newList", newList)
		  .setViewName("/notice/noticeList");
		
		return mv;
	}
	
	
	@GetMapping("/increase.do")
	public String increase(int no) {
		
		noticeService.updateIncreaseCount(no);
		
		return "redirect:/notice/detail.do?no=" + no;
	}
	
	
	@GetMapping("/detail.do")
	public String selectBoardDetail(int no 
								  , Model model
								  , HttpSession session) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		log.debug("no:{}", no);
		BoardDto notice = noticeService.selectNoticeDetail(no);
		
		model.addAttribute("notice",notice);
		log.debug("notice:{}", notice);
		
		return "notice/noticeDetail";
	}
	
	@ResponseBody
	@PostMapping("/replyInsert.do")
	public String replyInsert(ReplyDto reply
							, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		reply.setMemNo(loginUser.getMemNo());
		log.debug("reply:{}", reply);
		return noticeService.insertReply(reply) > 0 ? "SUCCESS":"FAIL";
													
	}
	
	@ResponseBody
	@GetMapping(value="/replyList.do", produces="application/json; charset=utf-8")
	public List<ReplyDto> ajaxReplyList(int no){
		log.debug("no: {}", no);
		List<ReplyDto> rList = noticeService.selectReplyList(no);
		log.debug("rList: {}", rList);
		return rList;
		
	}
	
	
	@ResponseBody
	@GetMapping("/replyDelete.do")
	public String replyDelete(int no) {
		return noticeService.deleteReply(no) > 0 ? "SUCCESS":"FAIL";
	}
	
	
	
	
}
