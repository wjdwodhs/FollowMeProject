package com.fz.followme.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.DocumentDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class DocumentDao {
	private final SqlSessionTemplate sqlSessionTemplate;

	// 전체 리스트조회 -----------------------------------------------
	public int selectDocumentListCount(MemberDto m) {
		return sqlSessionTemplate.selectOne("documentMapper.selectDocumentListCount", m);
	}

	public List<DocumentDto> selectDocumentList(PageInfoDto pi, MemberDto m) {
		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds= new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("documentMapper.selectDocumentList", m, rowBounds);
	}

	public int selectSearchListCount(Map<String, String> search) {
		return sqlSessionTemplate.selectOne("documentMapper.selectSearchListCount", search);
	}
	
	// 검색 리스트조회 -----------------------------------------------
	public List<DocumentDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds= new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("documentMapper.selectSearchList", search, rowBounds);
	}
	
	// 진행중 리스트조회 -----------------------------------------------
	public int selectPendListCount(MemberDto m) {
		return sqlSessionTemplate.selectOne("documentMapper.selectPendListCount", m);
	}

	public List<DocumentDto> selectPendList(PageInfoDto pi, MemberDto m) {
		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds= new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("documentMapper.selectPendList", m, rowBounds);
	}
	
	// 승인 리스트조회 -----------------------------------------------
	public int selectApprovalListCount(MemberDto m) {
		return sqlSessionTemplate.selectOne("documentMapper.selectApprovalListCount", m);
	}

	public List<DocumentDto> selectApprovalList(PageInfoDto pi, MemberDto m) {
		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds= new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("documentMapper.selectApprovalList", m, rowBounds);
	}
	
	// 반려 리스트조회 -----------------------------------------------
	public int selectRejectListCount(MemberDto m) {
		return sqlSessionTemplate.selectOne("documentMapper.selectRejectListCount", m);
	}

	public List<DocumentDto> selectRejectList(PageInfoDto pi, MemberDto m) {
		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds= new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("documentMapper.selectRejectList", m, rowBounds);
	}
	
	// 반려 리스트조회 -----------------------------------------------
	public int selectRecallListCount(MemberDto m) {
		return sqlSessionTemplate.selectOne("documentMapper.selectRecallListCount", m);
	}

	public List<DocumentDto> selectRecallList(PageInfoDto pi, MemberDto m) {
		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds= new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("documentMapper.selectRecallList", m, rowBounds);
	}

	
	// 참조 리스트조회 -----------------------------------------------
	public int selectRefListCount(String memNo) {
		return sqlSessionTemplate.selectOne("documentMapper.selectRefListCount", memNo);
	}

	public List<DocumentDto> selectRefList(PageInfoDto pi, String memNo) {
		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds= new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("documentMapper.selectRefList", memNo, rowBounds);
	}
	
}
