package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.OrganizationDto;

public interface OrganizationService {
	
	// 조직도 리스트
	List<OrganizationDto> selectOrganizationList();
	
	
	// 사원 정보
	OrganizationDto selectEmployeeInfo(String employeeId);
	
}
