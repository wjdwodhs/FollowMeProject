package com.fz.followme.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.fz.followme.dto.AttendanceDto;
import com.fz.followme.dto.DocumentDto;
import com.fz.followme.dto.LeavepDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;

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

	public AttendanceDto AjaxMonthAttendanceTime(AttendanceDto att) {
		return sqlSessionTemplate.selectOne("attendanceMapper.AjaxMonthAttendanceTime", att);
	}

	public List<AttendanceDto> AjaxCountAttendanceByType(AttendanceDto att) {
		return sqlSessionTemplate.selectList("attendanceMapper.AjaxCountAttendanceByType", att);
	}

	public int insertDefaultLeave(LeavepDto leave) {
		return sqlSessionTemplate.insert("attendanceMapper.insertDefaultLeave", leave);
	}

	public int insertLeave(DocumentDto document) {
		return sqlSessionTemplate.insert("attendanceMapper.insertLeave",document);
	}

	public int updateLeavep(LeavepDto docu) {
		return sqlSessionTemplate.update("attendanceMapper.updateLeavep",docu);
	}

	public int selectLeave(LeavepDto le) {
		return sqlSessionTemplate.selectOne("attendanceMapper.selectLeave",le);
	}

	public int selectLeaveDocumentListCount(MemberDto m) {
		return sqlSessionTemplate.selectOne("attendanceMapper.selectLeaveDocumentListCount",m);
	}

	public List<DocumentDto> selectLeaveDocumentList(PageInfoDto pi, MemberDto m) {
		
		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds= new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("attendanceMapper.selectLeaveDocumentList", m, rowBounds);
		
	}

	public List<AttendanceDto> AllCountAttendanceByType(PageInfoDto pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("attendanceMapper.AllCountAttendanceByType", null, rowBounds);
	}

	public List<AttendanceDto> AllKeywordCountAttendanceByType(String keyword, PageInfoDto pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("attendanceMapper.AllKeywordCountAttendanceByType", keyword, rowBounds);
	}

	public List<AttendanceDto> monthAllCountAttendanceByType(AttendanceDto att, PageInfoDto pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("attendanceMapper.monthAllCountAttendanceByType", att, rowBounds);
	}
	
	
}
