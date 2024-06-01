package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.NoticeDao;
import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.dto.ReplyDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class NoticeServiceImpl implements NoticeService {

	private final NoticeDao noticeDao;
	
	@Override
	public int selectNoticeListCount() {
		return noticeDao.selectNoticeListCount();
	}

	@Override
	public List<BoardDto> selectNoticeList(PageInfoDto pi) {
		return noticeDao.selectNoticeList(pi);
	}

	@Override
	public List<BoardDto> selectLatestPostList() {
		return noticeDao.selectLatestPostList();
	}

	@Override
	public int updateIncreaseCount(int boardNo) {
		return noticeDao.updateIncreaseCount(boardNo);
	}

	@Override
	public BoardDto selectNoticeDetail(int boardNo) {
		return noticeDao.selectNoticeDetail(boardNo);
	}

	@Override
	public int insertReply(ReplyDto reply) {
		return noticeDao.insertReply(reply);
	}

	@Override
	public List<ReplyDto> selectReplyList(int boardNo) {
		return noticeDao.selectReplyList(boardNo);
	}

	@Override
	public int deleteReply(int rNo) {
		return noticeDao.deleteReply(rNo);
	}

}
