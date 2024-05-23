package com.fz.followme.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.WebSocketSession;

import com.fz.followme.dto.NotificationDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class NotificationDao {
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<NotificationDto> selectList(WebSocketSession s) {
		return sqlSessionTemplate.selectList("notificationMapper.selectList", s);
	}

}
