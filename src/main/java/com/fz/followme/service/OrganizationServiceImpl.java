package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.OrganizationDao;
import com.fz.followme.dto.OrganizationDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OrganizationServiceImpl implements OrganizationService {
	
	private final OrganizationDao organizationDao;
	
	@Override
	public List<OrganizationDto> selectOrganizationList() {
		return organizationDao.selectOrganizationList();
	}

}
