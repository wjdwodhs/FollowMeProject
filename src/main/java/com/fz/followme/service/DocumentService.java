package com.fz.followme.service;

import java.util.List;
import java.util.Map;

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
}
