package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;

public interface NoticeService {

	// 공지사항 목록 조회(페이징)
	int selectNoticeListCount();
	List<BoardDto> selectNoticeList(PageInfoDto pi);
	
	// 최신글 목록 조회(5개)
	List<BoardDto> selectLatestPostList();
}
