package com.fz.followme.scheduler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.fz.followme.dto.AssetDto;
import com.fz.followme.service.ReservationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
public class ReservationScheduler {

	private final ReservationService reservationService;
	private final List<String> assetNames;
	
	
	@Scheduled(cron = "0 0 * * * *") // 자정에서부터 1시간마다 실행
	public void updateAssetstartDateStatus() {
		int result = reservationService.updateAssetstartDateStatus();
		log.debug("시작일 업데이트 결과: {}", result);
	}
	
	
	@Scheduled(cron = "0 0 * * * *")  
	public void checkUpdateAssetStatus() {
		int result = reservationService.updateAssetendDateStatus();
		log.debug("종료일 업데이트 결과: {}", result);
	}
	
	
	/*
	@Scheduled(cron = "0 0 * * * *")
	public void updateStatusSeat() {
		
		String todayDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		for(String assetName : assetNames) {
			AssetDto ad = new AssetDto();
			ad.setAssetName(assetName);
			ad.setModifyDate(todayDate);
			
			int result = reservationService.updateSeatStatus(ad);
			log.debug("좌석상태 업데이트 결과 : {}{}", assetName, result);
		}
		
	}
	*/
	
	
}
