package com.fz.followme.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class EmailDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	

}
