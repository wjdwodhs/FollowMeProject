package com.fz.followme.service;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.MemberDao;
import com.fz.followme.dto.MemberDto;

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
}
