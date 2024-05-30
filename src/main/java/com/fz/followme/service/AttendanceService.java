package com.fz.followme.service;

import java.util.List;
import java.util.Map;

import com.fz.followme.dto.AttendanceDto;
import com.fz.followme.dto.DocumentDto;
import com.fz.followme.dto.LeavepDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;

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

	// Ajax 월별 시간 조회 서비스
	AttendanceDto AjaxMonthAttendanceTime(AttendanceDto att);
	
	// Ajax 타입별 출석 조회 서비스
	List<AttendanceDto> AjaxCountAttendanceByType(AttendanceDto att);
	
	// 사원등록 시 연차 등록 서비스
	int insertDefaultLeave(LeavepDto leave);

	// 연차 전자결재 최종 결제 시 연차테이블 등록 서비스
	int insertLeave(DocumentDto document);

	// 연차 전자결재 최종 결제 시 연차지급테이블 수정 서비스
	int updateLeavep(LeavepDto docu);

	// 잔여 연차 조회 서비스
	int selectLeave(LeavepDto le);
	
	// 휴가 신청 내역 총 개수 조회 서비스
	int selectLeaveDocumentListCount(MemberDto m);

	// 휴가 신청 내역 리스트 조회 서비스
	List<DocumentDto> selectLeaveDocumentList(PageInfoDto pi, MemberDto m);

	
}
