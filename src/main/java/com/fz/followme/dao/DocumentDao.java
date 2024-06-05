package com.fz.followme.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.AttachmentDto;
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
	
	// status에 따른 검색 리스트조회
	public int statusSearchListCount(Map<String, String> search) {
		return sqlSessionTemplate.selectOne("documentMapper.statusSearchListCount", search);
	}

	public List<DocumentDto> statusSearchList(Map<String, String> search, PageInfoDto pi) {
		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds= new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("documentMapper.statusSearchList", search, rowBounds);
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
	
	// 미처리 리스트조회 -----------------------------------------------
	public int selectNotDoneListCount(String memNo) {
		return sqlSessionTemplate.selectOne("documentMapper.selectNotDoneListCount", memNo);
	}

	public List<DocumentDto> selectNotDoneList(PageInfoDto pi, String memNo) {
		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds= new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("documentMapper.selectNotDoneList", memNo, rowBounds);
	}

	public int insertDocument(DocumentDto document) {
		return sqlSessionTemplate.insert("documentMapper.insertDocument", document);
	}

	public int insertAttach(AttachmentDto at) {
		return sqlSessionTemplate.insert("documentMapper.insertAttach", at);
	}

	public String selectApprover(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("documentMapper.selectApprover", map);
	}

	public DocumentDto selectDocument(int docuNo) {
		return sqlSessionTemplate.selectOne("documentMapper.selectDocument", docuNo);
	}

	public int recallDocument(DocumentDto document) {
		return sqlSessionTemplate.update("documentMapper.recallDocument", document);
	}

	public int updateMidApprove(DocumentDto document) {
		return sqlSessionTemplate.update("documentMapper.updateMidApprove", document);
	}

	public int updateFinalApprove(DocumentDto document) {
		return sqlSessionTemplate.update("documentMapper.updateFinalApprove", document);
	}

	public int updateMidReject(DocumentDto document) {
		return sqlSessionTemplate.update("documentMapper.updateMidReject", document);
	}

	public int updateFinalReject(DocumentDto document) {
		return sqlSessionTemplate.update("documentMapper.updateFinalReject", document);
	}

	public String selectMidApprover(DocumentDto document) {
		return sqlSessionTemplate.selectOne("documentMapper.selectMidApprover", document);
	}

	public String selectFinalApprover(DocumentDto document) {
		return sqlSessionTemplate.selectOne("documentMapper.selectFinalApprover", document);
	}

	public List<AttachmentDto> selectAttachmentList(int docuNo) {
		return sqlSessionTemplate.selectList("documentMapper.selectAttachmentList", docuNo);
	}

	public List<MemberDto> selectMemberList() {
		return sqlSessionTemplate.selectList("documentMapper.selectMemberList");
	}

	
	/**
	 * 메인화면 오늘의 전자결재 문서의 개수를 반환하는 메소드 (본인이 조회권한이 있을 경우만 count)
	 * @param count 전자문서의 갯수
	 * @param loginUser : session 로그인한 사원 정보가 담겨있는 Member 객체
	 * @author 이주리 
	 */
	public int notDoneCount(MemberDto m) { // 미처리
		return sqlSessionTemplate.selectOne("selectNotDoneListCount", m);
	}

	public int pendCount(MemberDto m) { // 진행중
		return sqlSessionTemplate.selectOne("selectPendListCount", m);
	}

	public int approvalCount(MemberDto m) { // 오늘의 승인건
		return sqlSessionTemplate.selectOne("approvalCount", m);
	}

	public int rejectCount(MemberDto m) { // 오늘의 반려건
		return sqlSessionTemplate.selectOne("rejectCount", m);
	}


	
}
