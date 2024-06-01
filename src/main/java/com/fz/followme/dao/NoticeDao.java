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
	
	public int updateIncreaseCount(int boardNo) {
		return sqlSessionTemplate.update("noticeMapper.updateIncreaseCount", boardNo);
	}
	
	public BoardDto selectNoticeDetail(int boardNo) {
		return sqlSessionTemplate.selectOne("noticeMapper.selectNoticeDetail", boardNo);
	}
	
	public int insertReply(ReplyDto reply) {
		return sqlSessionTemplate.insert("noticeMapper.insertReply", reply);
	}
	public List<ReplyDto> selectReplyList(int boardNo){
		return sqlSessionTemplate.selectList("noticeMapper.selectReplyList", boardNo);
	}
	public int deleteReply(int rNo) {
		return sqlSessionTemplate.update("noticeMapper.deleteReply", rNo);
	}
	
}
