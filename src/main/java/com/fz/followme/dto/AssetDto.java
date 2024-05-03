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
public class AssetDto {

	private int assetNo;
	private String assetType;
	private Date registDate;
	private String assetName;
	private String carNo;
	private int noMem;
	private int rsvnQty;
	private String status;
	private Date modifyDate;
	
}
