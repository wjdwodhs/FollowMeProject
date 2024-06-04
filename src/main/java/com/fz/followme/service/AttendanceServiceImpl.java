package com.fz.followme.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.AttendanceDao;
import com.fz.followme.dao.CalendarDao;
import com.fz.followme.dto.AttendanceDto;
import com.fz.followme.dto.DocumentDto;
import com.fz.followme.dto.LeavepDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	private final AttendanceDao attendanceDao;

	@Override
	public int insertWorktime(AttendanceDto att) {
		return attendanceDao.insertWorktime(att);
	}

	@Override
	public int updateWorktime(String memNo) {
		
		return attendanceDao.updateWorktime(memNo);
	}

	@Override
	public AttendanceDto selectStatus(String memNo) {
		return attendanceDao.selectStatus(memNo);
	}

	@Override
	public AttendanceDto selectAttendance(String memNo) {
		return attendanceDao.selectAttendance(memNo);
	}

	@Override
	public int updateErWorktime(String memNo) {
		return attendanceDao.updateErWorktime(memNo);
	}

	@Override
	public List<AttendanceDto> countAttendanceByType(String memNo) {
		return attendanceDao.countAttendanceByType(memNo);
	}

	@Override
	public AttendanceDto monthAttendanceTime(String memNo) {
		return attendanceDao.monthAttendanceTime(memNo);
	}

	@Override
	public AttendanceDto totalAttendanceTime(String memNo) {
		return attendanceDao.totalAttendanceTime(memNo);
	}

	@Override
	public AttendanceDto AjaxMonthAttendanceTime(AttendanceDto att) {
		return attendanceDao.AjaxMonthAttendanceTime(att);
	}

	@Override
	public List<AttendanceDto> AjaxCountAttendanceByType(AttendanceDto att) {
		return attendanceDao.AjaxCountAttendanceByType(att);
	}

	@Override
	public int insertDefaultLeave(LeavepDto leave) {
		return attendanceDao.insertDefaultLeave(leave);
	}

	@Override
	public int insertLeave(DocumentDto document) {
		return attendanceDao.insertLeave(document);
	}

	@Override
	public int updateLeavep(LeavepDto docu) {
		return attendanceDao.updateLeavep(docu);
	}

	@Override
	public int selectLeave(LeavepDto le) {
		return attendanceDao.selectLeave(le);
	}

	@Override
	public int selectLeaveDocumentListCount(MemberDto m) {
		return attendanceDao.selectLeaveDocumentListCount(m);
	}

	@Override
	public List<DocumentDto> selectLeaveDocumentList(PageInfoDto pi, MemberDto m) {
		return attendanceDao.selectLeaveDocumentList(pi,m);
	}

	@Override
	public List<AttendanceDto> AllCountAttendanceByType(PageInfoDto pi) {
		return attendanceDao.AllCountAttendanceByType(pi);
	}

	@Override
	public List<AttendanceDto> AllKeywordCountAttendanceByType(String keyword, PageInfoDto pi) {
		return attendanceDao.AllKeywordCountAttendanceByType(keyword,pi);
	}

	@Override
	public List<AttendanceDto> monthAllCountAttendanceByType(AttendanceDto att, PageInfoDto pi) {
		return attendanceDao.monthAllCountAttendanceByType(att,pi);
	}
	
}
