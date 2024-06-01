package com.fz.followme.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.dto.ReplyDto;

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
	
	public int updateIncreaseCount(int boardNo) {
		return sqlSessionTemplate.update("companyNewsMapper.updateIncreaseCount", boardNo);
	}
	
	
	public BoardDto selectCompanyNewsDetail(int boardNo) {
		return sqlSessionTemplate.selectOne("companyNewsMapper.selectCompanyNewsDetail", boardNo);
	}
	
	public int insertReply(ReplyDto reply) {
		return sqlSessionTemplate.insert("companyNewsMapper.insertReply", reply);
	}
	public List<ReplyDto> selectReplyList(int boardNo){
		return sqlSessionTemplate.selectList("companyNewsMapper.selectReplyList", boardNo);
	}
	public int deleteReply(int rNo) {
		return sqlSessionTemplate.update("companyNewsMapper.deleteReply", rNo);
	}
	
	
	
}
