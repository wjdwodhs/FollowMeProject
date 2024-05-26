package com.fz.followme.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.SocialFeedDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class SocialFeedDao {

	private final SqlSessionTemplate sqlSessionTemplate;

	public int insertFeed(SocialFeedDto socialFeed) {
		return sqlSessionTemplate.insert("socialFeedMapper.insertFeed", socialFeed);
	}

	public int insertAttach(AttachmentDto at) {
		return sqlSessionTemplate.insert("socialFeedMapper.insertAttach", at);
	}

	public List<SocialFeedDto> selectList() {
		return sqlSessionTemplate.selectList("socialFeedMapper.selectList");
	}

}
