package com.fz.followme.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
	
}
