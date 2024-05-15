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
	
	
	
	@Scheduled(fixedRate = 60000)  // 1분마다 실행
	public void checkUpdateAssetStatus() {
		int result = reservationService.updateAssetStatus();
		log.debug("종료된 예약 수 : {}", result);
	}
	
	
}
