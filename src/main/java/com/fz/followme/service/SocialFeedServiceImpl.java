package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.SocialFeedDao;
import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.ReplyDto;
import com.fz.followme.dto.SocialFeedDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SocialFeedServiceImpl implements SocialFeedService {

	private final SocialFeedDao socialFeedDao;
	
	// 피드게시판 작성 기능
	@Override
	public int insertFeed(SocialFeedDto socialFeed) {
		// feed insert
		int result1 = socialFeedDao.insertFeed(socialFeed);
		// attach insert
		int result2 = 1;
		if(!socialFeed.getAttachList().isEmpty()) {
			result2 = 0;
			for(AttachmentDto at : socialFeed.getAttachList()) {
				result2 += socialFeedDao.insertAttach(at);
			}
		}
		
		return result1 * result2;
	}
	
	// 피드게시판 리스트 + content 내용 조회 기능
	@Override
	public List<SocialFeedDto> selectList() {
		return socialFeedDao.selectList();
	}
	
	// 댓글
	@Override
	public List<ReplyDto> selectReplyList(int rfNo) {
		return socialFeedDao.selectReplyList(rfNo);
	}

	@Override
	public int insertReply(ReplyDto reply) {
		return socialFeedDao.insertReply(reply);
	}
	
	@Override
	public int deleteReply(int replyNo) {
		return socialFeedDao.deleteReply(replyNo);
	}

}
