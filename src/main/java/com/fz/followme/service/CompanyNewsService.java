package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;

public interface CompanyNewsService {

	int selectCompanyNewsListCount();
	List<BoardDto> selectCompanyNewsList(PageInfoDto pi);
	
	
	
}
