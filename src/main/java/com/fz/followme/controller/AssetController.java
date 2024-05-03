package com.fz.followme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/asset")
@Controller
public class AssetController {

	// * 자산관리페이지 관련 ---------------------------
	@RequestMapping("/carsReservation.page")
	public String carsReservation() {
		return "assetManagement/carsReservation";
	}
	@RequestMapping("/carsReservationManager.page")
	public String carsReservationManager() {
		return "assetManagement/carsReservationManager";
	}
	@RequestMapping("/seatReservation.page")
	public String seatReservation() {
		return "assetManagement/seatReservation";
	}
	@RequestMapping("/seatReservationManager.page")
	public String seatReservationManager() {
		return "assetManagement/seatReservationManager";
	}
	
	//----------------------------------------------
	
	
}
