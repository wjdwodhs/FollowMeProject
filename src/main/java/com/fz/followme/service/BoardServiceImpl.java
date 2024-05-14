package com.fz.followme.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.BoardDao;
import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	private final BoardDao boardDao;
	
	@Override
	public int selectBoardListCount() {
		return boardDao.selectBoardListCount();
	}

	@Override
	public List<BoardDto> selectBoardList(PageInfoDto pi) {
		return boardDao.selectBoardList(pi);
	}

	@Override
	public List<BoardDto> selectLatestPostList() {
		return boardDao.selectLatestPostList();
	}

	@Override
	public int searchBoardListCount(String keyword) {
		return boardDao.searchBoardListCount(keyword);
	}

	@Override
	public List<BoardDto> searchBoardList(String keyword, PageInfoDto pi) {
		return boardDao.searchBoardList(keyword, pi);
	}

	


}
