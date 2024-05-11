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
public class AssetReservationDto {
	
	private int rsvnNo;
	private int assetNo;
	private String rsvnName;
	private Date rsvnDate;
	private String startDivision;
	private String startDate;
	private String endDivision;
	private String endDate;
	private String rsvnContent;
	private String status;
	
	// 관리자페이지 예약조회를 위한 필드
	private String assetName;
	private String deptName;
	
	// 예약관리 선택 번호
	private int[] checkedRsvn;
	
	
}
