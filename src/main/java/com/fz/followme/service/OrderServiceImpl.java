package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.OrderDao;
import com.fz.followme.dto.OrderDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OrderServiceImpl implements OrderService {
	
	private final OrderDao orderDao;

	@Override
	public List<OrderDto> selectOrder() {
		return orderDao.selectOrder();
	}

	@Override
	public List<OrderDto> selectRevenue() {
		return orderDao.selectRevenue();
	}

	@Override
	public OrderDto selectTodayInfo() {
		return orderDao.selectTodayInfo();
	}

}
