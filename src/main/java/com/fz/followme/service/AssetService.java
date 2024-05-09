package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.AssetDto;
import com.fz.followme.dto.AssetReservationDto;
import com.fz.followme.dto.PageInfoDto;

public interface AssetService {

	// 차량조회 
	List<AssetDto> selectcarList();
	
	
	// 차량등록
	int insertCar(AssetDto ad);
	
	// 차량 상세조회
	AssetDto selectCar(int no);
	
	// 차량 정보 수정
	int updatecar(AssetDto ad);
	
	// 차량 이용내역 조회,페이징
	int selectCarReservationListCount();
	List<AssetReservationDto> selectCarReservationList(PageInfoDto pi);
	
	
}
