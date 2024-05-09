package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.AccountDto;
import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.LicenseDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;

public interface MemberService {

	// 로그인용 서비스
	MemberDto selectMember(MemberDto m);
	
	// 이메일로 존재하는 사용자인지 확인하는 서비스
	MemberDto memEmailCheck(String memEmail);
	
	// 임시 비밀번호(암호화) DB에 업데이트 하는 서비스
	int updateTempPwd(MemberDto isMember);
	
	// 사용자가 입력한 새로운 이메일로 변경하는 서비스
	int changeEmail(MemberDto isMember);
	
	// 사용자가 입력한 새로운 이메일이 기존 DB와 중복되지 않는지 확인하는 서비스
	MemberDto memEmailDoubleCheck(String newEmail);
	
	// 사용자의 자격증 정보를 조회하는 서비스
	List<LicenseDto> selectLicense(String memNo);
	
	// 사용자의 계좌정보를 조회하는 서비스
	AccountDto selectAccount(String memNo);
	
	// 사용자의 자격증 정보를 업데이트 하는 서비스
	int updateLicense(LicenseDto license);
	
	// 사용자의 자격증 정보를 삭제하는 서비스
	int deleteLicense(LicenseDto license);
	
	// 사용자의 자격증 정보를 추가하는 서비스
	int addLicense(LicenseDto license);
	
	// 마이페이지 - 개인정보 업데이트 서비스
	int updatePersonalInfo(MemberDto m);
	
	// 마이페이지 - 계좌정보 업데이트 서비스
	int updateAccountInfo(AccountDto ac);
	
	// 마이페이지 - 자격증 첨부파일 삭제 서비스
	int deleteAttachment(int licNo);
	
	// 마이페이지 - 자격증 첨부파일 등록 서비스
	int insertAttachment(AttachmentDto attachment);
	
	// 마이페이지 - 자격증 첨부파일 조회 서비스
	AttachmentDto selectAttachment(int licNo);
	
	// 마이페이지 - 프로필 이미지 변경 서비스
	int updateProfileImg(MemberDto m);
	
	// 마이페이지 - 전자서명 이미지 등록 서비스
	int updateSigImg(MemberDto m);
	
	// 인사관리 - 직원 리스트 조회 서비스 (페이징)
	int selectMemberListCount();
	List<MemberDto> selectMemberList(PageInfoDto pi);
	
	// 인사관리 - 검색 서비스
	int searchMemberListCount(String keyword);
	List<MemberDto> searchMemberList(String keyword, PageInfoDto pi);
	
	// 인사관리 - 신규 직원 등록 서비스
	int insertNewEmp(MemberDto m);
	
	// 인사관리 - 신규 직원 등록 시 사원번호 중복 여부 확인 서비스
	int memNoCheck(String memNoCheck);
	
	// 인사관리 - 직원정보 수정 서비스
	int modifyEmpInfo(MemberDto m);
	
	// 인사관리 - 직원정보 삭제 서비스
	int deleteEmpInfo(String memNo);
}
