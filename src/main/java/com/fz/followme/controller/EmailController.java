package com.fz.followme.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.EmailDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.service.EmailService;
import com.fz.followme.util.FileUtil;
import com.fz.followme.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/email")
@Controller
public class EmailController {

	private final EmailService emailService;
	private final FileUtil fileUtil;
	private final PagingUtil pagingUtil;
	
	
	// 이메일 목록
	@RequestMapping("/email.page")
	public String emailInbox(HttpServletRequest request, HttpSession session) {
		return "email/emailInbox";
	}

	
	
	// =================================================================

	// 메일작성페이지
	@RequestMapping("/composeForm.do")
	public ModelAndView emailCompose(ModelAndView mv) {
		
		List<EmailDto> memList = emailService.selectMemberList();
		mv.addObject("memList", memList)
		  .setViewName("email/emailComposeForm");
		
		return mv;
	}
	
	// 메일 보내기
	@PostMapping(value="/sendemail.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public String sendEmail(EmailDto ed, HttpServletRequest request
			              , @RequestParam(value="uploadFiles[]", required=false) List<MultipartFile> uploadFiles) {
		
		
		List<AttachmentDto> atList = new ArrayList<>();
		
		if(uploadFiles != null && !uploadFiles.isEmpty()) {
			for(MultipartFile uploadFile : uploadFiles) {
				if(uploadFile != null && !uploadFile.isEmpty()) {
					Map<String, String> map = fileUtil.fileUpload(uploadFile, "email");
					atList.add(AttachmentDto.builder()
							                .filePath(map.get("filePath"))
							                .originName(map.get("originalName"))
							                .systemName(map.get("filesystemName"))
							                .type("E")
							                .build());
					
				}
			}
		}	
		ed.setAttachList(atList);
		
		emailService.sendEmail(ed, atList);
		
		JSONObject response = new JSONObject();
	    response.put("redirect", request.getContextPath() + "/email/email.page");
	    return response.toString();
	}
	
	
	
	// =======================================================
	
	// 보낸메일함
	@RequestMapping("/outbox.bo")
	public ModelAndView outbox(@RequestParam(value="page", defaultValue="1") int currentPage
			                   , ModelAndView mv) {
		
		// 보낸메일 목록 조회, 페이징
		int listCount = emailService.selectOutBoxListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EmailDto> outList = emailService.selectOutBoxList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("outList", outList)
		  .setViewName("email/emailOutbox");
		
		
		return mv;
	}
	
	
	
	
	// ==========================================================
	
	// 메일 상세내용 수정해야함
	@RequestMapping("/readMail.do")
	public String emailRead() {
		return "email/emailRead";
	}
	
	

	
	
	
	
}
