package com.fz.followme.service;

import java.util.ArrayList;
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
	public List<SocialFeedDto> selectFeedList() {
		return socialFeedDao.selectFeedList();
	}
	
	// 댓글리스트 조회
	@Override
	public List<ReplyDto> selectReplyList() {
		return socialFeedDao.selectReplyList();
	}

	// 댓글 작성
	@Override
	public int insertReply(ReplyDto reply) {
		return socialFeedDao.insertReply(reply);
	}

	// 게시글 수정시 글 조회
	@Override
	public SocialFeedDto selectFeed(int sfNo) {
		return socialFeedDao.selectFeed(sfNo);
	}

	// 게시글 수정
	@Override
	public int updateFeed(SocialFeedDto socialFeed, String[] delFileNo) {
		
		int result1 = socialFeedDao.updateFeed(socialFeed);
		
		int result2 = delFileNo == null ? 1
										: socialFeedDao.deleteAttach(delFileNo);
		
		List<AttachmentDto> list = socialFeed.getAttachList();
		int result3 = 0;
		for(AttachmentDto at : list) {
			result3 += socialFeedDao.insertAttach(at);
		}
		
		return result1 == 1
				&& result2 > 0
				&& result3 == list.size() ? 1 : -1;
	}

	// 게시글 삭제
	@Override
	public int deleteFeed(int sfNo) {
		return socialFeedDao.deleteFeed(sfNo);
	}

	@Override
	public List<AttachmentDto> selectDelFileList(String[] delFileNo) {
		return delFileNo != null ? socialFeedDao.selectDelFileList(delFileNo)
								 : new ArrayList<AttachmentDto>();
	}


	@Override 
	public int deleteReply(int replyNo){ 
		 return socialFeedDao.deleteReply(replyNo); 
	}
	

}
