package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.AttendanceDto;

public interface AttendanceService {

	// 출근 시간 등록 서비스
	int insertWorktime(String memNo);

	// 퇴근 시간 등록 서비스
	int updateWorktime(String memNo);

	// 근태 유형 조회 서비스
	AttendanceDto selectStatus(String memNo);

	// 근태 조회 서비스
	List<AttendanceDto> selectAttendance(String memNo);

	// 조퇴 시간 등록 서비스
	int updateErWorktime(String memNo);

	
}
