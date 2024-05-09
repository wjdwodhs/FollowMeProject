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
public class NoticeDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public int selectNoticeListCount() {
		return sqlSessionTemplate.selectOne("noticeMapper.selectNoticeListCount");
	}
	
	public List<BoardDto> selectNoticeList(PageInfoDto pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return sqlSessionTemplate.selectList("noticeMapper.selectNoticeList", null, rowBounds);
	}
	
	public List<BoardDto> selectLatestPostList(){
		return sqlSessionTemplate.selectList("noticeMapper.selectLatestPostList");
	}
	
}
