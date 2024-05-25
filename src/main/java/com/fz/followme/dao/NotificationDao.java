package com.fz.followme.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.NotificationDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class NotificationDao {
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<NotificationDto> selectList(String memNo) { // -> String memNo
		return sqlSessionTemplate.selectList("notificationMapper.selectList", memNo);
	}
	
	public int selectListCount(String memNo) {
		return sqlSessionTemplate.selectOne("notificationMapper.selectListCount", memNo);
	}

	public int updateAlarm(MemberDto webSocketMember) { // -> String memNo
		return sqlSessionTemplate.update("notificationMapper.updateAlarm", webSocketMember);
	}
	
	public int deleteAlarm(MemberDto webSocketMember) { // -> String memNo
		return sqlSessionTemplate.delete("notificationMapper.deleteAlarm", webSocketMember);
	}


}
