package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.AssetDto;

public interface AssetService {

	// 차량조회 
	List<AssetDto> selectcarList();
	
	
	// 차량등록
	int insertCar(AssetDto ad);
	
	// 차량 상세조회
	AssetDto selectCar(int no);
	
}
