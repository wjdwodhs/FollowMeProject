package com.fz.followme.service;

import java.util.List;
import java.util.Map;

import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.DocumentDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;

public interface DocumentService {
	
	// 전체 리스트 조회 
	int selectDocumentListCount(MemberDto m);
	List<DocumentDto> selectDocumentList(PageInfoDto pi, MemberDto m);
	
	// 게시판검색리스트 조회 서비스 (페이징)
	int selectSearchListCount(Map<String, String> search);
	List<DocumentDto> selectSearchList(Map<String, String> search, PageInfoDto pi);
	
	// status에 따른 게시판검색리스트 조회 서비스 (페이징)
	int statusSearchListCount(Map<String, String> search);
	List<DocumentDto> statusSearchList(Map<String, String> search, PageInfoDto pi);
	
	// 진행중 리스트 조회
	int selectPendListCount(MemberDto m);
	List<DocumentDto> selectPendList(PageInfoDto pi, MemberDto m);
	
	// 승인 리스트 조회
	int selectApprovalListCount(MemberDto m);
	List<DocumentDto> selectApprovalList(PageInfoDto pi, MemberDto m);
	
	// 반려 리스트 조회
	int selectRejectListCount(MemberDto m);
	List<DocumentDto> selectRejectList(PageInfoDto pi, MemberDto m);
	
	// 회수 리스트 조회
	int selectRecallListCount(MemberDto m);
	List<DocumentDto> selectRecallList(PageInfoDto pi, MemberDto m);
	
	// 참조 리스트 조회
	int selectRefListCount(String memNo);
	List<DocumentDto> selectRefList(PageInfoDto pi, String memNo);
	
	// 미처리 리스트 조회
	int selectNotDoneListCount(String memNo);
	List<DocumentDto> selectNotDoneList(PageInfoDto pi, String memNo);
	
	// 글 작성 기능
	int insertDocument(DocumentDto document);
	
	// 상세 페이지 조회
	DocumentDto selectDocument(int docuNo);
	
	// 글 회수(삭제) 기능 (update status)
	int recallDocument(DocumentDto document);
	
	// 전자문서 중간 결재 [승인] 기능 (update midApproveStatus)
	int updateMidApprove(DocumentDto document);
	
	// 전자문서 최종 결재 [승인] 기능 (update finalApproveStatus)
	int updateFinalApprove(DocumentDto document);
		
	// 전자문서 중간 결재 [반려] 기능 (update midApproveStatus)
	int updateMidReject(DocumentDto document);

	// 전자문서 최종 결재 [반려] 기능 (update finalApproveStatus)
	int updateFinalReject(DocumentDto document);

	// 중간결재자 불러오기
	String selectMidApprover(DocumentDto document);

	// 최종결재자 불러오기
	String selectFinalApprover(DocumentDto document);
	
	// 문서 조회 시 ajax로 첨부파일 조회하기
	List<AttachmentDto> selectAttachmentList(int docuNo);
	
	// 문서 작성 시 ajax로 직원 조회하기 (참조인 선택)
	List<MemberDto> selectMemberList();
	
	/**
	 * 메인화면 전자결재 상태에 따른 문서의 갯수 (본인이 조회할수 있는 권한의 문서글일 경우에만 count)
	 * @param m 현재 로그인한 사원의 Member 객체에 담긴 사원번호
	 * @author 이주리
	 */
	// 결재권자일 경우 미처리 결재건
	int notDoneCount(MemberDto m);
	// 진행중인 문서
	int pendCount(MemberDto m);
	// 오늘 날짜로 승인된 문서
	int approvalCount(MemberDto m);
	// 오늘 날짜로 반려된 문서
	int rejectCount(MemberDto m);
	
	
	
	
	
	
	
}
