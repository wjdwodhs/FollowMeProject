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
public class DocumentDto {
	
	private int docuNo;
	private int docuCategory;
	private String docuTitle;
	private String docuContent;
	private String memNo;
	private int deptNo;
	private Date registDate;
	private String refMemNo;
	private int refDeptNo;
	private String midApprover;
	private Date midApproveDate;
	private String midApproverSig;
	private String finalApprover;
	private Date finalApproveDate;
	private String finalApproverSig;
	private String approverInf;
	private String processReason;
	private String status;
	private String midApproveStatus;
	private String finalApproveStatus;
	private String docuCost;
	private String docuRemark;
	private String docuStartDate;
	private String docuEndDate;
	private String docuStartPlace;
	private String docuEndPlace;
	private String docuEmergencyCall;
	private String docuAnnualLeave;
	private String docuItem;
	private String docuTransportCost;
	private String docuFuelCost;
	private String docuFoodCost;
	private String docuRoomCost;
	private String docuEtcCost;
	private String docuText;
	private String docuTextNote;
	private String docuCount;
	private Date midRejectDate;
	private Date finalRejectDate;
	
	private List<AttachmentDto> attachList;
	
	private int count;
	private String docuCategoryName;
	private String memName;
	private String refMemName;
	private String memDeptName;
	private String refDeptName;
	private String memSig;
	private String memGrade;
	private String memPhone;
	
	private String notiType;
	private String createDate;
	private String notiMsg;
}
