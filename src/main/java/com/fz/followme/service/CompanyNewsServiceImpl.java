package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.CompanyNewsDao;
import com.fz.followme.dao.NoticeDao;
import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.dto.ReplyDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CompanyNewsServiceImpl implements CompanyNewsService {

	private final CompanyNewsDao companyNewsDao;
	
	@Override
	public int selectCompanyNewsListCount() {	
		return companyNewsDao.selectCompanyNewsListCount();
	}


	@Override
	public List<BoardDto> selectCompanyNewsList(PageInfoDto pi) {
		return companyNewsDao.selectCompanyNewsList(pi);
	}


	@Override
	public List<BoardDto> selectLatestPostList() {
		return companyNewsDao.selectLatestPostList();
	}


	@Override
	public int updateIncreaseCount(int boardNo) {
		return companyNewsDao.updateIncreaseCount(boardNo);
	}


	@Override
	public BoardDto selectCompanyNewsDetail(int boardNo) {
		return companyNewsDao.selectCompanyNewsDetail(boardNo);
	}


	@Override
	public int insertReply(ReplyDto reply) {
		return companyNewsDao.insertReply(reply);
	}


	@Override
	public List<ReplyDto> selectReplyList(int boardNo) {
		return companyNewsDao.selectReplyList(boardNo);
	}


	@Override
	public int deleteReply(int rNo) {
		return companyNewsDao.deleteReply(rNo);
	}

}
