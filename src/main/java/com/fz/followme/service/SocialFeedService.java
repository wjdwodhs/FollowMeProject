package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.SocialFeedDto;

public interface SocialFeedService {

	// 피드게시판 작성 기능
	int insertFeed(SocialFeedDto socialFeed);
	
	// 피드게시판 조회 기능
	List<SocialFeedDto> selectList();
	

}
