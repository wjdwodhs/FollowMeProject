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
public class CompanyNewsDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public int selectCompanyNewsListCount() {
		return sqlSessionTemplate.selectOne("companyNewsMapper.selectCompanyNewsListCount");
	}
	
	public List<BoardDto> selectCompanyNewsList(PageInfoDto pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return sqlSessionTemplate.selectList("companyNewsMapper.selectCompanyNewsList", null, rowBounds);
	}
	
	public List<BoardDto> selectLatestPostList(){
		return sqlSessionTemplate.selectList("companyNewsMapper.selectLatestPostList");
	}
	
}
