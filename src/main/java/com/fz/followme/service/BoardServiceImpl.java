package com.fz.followme.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.BoardDao;
import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.dto.ReplyDto;

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
	
	@Override
	public int updateIncreaseCount(int boardNo) {
		return boardDao.updateIncreaseCount(boardNo);
	}
	

	@Override
	public BoardDto selectBoardDetail(int boardNo ) {
		return boardDao.selectBoardDetail(boardNo);
	}
	
	@Override
	public List<AttachmentDto> selectDelFileList(String[] delFileNo) {
		
		return delFileNo != null ? boardDao.selectDelFileList(delFileNo)
								 : new ArrayList<AttachmentDto>();				
	}
	

	@Override
	public int updateBoard(BoardDto board, String[] delFileNo) {
		
		// 게시글 정보 update 
				int result1 = boardDao.updateBoard(board);
				
				// 삭제할 첨부파일 정보 delete
				int result2 = delFileNo == null ? 1
												: boardDao.deleteAttach(delFileNo);
				
				// 새로운 첨부파일 정보 insert
				List<AttachmentDto> list = board.getAttachList();
				int result3 = 0;
				for(AttachmentDto at : list) {
					result3 += boardDao.insertAttach(at);
				}
				
				return result1 == 1 
						&& result2 > 0 
						&& result3 == list.size() 
							? 1 : -1;
		
	}

	
	@Override
	public int boardRemove(int boardNo) {
		return boardDao.boardRemove(boardNo);
	}


	@Override
	public List<ReplyDto> selectReplyList(int boardNo) {
		return boardDao.selectReplyList(boardNo);
	}

	@Override
	public int insertReply(ReplyDto reply) {
		return boardDao.insertReply(reply);
	}

	@Override
	public int deleteReply(int rNo) {
		return boardDao.deleteReply(rNo);
	}

	@Override
	public int selectMyWritingCount(BoardDto board) {
		return boardDao.selectMyWritingCount(board);
	}

	@Override
	public List<BoardDto> selectMyWritingList(PageInfoDto pi, BoardDto board) {
		return boardDao.selectMyWritingList(pi, board);
	}

	
	

	
	

	


}
