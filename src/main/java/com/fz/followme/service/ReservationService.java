package com.fz.followme.service;

import org.springframework.dao.DataAccessException;

import com.fz.followme.dto.AssetReservationDto;

public interface ReservationService {
    
	
	// 트랜잭션 스케쥴러 관련 service
	
	
	// 차량예약 insert(트랜잭션)
	int addReservation(AssetReservationDto reservationDto) throws DataAccessException;

	 
	// 시작된 예약상태 수정
	int updateAssetstartDateStatus();
	
	// 종료된 예약상태 수정
	int updateAssetendDateStatus();



}