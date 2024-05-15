package com.fz.followme.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.fz.followme.service.ReservationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
public class ReservationScheduler {

	private final ReservationService reservationService;
	
	
	
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
	
	
}
