package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.dto.ReplyDto;

public interface BoardService {
	
	// 전체글 조회 및 페이징
	int selectBoardListCount();
	List<BoardDto> selectBoardList(PageInfoDto pi);
	
	// 최근글 조회
	List<BoardDto> selectLatestPostList();
	
	// 검색 조회목록 및 페이징
	int searchBoardListCount(String keyword);
	List <BoardDto> searchBoardList(String keyword , PageInfoDto pi);
	
	// 게시글 작성
	int insertBoard(BoardDto board);
	
	// 조회수 증가(게시글 상세)
	int updateIncreaseCount(int boardNo);
	// 게시글 상세
	BoardDto selectBoardDetail(int boardNo);
	
	// 게시글 수정
	List<AttachmentDto> selectDelFileList(String[] delFileNo); 
	int updateBoard(BoardDto board, String[] delFileNo);
	
	// 게시글 삭제
	int boardRemove(int boardNo);
	
	// 댓글 리스트
	List<ReplyDto> selectReplyList(int boardNo);
	
	// 댓글 작성
	int insertReply(ReplyDto reply);
	
	// 댓글 삭제
	int deleteReply(int rNo);
	
	// 내가 쓴 글
	int selectMyWritingCount(BoardDto board);
	List<BoardDto>selectMyWritingList(PageInfoDto pi, BoardDto board);
}
