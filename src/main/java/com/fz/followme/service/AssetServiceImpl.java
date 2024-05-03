package com.fz.followme.service;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.AssetDao;
import com.fz.followme.dto.AssetDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AssetServiceImpl implements AssetService {

	private final AssetDao assetDao;


	@Override
	public AssetDto selectcarList() {
		return assetDao.selectcarList();
	}
	
	
	
	
}
