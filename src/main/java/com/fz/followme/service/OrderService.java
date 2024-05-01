package com.fz.followme.service;

import java.util.List;

import com.fz.followme.dto.OrderDto;

public interface OrderService {
	
	// 일별 판매량 조회 서비스
	List<OrderDto> selectOrder();

}
