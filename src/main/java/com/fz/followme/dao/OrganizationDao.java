package com.fz.followme.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.OrganizationDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class OrganizationDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<OrganizationDto> selectOrganizationList(){
		
		return sqlSessionTemplate.selectList("organizationMapper.selectOrganizationList");
	}

}
