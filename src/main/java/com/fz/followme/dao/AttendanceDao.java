package com.fz.followme.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.fz.followme.dto.AttendanceDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Repository
public class AttendanceDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;

	public int insertWorktime(AttendanceDto att) {
		return sqlSessionTemplate.insert("attendanceMapper.insertWorktime", att);
	}

	public int updateWorktime(String memNo) {
		return sqlSessionTemplate.update("attendanceMapper.updateWorktime", memNo);
	}

	public AttendanceDto selectStatus(String memNo) {
		return sqlSessionTemplate.selectOne("attendanceMapper.selectStatus", memNo);
	}

	public AttendanceDto selectAttendance(String memNo) {
		return sqlSessionTemplate.selectOne("attendanceMapper.selectAttendance",memNo);
	}

	public int updateErWorktime(String memNo) {
		return sqlSessionTemplate.update("attendanceMapper.updateErWorktime", memNo);
	}

	public List<AttendanceDto> countAttendanceByType(String memNo) {
		return sqlSessionTemplate.selectList("attendanceMapper.countAttendanceByType", memNo);
		 
	
	}

	public AttendanceDto monthAttendanceTime(String memNo) {
		return sqlSessionTemplate.selectOne("attendanceMapper.monthAttendanceTime", memNo);
	}

	public AttendanceDto totalAttendanceTime(String memNo) {
		return sqlSessionTemplate.selectOne("attendanceMapper.totalAttendanceTime", memNo);
	}
	
	
}
