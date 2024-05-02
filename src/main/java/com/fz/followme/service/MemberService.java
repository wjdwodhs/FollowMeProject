package com.fz.followme.service;

import com.fz.followme.dto.MemberDto;

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
}
