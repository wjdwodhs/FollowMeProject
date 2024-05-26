package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.ReplyDto;
import com.fz.followme.dto.SocialFeedDto;

public interface SocialFeedService {

	// 피드게시판 작성 기능
	int insertFeed(SocialFeedDto socialFeed);
	
	// 피드게시판 조회 기능
	List<SocialFeedDto> selectList();
	
	// 댓글리스트 조회 서비스
	List<ReplyDto> selectReplyList(int rfNo);
	
	// 댓글작성 서비스
	int insertReply(ReplyDto reply);
	
	// 댓글삭제 서비스
	int deleteReply(int replyNo);
	

}
