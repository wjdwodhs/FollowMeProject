package com.fz.followme.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class OrderDto {
	
	private int orderNo;
	private int proNo;
	private int orderAmount;
	private Date orderDate;
	
	// 매출액 구하는 join문용 추가
	private String proName;
	private int proPrice;
	private int revenue;
	private String proImgPath;
	

}
