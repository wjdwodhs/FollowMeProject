package com.fz.followme.service;

import java.util.List;
import java.util.Map;

import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;

public interface BoardService {
	
	// 전체글 조회 및 페이징
	int selectBoardListCount();
	List<BoardDto> selectBoardList(PageInfoDto pi);
	
	// 최근글 조회
	List<BoardDto> selectLatestPostList();
	
	// 검색 조회목록 및 페이징
	int searchBoardListCount(String keyword);
	List <BoardDto> searchBoardList(String keyword , PageInfoDto pi);
	
	// 
}
