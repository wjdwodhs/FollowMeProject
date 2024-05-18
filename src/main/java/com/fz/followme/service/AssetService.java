package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.AssetDto;
import com.fz.followme.dto.AssetReservationDto;
import com.fz.followme.dto.PageInfoDto;

public interface AssetService {

	// 차량조회
	List<AssetDto> selectcarList();
	
	// 차량등록(관리자)
	int insertCar(AssetDto ad);
	
	// 차량 상세조회(관리자)
	AssetDto selectCar(int no);
	
	// 차량 정보 수정(관리자)
	int updatecar(AssetDto ad);
	
	// 차량 이용내역 조회,페이징(관리자)
	int selectCarReservationListCount();
	List<AssetReservationDto> selectCarReservationList(PageInfoDto pi);
	
	// 차량삭제(관리자)
	int deleteCar(int no);
	
	// 차량예약 내역 선택 삭제(관리자)
	int deleteRsvnList(int[] checkedRsvnArr);
	

	// 차량 예약내역 조회(사용자)
	List<AssetReservationDto> selectDateList(String rsvnDate);
	
	// 차량 예약내역 선택 삭제(사용자)
	int deleteRsvnListMember(int[] checkedRsvn);
	
	
	// 좌석 예약내역 조회
	List<AssetReservationDto> selectSeatList(String rsvnDate);

	
	// 좌석 상태변경(관리자)
	int updateStatusSeat(AssetDto ad);

	
	
}
