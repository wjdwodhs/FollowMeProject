package com.fz.followme.service;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fz.followme.dao.AssetDao;
import com.fz.followme.dto.AssetReservationDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReservationServiceImpl implements ReservationService {
	
	private final AssetDao assetDao;
	
	@Transactional
	@Override
	public int addReservation(AssetReservationDto ard) throws DataAccessException {
		// 중복예약확인
		if(assetDao.doublecheckReservation(ard) > 0) {
			throw new DataAccessException("예약이 중복 되었습니다.") {
			private static final long serialVersionUID = 1L;
		};
	  }
	
		// 중복 없을시 예약 정보 insert
		return assetDao.insertRsvnCar(ard);
	}

	@Override
	public int updateAssetStatus() {
		return assetDao.updateAssetStatus();
	}




	

}
