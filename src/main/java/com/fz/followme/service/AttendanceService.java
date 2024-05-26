package com.fz.followme.service;

import java.util.List;
import java.util.Map;

import com.fz.followme.dto.AttendanceDto;

public interface AttendanceService {

	// 출근 시간 등록 서비스
	int insertWorktime(AttendanceDto att);

	// 퇴근 시간 등록 서비스
	int updateWorktime(String memNo);

	// 근태 유형 조회 서비스
	AttendanceDto selectStatus(String memNo);

	// 근태 조회 서비스
	AttendanceDto selectAttendance(String memNo);

	// 조퇴 시간 등록 서비스
	int updateErWorktime(String memNo);
	
	// 타입별 출석 조회 서비스
	List<AttendanceDto> countAttendanceByType(String memNo);

	// 월별 시간 조회 서비스
	AttendanceDto monthAttendanceTime(String memNo);
	
	// 총 근무시간 및 근무일수 조회 서비스
	AttendanceDto totalAttendanceTime(String memNo);

	
}
