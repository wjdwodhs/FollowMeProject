package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.dto.ReplyDto;

public interface CompanyNewsService {

	int selectCompanyNewsListCount();
	List<BoardDto> selectCompanyNewsList(PageInfoDto pi);
	
	List<BoardDto> selectLatestPostList();
	
	// 조회수 증가(게시글 상세)
	int updateIncreaseCount(int boardNo);
	// 게시글 상세
	BoardDto selectCompanyNewsDetail(int boardNo);
	
	// 댓글 작성
	int insertReply(ReplyDto reply);
	
	// 댓글 리스트
	List<ReplyDto> selectReplyList(int boardNo);
	
	// 댓글 삭제
	int deleteReply(int rNo);
	
}
