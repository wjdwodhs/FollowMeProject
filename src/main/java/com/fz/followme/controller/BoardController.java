package com.fz.followme.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.service.BoardService;
import com.fz.followme.util.FileUtil;
import com.fz.followme.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@RequiredArgsConstructor
@Controller
public class BoardController {
	
	private final BoardService boardService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	@RequestMapping("/socialFeed.page")
	public void socialFeedPage() {}
	
	
	
	@RequestMapping("/list.do")
	public ModelAndView boardList(@RequestParam(value="page", defaultValue="1")int page, ModelAndView mv) {
		
		int boardListCount = boardService.selectBoardListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(boardListCount, page, 5, 20);
		List<BoardDto> allList = boardService.selectBoardList(pi);
		List<BoardDto> newList = boardService.selectLatestPostList();
		
		mv.addObject("pi", pi)
		  .addObject("allList", allList)
		  .addObject("newList", newList)
		  .setViewName("/board/boardList");
		
		return mv;
	}
	
	@GetMapping("/search.do")
	public ModelAndView searchBoardList(@RequestParam(value="page", defaultValue="1")int page,
										@RequestParam String keyword, ModelAndView mv) {
		
		int searchBoardListCount = boardService.searchBoardListCount(keyword);
		PageInfoDto pi = pagingUtil.getPageInfoDto(searchBoardListCount, page, 5, 20);
		List <BoardDto> allList = boardService.searchBoardList(keyword, pi);
		
		
		mv.addObject("pi", pi)
		  .addObject("allList", allList)
		  .addObject("keyword", keyword)
		  .setViewName("/board/boardList");
		
		return mv;
		
	}
	
	
	@RequestMapping("/boardInsert.page")
	public String boardInsertPage() {
		return "board/boardInsert";
	}
	
	@PostMapping("/insert.do")
	public String insertBoard(@RequestParam("category") String boardCategory
							, BoardDto board
							, List<MultipartFile> uploadFiles
							, HttpSession session
							, RedirectAttributes redirectAttributes) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		board.setMemNo(loginUser.getMemName());
		board.setBoardType(boardCategory);
		List<AttachmentDto> attachList = new ArrayList<>();
		log.debug("attchList:{}",attachList);
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile != null && !uploadFile.isEmpty() && boardCategory.equals("NO")) {
				
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "notice");
				
				attachList.add(AttachmentDto.builder()
											.filePath(map.get("filePath"))
											.systemName(map.get("systemName"))
											.originName(map.get("originName"))
											.type("N")
											.build());
			}else if(uploadFile != null && !uploadFile.isEmpty() && boardCategory.equals("CO")) {
				
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "companyNews");
				
				attachList.add(AttachmentDto.builder()
											.filePath(map.get("filePath"))
											.systemName(map.get("systemName"))
											.originName(map.get("originName"))
											.type("C")
											.build());
			}
		}
		
		board.setAttachList(attachList);
		
		int result = boardService.insertBoard(board); 
		
		redirectAttributes.addFlashAttribute("alertTitle","게시판 작성 서비스");
		if(attachList.isEmpty() && result == 1 || !attachList.isEmpty() && result == attachList.size()) {
			redirectAttributes.addFlashAttribute("alertMsg", "게시판 작성에 성공하였습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "게시판 작성에 실패하였습니다.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		
		
		
		return "redirect:/board/list.do";
		
		
	}
	
	
	

	
	
	
	
	
	
	
}
