package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.MemberDao;
import com.fz.followme.dto.AccountDto;
import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.LicenseDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	
	private final MemberDao memberDao;

	@Override
	public MemberDto selectMember(MemberDto m) {
		return memberDao.selectMember(m);
	}

	@Override
	public MemberDto memEmailCheck(String memEmail) {
		return memberDao.memEmailCheck(memEmail);
	}

	@Override
	public int updateTempPwd(MemberDto isMember) {
		return memberDao.updateTempPwd(isMember);
	}

	@Override
	public int changeEmail(MemberDto isMember) {
		return memberDao.changeEmail(isMember);
	}

	@Override
	public MemberDto memEmailDoubleCheck(String newEmail) {
		return memberDao.memEmailDoubleCheck(newEmail);
	}

	@Override
	public List<LicenseDto> selectLicense(String memNo) {
		return memberDao.selectLicense(memNo);
	}

	@Override
	public AccountDto selectAccount(String memNo) {
		return memberDao.selectAccount(memNo);
	}

	@Override
	public int updateLicense(LicenseDto license) {
		return memberDao.updateLicense(license);
	}

	@Override
	public int deleteLicense(LicenseDto license) {
		return memberDao.deleteLicense(license);
	}

	@Override
	public int addLicense(LicenseDto license) {
		return memberDao.addLicense(license);
	}
	
	@Override
	public int updateProfileImg(MemberDto m) {
		return memberDao.updateProfileImg(m);
	}
	
	@Override
	public int updateSigImg(MemberDto m) {
		return memberDao.updateSigImg(m);
	}

	@Override
	public int updatePersonalInfo(MemberDto m) {
		return memberDao.updatePersonalInfo(m);
	}

	@Override
	public int updateAccountInfo(AccountDto ac) {
		return memberDao.updateAccountInfo(ac);
	}

	@Override
	public int deleteAttachment(int licNo) {
		return memberDao.deleteAttachment(licNo);
	}

	@Override
	public int insertAttachment(AttachmentDto attach) {
		return memberDao.insertAttachment(attach);
	}

	@Override
	public AttachmentDto selectAttachment(int licNo) {
		return memberDao.selectAttachment(licNo);
	}
	
	@Override
	public int selectMemberListCount() {
		return memberDao.selectMemberListCount();
	}

	@Override
	public List<MemberDto> selectMemberList(PageInfoDto pi) {
		return memberDao.selectMemberList(pi);
	}

	@Override
	public List<MemberDto> searchMemberList(String keyword, PageInfoDto pi) {
		return memberDao.searchMemberList(keyword, pi);
	}

	@Override
	public int searchMemberListCount(String keyword) {
		return memberDao.searchMemberListCount(keyword);
	}

	@Override
	public int insertNewEmp(MemberDto m) {
		return memberDao.insertNewEmp(m);
	}

	@Override
	public int memNoCheck(String memNoCheck) {
		return memberDao.memNoCheck(memNoCheck);
	}

	@Override
	public int modifyEmpInfo(MemberDto m) {
		return memberDao.modifyEmpInfo(m);
	}

	@Override
	public int deleteEmpInfo(String memNo) {
		return memberDao.deleteEmpInfo(memNo);
	}

	

	


}
