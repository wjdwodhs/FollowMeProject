package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.OrderDto;

public interface OrderService {
	
	// 일별 판매량 조회 서비스
	List<OrderDto> selectOrder();

	// 최근 1주일치 매출액 높은 순으로 정렬 서비스 (사진, 목록 둘 다)
	List<OrderDto> selectRevenue();
	
	// ceo 메인화면 오늘의 판매량, 오늘의 매출액 보여주기 서비스
	OrderDto selectTodayInfo();
}
