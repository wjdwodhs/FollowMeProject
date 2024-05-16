package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.BoardDao;
import com.fz.followme.dto.AttachmentDto;
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

	@Override
	public int insertBoard(BoardDto board) {
		
		// board
		int result1 = boardDao.insertBoard(board);
		
		
		// attachment
		int result2 = 1;
		List<AttachmentDto> attachList = board.getAttachList();
		if(!attachList.isEmpty()) {
			result2 = 0;
			for(AttachmentDto at : attachList) {
				result2 += boardDao.insertAttach(at);
				
			}
		}
				
		return result1 * result2;
	}

	


}
