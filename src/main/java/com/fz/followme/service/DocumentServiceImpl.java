package com.fz.followme.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.DocumentDao;
import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.DocumentDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class DocumentServiceImpl implements DocumentService {

	private final DocumentDao documentDao;

	// 전체 리스트조회 -----------------------------------------------
	@Override
	public int selectDocumentListCount(MemberDto m) {
		return documentDao.selectDocumentListCount(m);
	}

	@Override
	public List<DocumentDto> selectDocumentList(PageInfoDto pi, MemberDto m) {
		return documentDao.selectDocumentList(pi, m);
	}

	// 검색 리스트조회 -----------------------------------------------
	@Override
	public int selectSearchListCount(Map<String, String> search) {
		return documentDao.selectSearchListCount(search);
	}

	@Override
	public List<DocumentDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		return documentDao.selectSearchList(search, pi);
	}
	
	// status에 따른 검색 리스트조회 -----------------------------------------------
	@Override
	public int statusSearchListCount(Map<String, String> search) {
		return documentDao.statusSearchListCount(search);
	}

	@Override
	public List<DocumentDto> statusSearchList(Map<String, String> search, PageInfoDto pi) {
		return documentDao.statusSearchList(search, pi);
	}

	
	// 진행중 리스트조회 -----------------------------------------------
	@Override
	public int selectPendListCount(MemberDto m) {
		return documentDao.selectPendListCount(m);
	}

	@Override
	public List<DocumentDto> selectPendList(PageInfoDto pi, MemberDto m) {
		return documentDao.selectPendList(pi, m);
	}
	
	// 승인 리스트조회 -----------------------------------------------
	@Override
	public int selectApprovalListCount(MemberDto m) {
		return documentDao.selectApprovalListCount(m);
	}

	@Override
	public List<DocumentDto> selectApprovalList(PageInfoDto pi, MemberDto m) {
		return documentDao.selectApprovalList(pi, m);
	}
	
	// 반려 리스트조회 -----------------------------------------------
	@Override
	public int selectRejectListCount(MemberDto m) {
		return documentDao.selectRejectListCount(m);
	}

	@Override
	public List<DocumentDto> selectRejectList(PageInfoDto pi, MemberDto m) {
		return documentDao.selectRejectList(pi, m);
	}
	
	// 회수 리스트조회 -----------------------------------------------
	@Override
	public int selectRecallListCount(MemberDto m) {
		return documentDao.selectRecallListCount(m);
	}

	@Override
	public List<DocumentDto> selectRecallList(PageInfoDto pi, MemberDto m) {
		return documentDao.selectRecallList(pi, m);
	}
	
	// 참조 리스트조회 -----------------------------------------------
	@Override
	public int selectRefListCount(String memNo) {
		return documentDao.selectRefListCount(memNo);
	}

	@Override
	public List<DocumentDto> selectRefList(PageInfoDto pi, String memNo) {
		return documentDao.selectRefList(pi, memNo);
	}
	
	// 미결재 리스트조회 -----------------------------------------------
	@Override
	public int selectNotDoneListCount(String memNo) {
		return documentDao.selectRefListCount(memNo);
	}

	@Override
	public List<DocumentDto> selectNotDoneList(PageInfoDto pi, String memNo) {
		return documentDao.selectRefList(pi, memNo);
	}

	
	// 글 작성하기
	@Override
	public int insertDocument(DocumentDto document) {
		// board insert
		int result1 = documentDao.insertDocument(document);
		// attach insert
		int result2 = 1;
		if(!document.getAttachList().isEmpty()) {
			result2 = 0;
			for(AttachmentDto at : document.getAttachList()) {
				result2 += documentDao.insertAttach(at);
			}
		}
		
		return result1 * result2;
	}






}
