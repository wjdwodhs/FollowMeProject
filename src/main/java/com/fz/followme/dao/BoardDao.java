package com.fz.followme.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class BoardDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public int selectBoardListCount() {
		return sqlSessionTemplate.selectOne("boardMapper.selectBoardListCount");
	}
	
	public List<BoardDto> selectBoardList(PageInfoDto pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return sqlSessionTemplate.selectList("boardMapper.selectBoardList", null, rowBounds);
	}
	
	public List<BoardDto> selectLatestPostList(){
		return sqlSessionTemplate.selectList("boardMapper.selectLatestPostList");
	}
	
	public int searchBoardListCount(String keyword) {
		return sqlSessionTemplate.selectOne("boardMapper.searchBoardListCount", keyword);
	}
	
	
	public List<BoardDto> searchBoardList(String keyword, PageInfoDto pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return sqlSessionTemplate.selectList("boardMapper.searchBoardList", keyword, rowBounds);
	}
	
	public int insertBoard(BoardDto board) {
		return sqlSessionTemplate.insert("boardMapper.insertBoard", board);
	}
	
	public int insertAttach(AttachmentDto attach) {
		return sqlSessionTemplate.insert("boardMapper.insertAttach", attach);
	}
	
	
}
