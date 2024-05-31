package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.ReplyDto;
import com.fz.followme.dto.SocialFeedDto;

public interface SocialFeedService {

	// 피드게시판 작성 기능
	int insertFeed(SocialFeedDto socialFeed);
	
	// 피드게시판 조회 기능
	//List<SocialFeedDto> selectList();
	
	// 댓글리스트 ajax 조회 기능
	List<ReplyDto> selectReplyList();
	
	// 댓글작성 ajax 기능
	int insertReply(ReplyDto reply);

	// 피드게시판 ajax 조회 기능
	List<SocialFeedDto> selectFeedList();
	
	// 피드게시글 수정
	SocialFeedDto selectFeed(int sfNo);
	List<AttachmentDto> selectDelFileList(String[] delFileNo);
	int updateFeed(SocialFeedDto socialFeed, String[] delFileNo);
	
	// 피드게시글 삭제
	int deleteFeed(int sfNo);

	
	/*
	 * // 댓글삭제 서비스 int deleteReply(int replyNo);
	 */
	

}
