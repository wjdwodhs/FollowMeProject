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
		return documentDao.selectNotDoneListCount(memNo);
	}

	@Override
	public List<DocumentDto> selectNotDoneList(PageInfoDto pi, String memNo) {
		return documentDao.selectNotDoneList(pi, memNo);
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

	// 글 상세보기
	@Override
	public DocumentDto selectDocument(int docuNo) {
		
		return documentDao.selectDocument(docuNo);
		

	}

	
	// 글 회수하기 기능
	@Override
	public int recallDocument(DocumentDto document) {
		
		int result = 0;
		
		try {
			result = documentDao.recallDocument(document);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	// 전자문서 중간 결재 [승인] 기능 (update midApproveStatus)
	@Override
	public int updateMidApprove(DocumentDto document) {
		int result = 0;
		
		try {
			result = documentDao.updateMidApprove(document);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 전자문서 최종 결재 [승인] 기능 (update finalApproveStatus)
	@Override
	public int updateFinalApprove(DocumentDto document) {
		int result = 0;
		
		try {
			result = documentDao.updateFinalApprove(document);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	// 전자문서 최종 결재 [반려] 기능 (update midApproveStatus)
	@Override
	public int updateMidReject(DocumentDto document) {
		int result = 0;
		
		try {
			result = documentDao.updateMidReject(document);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 전자문서 최종 결재 [반려] 기능 (update finalApproveStatus)
	@Override
	public int updateFinalReject(DocumentDto document) {
		int result = 0;
		
		try {
			result = documentDao.updateFinalReject(document);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 결재 처리 - 컨트롤러 단에서 사용됨. 로그인한 사원의 사원번호와 중간결재자의 사원번호가 일치한지 확인
	@Override
	public String selectMidApprover(DocumentDto document) {
		return documentDao.selectMidApprover(document);
	}
	
	// 결재 처리 - 컨트롤러 단에서 사용됨. 로그인한 사원의 사원번호와 최종결재자의 사원번호가 일치한지 확인
	@Override
	public String selectFinalApprover(DocumentDto document) {
		return documentDao.selectFinalApprover(document);
	}

	// 클라이언트단에서 ajax로 첨부파일 조회 기능
	@Override
	public List<AttachmentDto> selectAttachmentList(int docuNo) {
		return documentDao.selectAttachmentList(docuNo);
	}

	// 클라이언트단에서 ajax로 사원 리스트 조회 기능 (전자문서 작성 시 '참조인 조회'로 사용)
	@Override
	public List<MemberDto> selectMemberList() {
		return documentDao.selectMemberList();
	}

	/**
	 * 메인화면 오늘의 전자결재 문서의 개수를 반환하는 메소드 (본인이 조회권한이 있을 경우만 count)
	 * @param count 전자문서의 갯수
	 * @param loginUser : session 로그인한 사원 정보가 담겨있는 Member 객체
	 * @author 이주리 
	 */
	@Override // 미처리 갯수
	public int notDoneCount(MemberDto m) {
		return documentDao.notDoneCount(m);
	}

	@Override // 진행중 갯수
	public int pendCount(MemberDto m) {
		return documentDao.pendCount(m);
	}

	@Override // 오늘의 승인 갯수
	public int approvalCount(MemberDto m) {
		return documentDao.approvalCount(m);
	}

	@Override // 오늘의 반려 갯수
	public int rejectCount(MemberDto m) {
		return documentDao.rejectCount(m);
	}



	



}
