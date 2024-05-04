package com.fz.followme.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.AccountDto;
import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.LicenseDto;
import com.fz.followme.dto.MemberDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class MemberDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	// 로그인 서비스
	public MemberDto selectMember(MemberDto m) {
		return sqlSessionTemplate.selectOne("memberMapper.selectMember", m);
	}
	
	// 이메일로 존재하는 회원인지 확인(조회)하는 서비스
	public MemberDto memEmailCheck(String memEmail) {
		return sqlSessionTemplate.selectOne("memberMapper.memEmailCheck", memEmail);
	}
	
	// 임시 비밀번호 로그인용 사원정보 업데이트 서비스
	public int updateTempPwd(MemberDto isMember) {
		return sqlSessionTemplate.update("memberMapper.updateTempPwd", isMember);
	}
	
	// 사용자가 입력한 이메일로 변경하는 서비스
	public int changeEmail(MemberDto isMember) {
		return sqlSessionTemplate.update("memberMapper.changeEmail", isMember);
	}
	
	// 사용자가 입력한 이메일이 중복되는지 확인하는 서비스
	public MemberDto memEmailDoubleCheck(String newEmail) {
		return sqlSessionTemplate.selectOne("memberMapper.memEmailDoubleCheck", newEmail);
	}
	
	// 사용자의 자격증 정보를 조회하는 서비스
	public List<LicenseDto> selectLicense(String memNo) {
		return sqlSessionTemplate.selectList("memberMapper.selectLicense", memNo);
	}
	
	// 사용자의 계좌정보를 조회하는 서비스
	public AccountDto selectAccount(String memNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectAccount", memNo);
	}
	
	// 사용자의 자격증 정보를 수정하는 서비스
	public int updateLicense(LicenseDto license) {
		return sqlSessionTemplate.update("memberMapper.updateLicense", license);
	}
	
	// 사용자의 자격증 정보를 삭제하는 서비스
	public int deleteLicense(LicenseDto license) {
		return sqlSessionTemplate.delete("memberMapper.deleteLicense", license);
	}
	
	// 사용자의 자격증 정보를 추가하는 서비스
	public int addLicense(LicenseDto license) {
		return sqlSessionTemplate.insert("memberMapper.addLicense", license);
	}
	
	// 사용자의 개인정보를 업데이트 하는 서비스
	public int updatePersonalInfo(MemberDto m) {
		return sqlSessionTemplate.update("memberMapper.updatePersonalInfo", m);
	}
	
	// 사용자의 계좌정보를 업데이트 하는 서비스
	public int updateAccountInfo(AccountDto ac) {
		return sqlSessionTemplate.update("memberMapper.updateAccountInfo", ac);
	}
	
	// 자격증 첨부파일 추가하는 서비스
	public int insertAttachment(AttachmentDto attach) {
		return sqlSessionTemplate.insert("memberMapper.insertAttach", attach);
	}
	
	// 자격증 첨부파일 삭제 서비스
	public int deleteAttachment(int licNo) {
		return sqlSessionTemplate.delete("memberMapper.deleteAttachment", licNo);
	}
	
	// 자격증 첨부파일 조회 서비스
	public AttachmentDto selectAttachment(int licNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectAttachment", licNo);
	}
}
