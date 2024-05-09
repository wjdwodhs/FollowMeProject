package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.CompanyNewsDao;
import com.fz.followme.dao.NoticeDao;
import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;

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

}
