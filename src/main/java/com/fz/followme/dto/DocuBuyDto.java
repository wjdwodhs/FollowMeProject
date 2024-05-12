package com.fz.followme.dto;

import java.sql.Date;
import java.util.List;

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
public class DocuBuyDto {
	
	private String docuBuyItems;
	private String docuBuyCount;
	private String docuBuyPrice;
	private String docuBuySumPrice;
	private String docuBuyRemark;
	
}
