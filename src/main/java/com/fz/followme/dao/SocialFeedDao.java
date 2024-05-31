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
	
	// 댓글리스트 조회
	public List<ReplyDto> selectReplyList() {
		return sqlSessionTemplate.selectList("socialFeedMapper.selectReplyList");	
	}

	// 댓글 작성
	public int insertReply(ReplyDto reply) {
		return sqlSessionTemplate.insert("socialFeedMapper.insertReply", reply);
	}

	// 피드게시글 조회
	public SocialFeedDto selectFeed(int sfNo) {
		return sqlSessionTemplate.selectOne("socialFeedMapper.selectFeed", sfNo);
	}
	
	// 피드게시글 수정
	public int updateFeed(SocialFeedDto socialFeed) {
		return sqlSessionTemplate.update("socialFeedMapper.updateFeed", socialFeed);
	}
	
	// 피드게시글, 첨부파일 삭제
	public int deleteAttach(String[] delFileNo) {
		return sqlSessionTemplate.delete("socialFeedMapper.deleteAttach", delFileNo);		
	}
	
	public int deleteFeed(int sfNo) {
		return sqlSessionTemplate.delete("socialFeedMapper.deleteFeed", sfNo);
	}

	public List<AttachmentDto> selectDelFileList(String[] delFileNo) {
		return sqlSessionTemplate.selectList("socialFeedMapper.selectDelFileList", delFileNo);
	}
	
	
	
	

	/*
	 * public int deleteReply(int replyNo) { return
	 * sqlSessionTemplate.update("socialFeedMapper.deleteReply", replyNo); }
	 */
}
