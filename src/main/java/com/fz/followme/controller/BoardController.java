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
	
	@RequestMapping("/list.do")
	public ModelAndView boardList(@RequestParam(value="page", defaultValue="1")int page, ModelAndView mv) {
		
		int boardListCount = boardService.selectBoardListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(boardListCount, page, 5, 20);
		List<BoardDto> allList = boardService.selectBoardList(pi);
		log.debug("allList: {}", allList);
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
		  .setViewName("board/boardList");
		
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
		log.debug("loginUser:{}",loginUser);
		board.setMemNo(loginUser.getMemNo());
		board.setBoardType(boardCategory);
		List<AttachmentDto> attachList = new ArrayList<>();
		log.debug("attchList:{}",attachList);
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile != null && !uploadFile.isEmpty() && boardCategory.equals("NO")) {
				
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "notice");
				
				attachList.add(AttachmentDto.builder()
											.filePath(map.get("filePath"))
											.systemName(map.get("filesystemName"))
											.originName(map.get("originalName"))
											.type("N")
											.build());
			}else if(uploadFile != null && !uploadFile.isEmpty() && boardCategory.equals("CO")) {
				
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "companyNews");
				
				attachList.add(AttachmentDto.builder()
											.filePath(map.get("filePath"))
											.systemName(map.get("filesystemName"))
											.originName(map.get("originalName"))
											.type("C")
											.build());
			}
		}
		log.debug("attachList:{}", attachList);
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
	
	@GetMapping("/increase.do")
	public String increase(int no) {
		
		boardService.updateIncreaseCount(no);
		
		return "redirect:/board/detail.do?no=" + no;
	}
	
	
	@GetMapping("/detail.do")
	public String selectBoardDetail(int no 
								  , Model model
								  , HttpSession session) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		log.debug("no:{}", no);
		BoardDto board = boardService.selectBoardDetail(no);
		
		model.addAttribute("board",board);
		log.debug("board:{}", board);
		
		return "board/boardDetail";
	}
	
	@PostMapping("/boardModify.Page")
	public String boardModifyPage(int no, Model model ) {
		model.addAttribute("board",boardService.selectBoardDetail(no));
		log.debug("Board object added to model: {}", model.getAttribute("board"));
		return "board/boardModify";
	}
	
	@PostMapping("/modify.do")
	public String modify(BoardDto board, String[] delFileNo
					   , @RequestParam("category") String category
					   , List<MultipartFile> uploadFiles
					   , RedirectAttributes redirectAttributes) {
		
		List<AttachmentDto> delFileList = boardService.selectDelFileList(delFileNo);
		
		
		List<AttachmentDto> addFileList = new ArrayList<>();
		log.debug("board:{}", board);
		log.debug("addFileList:{}", addFileList);		
		log.debug("delFileList:{}", delFileList);		
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile != null && !uploadFile.isEmpty() && category.equals("NO")) {
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "board");
				addFileList.add( AttachmentDto.builder()
										  .originName(map.get("originalName"))
										  .filePath(map.get("filePath"))
										  .systemName(map.get("filesystemName"))
										  .type("N")
										  .refNo(board.getSubNo())
										  .build() );
				
			}else if(uploadFile != null && !uploadFile.isEmpty() && category.equals("CO")) {
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "board");
				addFileList.add( AttachmentDto.builder()
										  .originName(map.get("originalName"))
										  .filePath(map.get("filePath"))
										  .systemName(map.get("filesystemName"))
										  .type("C")
										  .refNo(board.getSubNo())
										  .build() );
			}
		}
		
		board.setAttachList(addFileList);
		
		int result = boardService.updateBoard(board, delFileNo);
		
		redirectAttributes.addFlashAttribute("alertTitle", "게시글 수정 서비스");
		if(result > 0) {
			for(AttachmentDto at : delFileList) {
				new File( at.getFilePath() + "/" + at.getSystemName() ).delete();
			}
			
			redirectAttributes.addFlashAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다.");			
		}
		
		return "redirect:/board/detail.do?no=" + board.getSubNo();		
		
		
		
	}
	
	@PostMapping("/boardRemove.do")
	public String boardRemove(@RequestParam("no") int no
							, RedirectAttributes redirectAttributes) {
		
		int result = boardService.boardRemove(no);
		
		
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "게시글이 성공적으로 삭제되었습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "게시글 삭제에 실패하였습니다.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
	
	}
		
		return "redirect:/board/list.do";
		
	}
	
	
	
	@ResponseBody
	@GetMapping(value="/replyList.do", produces="application/json; charset=utf-8")
	public List<ReplyDto> ajaxReplyList(int no){
		log.debug("no: {}", no);
		List<ReplyDto> rList = boardService.selectReplyList(no);
		log.debug("rList: {}", rList);
		return rList;
		
	}

	
	@ResponseBody
	@PostMapping("/replyInsert.do")
	public String replyInsert(ReplyDto reply
							, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		reply.setMemNo(loginUser.getMemNo());
		log.debug("reply:{}", reply);
		return boardService.insertReply(reply) > 0 ? "SUCCESS":"FAIL";
													
	}
	
	@ResponseBody
	@GetMapping("/replyDelete.do")
	public String replyDelete(int no) {
		return boardService.deleteReply(no) > 0 ? "SUCCESS":"FAIL";
	}
	
	
	

	@RequestMapping("/myWritingList.page")
	public ModelAndView boardRemovePage(@RequestParam(value="page", defaultValue="1")int page, ModelAndView mv
													, HttpSession session
													, BoardDto board) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		board.setMemNo(loginUser.getMemNo());
		int myWritingCount = boardService.selectMyWritingCount(board);
		PageInfoDto pi = pagingUtil.getPageInfoDto(myWritingCount, page, 5, 10);
		List<BoardDto> myList = boardService.selectMyWritingList(pi, board);
		log.debug("myList: {}", myList);
		
		mv.addObject("pi", pi)
		  .addObject("myList", myList)
		  .setViewName("/board/myWritingList");
		
		return mv;
		
		
		
		
	}
	
	@RequestMapping("boardManagement.page")
	public ModelAndView boardManagementList(@RequestParam(value="page", defaultValue="1")int page, ModelAndView mv) {
		
		int boardListCount = boardService.selectBoardListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(boardListCount, page, 5, 20);
		List<BoardDto> allList = boardService.selectBoardList(pi);
		log.debug("allList: {}", allList);	
		
		mv.addObject("pi", pi)
		  .addObject("allList", allList)
		  .setViewName("/board/boardManagement");
		
		return mv;
	}
	
	
	
	
	
	
}
