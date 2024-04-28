package com.fz.followme.service;

import com.fz.followme.dto.MemberDto;

public interface MemberService {

	// 로그인용 서비스
	MemberDto selectMember(MemberDto m);
}
