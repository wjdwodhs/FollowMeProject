package com.fz.followme.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.ReplyDto;
import com.fz.followme.dto.SocialFeedDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class SocialFeedDao {

	private final SqlSessionTemplate sqlSessionTemplate;

	public int insertFeed(SocialFeedDto socialFeed) {
		return sqlSessionTemplate.insert("socialFeedMapper.insertFeed", socialFeed);
	}

	public int insertAttach(AttachmentDto at) {
		return sqlSessionTemplate.insert("socialFeedMapper.insertAttach", at);
	}

	// 피드게시판 리스트 조회 ajax 기능
	public List<SocialFeedDto> selectFeedList() {
		return sqlSessionTemplate.selectList("socialFeedMapper.selectList");
	}
	
	// 댓글
	
	public List<ReplyDto> selectReplyList() {
		return sqlSessionTemplate.selectList("socialFeedMapper.selectReplyList");	
	}

	public int insertReply(ReplyDto reply) {
		return sqlSessionTemplate.insert("socialFeedMapper.insertReply", reply);
	}

	/*
	 * public int deleteReply(int replyNo) { return
	 * sqlSessionTemplate.update("socialFeedMapper.deleteReply", replyNo); }
	 */
}
