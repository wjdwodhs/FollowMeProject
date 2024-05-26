package com.fz.followme.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.AttendanceDao;
import com.fz.followme.dao.CalendarDao;
import com.fz.followme.dto.AttendanceDto;

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
	
}
