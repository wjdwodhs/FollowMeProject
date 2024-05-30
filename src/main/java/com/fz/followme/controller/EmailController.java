package com.fz.followme.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
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
import com.fz.followme.dto.EmailDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.pop3.Pop3EmailReceiver;
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
	private final Pop3EmailReceiver pop3EmailReceiver;
	
	
	// ========================================================================
	
	// 수신이메일 목록
	@RequestMapping("/email.page")
	public ModelAndView emailInbox(@RequestParam(value="page", defaultValue="1") int currentPage
							, ModelAndView mv) {
		
		try {
			// 이메일수신
			pop3EmailReceiver.receiveEmails();  
		} catch(Exception e){
			e.printStackTrace();
		}
		
		
		// 받은메일 목록 조회
		int listCount = emailService.selectInBoxListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<EmailDto> inList = emailService.selectInBoxList(pi);
	
		mv.addObject("pi", pi)
		  .addObject("inList", inList)
		  .setViewName("/email/emailInbox");
		
		
		return mv;
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
		
		log.debug("outList : {}" , outList);
		
		return mv;
	}
	
	
	// 보낸메일함에서 선택된 메일 휴지통으로 이동
	@ResponseBody
	@PostMapping(value="/updatetrash.do", produces="application/json; charset=utf-8")
	public int ajaxUpdateMailStatusTrash(@RequestParam("checkMailStr") int[] checkMail) {
		log.debug("checkMail:{}", checkMail);
		
		return emailService.updateMailStatusTrash(checkMail);
	}
	
	
	// ==========================================================
	
	// 메일 상세내용 
	@GetMapping("/readsendmail.do")
	public String emailRead(int no, Model model) {
		
		model.addAttribute("email", emailService.selectSendMail(no));
		
		return "email/emailRead";
	}
	
	
	// 메일 상세내용에서 휴지통으로 이동
	@GetMapping("/detailtrash.do")
	public String updateDetailMaileStatusTrash(int no, RedirectAttributes redirectAttributes) {
		int result = emailService.updateDetailMailTrash(no);
	
		log.debug("no : {}", no);
		
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "해당 메일을 휴지통으로 이동합니다.");
		}
		
		return "redirect:/email/outbox.bo";
	
	}
	
	
	// ==========================================================

	
	
}
