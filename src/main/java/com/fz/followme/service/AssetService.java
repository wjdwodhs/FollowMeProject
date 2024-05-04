package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.AssetDto;

public interface AssetService {

	// 차량조회 
	List<AssetDto> selectcarList();
	
}
