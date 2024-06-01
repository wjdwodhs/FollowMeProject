package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.dto.ReplyDto;

public interface NoticeService {

	// 공지사항 목록 조회(페이징)
	int selectNoticeListCount();
	List<BoardDto> selectNoticeList(PageInfoDto pi);
	
	// 최신글 목록 조회(5개)
	List<BoardDto> selectLatestPostList();
	
	// 게시글 상세(조회수 증가)
	int updateIncreaseCount(int boardNo);
	// 게시슬 상세 
	BoardDto selectNoticeDetail(int boardNo);
	
	// 댓글 작성
	int insertReply(ReplyDto reply);
	
	// 댓글 리스트
	List<ReplyDto> selectReplyList(int boardNo);
	
	// 댓글 삭제
	int deleteReply(int rNo);
}
