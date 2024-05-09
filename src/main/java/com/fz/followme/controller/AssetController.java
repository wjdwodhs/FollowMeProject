package com.fz.followme.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fz.followme.dto.AssetDto;
import com.fz.followme.dto.AssetReservationDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.service.AssetService;
import com.fz.followme.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/asset")
@Controller
public class AssetController {

	private final AssetService assetService;
	private final PagingUtil pagingUtil;

	// * 관리자 차량관리 -------------------------------------------------------
	@RequestMapping("/carsReservationManager.page")
	public ModelAndView carsReservationManager(@RequestParam(value="page", defaultValue="1") int currentPage
			                             , HttpSession session
			                             , ModelAndView mv) {
		
		// 차량이용내역 조회, 페이징
		int listCount = assetService.selectCarReservationListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<AssetReservationDto> rList = assetService.selectCarReservationList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("rList", rList)
		  .setViewName("assetManagement/carsReservationManager");
		
		// 법인차량 목록 불러오기
		List<AssetDto> carlist = assetService.selectcarList();
		session.setAttribute("carlist", carlist);
		
		for(AssetDto ad:carlist) {
			if(ad.getStatus().equals("Y")) {
				ad.setStatus("이용가능");
			}else if(ad.getStatus().equals("N")) {
				ad.setStatus("이용불가");
			}
		}
		
		session.setAttribute("carlist", carlist);
		
		return mv;
	}
	
	
	
	// 차량등록
	@PostMapping("/insertcar.do")
	public String insertCar(AssetDto ad,
			                RedirectAttributes redirectAttributes) {
		
		log.debug("조건 수행 전 ad : {}", ad);
		
		int result = assetService.insertCar(ad);
		
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "차량 등록에 성공하였습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "차량 등록에 실패하였습니다. 다시 확인해 주십시오.");
		}
		
		log.debug("조건 수행 후 ad : {}", ad);
		log.debug("result : {}", result);
		
		return "redirect:/asset/carsReservationManager.page";
	}
	
	
	// 차량 상세조회
	@ResponseBody
	@PostMapping(value="/detailCar.do", produces="application/json; charset=utf-8")
	public AssetDto ajaxSelectCar(int no) {
		return assetService.selectCar(no);
	}
	
	
	// 차량 등록정보 수정
	@ResponseBody
	@PostMapping(value="/modifycar.do", produces="application/json; charset=utf-8")
	public int ajaxmodifyCar(AssetDto ad,
							 HttpSession session) {
		log.debug("ad : {}", ad);
		
		int result = assetService.updatecar(ad);
		
		if(result > 0) {
			// 수정하고 업데이트 세션에 갱신
			session.setAttribute("selectCar", assetService.selectCar(ad.getAssetNo()));
		}
		
		
		return result;
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
