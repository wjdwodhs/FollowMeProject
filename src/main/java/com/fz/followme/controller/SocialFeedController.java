package com.fz.followme.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.ReplyDto;
import com.fz.followme.dto.SocialFeedDto;
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
	public String socialFeedPage() {
		
		return "feed/socialFeed";
	}

	@ResponseBody
	@PostMapping(value="/list", produces="application/json; charset=utf-8")
	public Map<String, Object> selectFeedList() {
		
	    List<SocialFeedDto> feedList = socialFeedService.selectFeedList();
	    List<ReplyDto> replyList = socialFeedService.selectReplyList();
	    
	    Map<String, Object> map = new HashMap<>();
	    map.put("feedList", feedList);
	    map.put("replyList", replyList);
	    map.put("moreDataAvailable", !feedList.isEmpty()); // 더 이상 데이터가 없으면 false 전달
	    
		return map;
	}
	
	
	
	@PostMapping("/insert")
	public String regist(SocialFeedDto socialFeed
					   , List<MultipartFile> uploadFiles
			      	   , HttpSession session
			      	   , RedirectAttributes redirectAttributes) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String memNo = loginUser.getMemNo();
		
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


	@ResponseBody
	@PostMapping("/registReply.do")
	public String ajaxInsertReply(ReplyDto reply, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		reply.setMemNo(String.valueOf(loginUser.getMemNo()));
		
		return socialFeedService.insertReply(reply) > 0 ? "SUCCESS"
												   : "FAIL";
	}
	
	@GetMapping("/modifyForm.page")
	public String modifyForm(int sfNo, Model model) {
		
		model.addAttribute("socialFeed", socialFeedService.selectFeed(sfNo));
		
		return "feed/modifyFeed";
	}
	
	@PostMapping("/modify.do")
	public String modify(SocialFeedDto socialFeed, String[] delFileNo, List<MultipartFile> uploadFiles,
			 		RedirectAttributes redirectAttributes) {
		
		List<AttachmentDto> delFileList = socialFeedService.selectDelFileList(delFileNo);
		
		List<AttachmentDto> addFileList = new ArrayList<>();
		
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "socialFeed");
				addFileList.add(AttachmentDto.builder()
						    .filePath(map.get("filePath"))
						    .systemName(map.get("filesystemName"))
						    .originName(map.get("originalName"))
						    .type("S")
						    .refNo(socialFeed.getSfNo())
						    .build());
			}
		}
		
		socialFeed.setAttachList(addFileList);
		
		int result = socialFeedService.updateFeed(socialFeed, delFileNo);

		if(result > 0) {
			// 성공 시
			// => 삭제할 첨부파일이 있었다면 => 해당 파일 찾아서 삭제되도록
			for(AttachmentDto at : delFileList) {
				new File(at.getFilePath() + "/" + at.getSystemName()).delete();
			}
			// => alertMsg
			redirectAttributes.addFlashAttribute("alertMsg", "피드가 성공적으로 수정되었습니다.");

		}else {
			// 실패 시
			// => alertMsg
			redirectAttributes.addFlashAttribute("alertMsg", "피드 수정에 실패하였습니다.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");

		}
		
		return "redirect:/feed";
	
	}
	
	@GetMapping("/delete.do")
	public String delete(int sfNo, RedirectAttributes redirectAttributes) {
		
		int result = socialFeedService.deleteFeed(sfNo);
		
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "피드를 삭제했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "피드 삭제에 실패했습니다.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		
		return "redirect:/feed";
	}
	
	
	/*
	 * @ResponseBody
	 * 
	 * @GetMapping("/removeReply.do") public String ajaxDeleteReply(int sfNo) {
	 * return socialFeedService.deleteReply(sfNo) > 0 ? "SUCCESS" : "FAIL"; }
	 */
	
	
	
	
	
	
}
