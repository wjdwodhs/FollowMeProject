package com.fz.followme.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}
