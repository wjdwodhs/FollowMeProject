package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.BoardDto;
import com.fz.followme.dto.PageInfoDto;

public interface BoardService {

	int selectBoardListCount();
	List<BoardDto> selectBoardList(PageInfoDto pi);
}
