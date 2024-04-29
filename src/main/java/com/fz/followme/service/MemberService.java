package com.fz.followme.service;

import com.fz.followme.dto.MemberDto;

public interface MemberService {

	// 로그인용 서비스
	MemberDto selectMember(MemberDto m);
	
	// 이메일로 존재하는 사용자인지 확인하는 서비스
	MemberDto memEmailCheck(String memEmail);
	
	// 임시 비밀번호(암호화) DB에 업데이트 하는 서비스
	int updateTempPwd(MemberDto isMember);
}
