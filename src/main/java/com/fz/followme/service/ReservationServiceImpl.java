package com.fz.followme.service;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fz.followme.dao.AssetDao;
import com.fz.followme.dto.AssetReservationDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ReservationServiceImpl implements ReservationService {
	
	private final AssetDao assetDao;
	
	@Transactional
	@Override
	public int addReservation(AssetReservationDto ard) throws DataAccessException {
		
		// 중복 예약 확인
		System.out.println("Checking for duplicate reservation");
		if(assetDao.doublecheckReservation(ard) > 0) {
			throw new DataAccessException("예약이 중복 되었습니다.") {
			private static final long serialVersionUID = 1L;
		};
	  }
	
		// 중복 없을시 예약 정보 insert
		 System.out.println("No duplicate found, inserting reservation");
		return assetDao.insertRsvn(ard);
	}

	@Override
	public int updateAssetendDateStatus() {
		return assetDao.updateAssetendDateStatus();
	}

	@Override
	public int updateAssetstartDateStatus() {
		return assetDao.updateAssetstartDateStatus();
	}

	@Override
	public int hasReservation(AssetReservationDto ard) {
		return assetDao.hasReservation(ard);
	}

	/*
	@Override
	public int updateSeatStatus(AssetDto ad) {
		return assetDao.updateStatusSeat(ad);
	}
	*/


	

}
