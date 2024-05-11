package com.fz.followme.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.OrderDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class OrderDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<OrderDto> selectOrder() {
		return sqlSessionTemplate.selectList("orderMapper.selectOrder");
	}
	
	public OrderDto selectRevenue() {
		return sqlSessionTemplate.selectOne("orderMapper.selectRevenue");
	}
	
	public OrderDto selectTodayInfo() {
		return sqlSessionTemplate.selectOne("orderMapper.selectTodayInfo");
	}
}
