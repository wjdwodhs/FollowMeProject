package com.fz.followme.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fz.followme.dto.AssetDto;
import com.fz.followme.service.AssetService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/asset")
@Controller
public class AssetController {

	private final AssetService assetService;

	// * 관리자 차량관리 -------------------------------------------------------
	@RequestMapping("/carsReservationManager.page")
	public String carsReservationManager(HttpSession session) {
		
		// 법인차량 목록 불러오기
		List<AssetDto> carlist = assetService.selectcarList();
		session.setAttribute("carlist", carlist);
		
		log.debug("carlist : {}", carlist);
		
		return "assetManagement/carsReservationManager";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	// --------------------------------------------------------------------
	
	
	// * 사용자 차량예약 --------------------------------
	@RequestMapping("/carsReservation.page")
	public String carsReservation() {
		return "assetManagement/carsReservation";
	}
	// ------------------------------------------------------
	
	
	
	
	
	
	// * 관리자 자리 관리 -----------------------------------------------------
	@RequestMapping("/seatReservationManager.page")
	public String seatReservationManager() {
		return "assetManagement/seatReservationManager";
	}
	
	// -------------------------------------------------------------------
	
	
	
	
	// * 사용자 사무실자리예약 ---------------------------------------------------
	@RequestMapping("/seatReservation.page")
	public String seatReservation() {
		return "assetManagement/seatReservation";
	}
	// -------------------------------------------------------------------
	
	
	//----------------------------------------------
	
	
}
