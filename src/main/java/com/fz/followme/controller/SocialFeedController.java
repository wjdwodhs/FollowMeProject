package com.fz.followme.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fz.followme.util.PagingUtil;
import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.SocialFeedDto;

import com.fz.followme.dto.MemberDto;
import com.fz.followme.service.SocialFeedService;
import com.fz.followme.util.FileUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/feed")
@Controller
public class SocialFeedController {

	private final SocialFeedService socialFeedService;
	private final FileUtil fileUtil;
	
	
	// 소셜피드 페이지로 이동
	@RequestMapping("")
	public String socialFeedPage(Model model) {
		model.addAttribute("socialFeed", socialFeedService.selectList());
		
		return "feed/socialFeed";
	}

	
	@PostMapping("/insert")
	public String regist(SocialFeedDto socialFeed
					   , List<MultipartFile> uploadFiles
			      	   , HttpSession session
			      	   , RedirectAttributes redirectAttributes) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		
		List<AttachmentDto> attachList = new ArrayList<>();
		log.debug("socialFeed: {}", socialFeed);
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				// 파일 업로드
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "feed");
				
				// insert할 데이터 => AttachDto객체 만들고 => attachList쌓기
				attachList.add(AttachmentDto.builder()
					    .filePath(map.get("filePath"))
					    .systemName(map.get("filesystemName"))
					    .originName(map.get("originalName"))
					    .type("S")
					    .build());
			}
		}
		
		socialFeed.setAttachList(attachList); // 첨부파일이 없었을 경우 텅빈 리스트가 담김
		
		int result = socialFeedService.insertFeed(socialFeed);
		
		// 성공시 => alert메세지와 함께 목록페이지로 이동
		// 실패시 => alert메세지와 함께 작성페이지에 그대로
		
		if(attachList.isEmpty() && result == 1 || !attachList.isEmpty() && result == attachList.size()) {
			redirectAttributes.addFlashAttribute("alertMsg", "피드를 작성했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "피드 작성에 실패했습니다.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		
		return "redirect:/feed";
	}
	
	
	
}
