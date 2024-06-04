package com.fz.followme.dto;

import java.sql.Date;
import java.sql.Timestamp;

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
public class AttendanceDto {

	 private String memNo;
	 private String startTime;
	 private String endTime;
	 private int workTime;
	 private String type;
	 private Date attDate;
	 private String attContent;
	 private int count;
	 private String targetMonth;
     private int workingDays;
     private String monthWorkTime;
     private double avgWorkTime;
     private int totalWorkTime;
     private int totalWorkingDays;
     private String currentYear;
     private String currentMonth;
     
   
 	 private String memPwd;
 	 private int deptNo;
 	 private String profileImgPath;
 	 private String sigImgPath;
 	 private String gender;
 	 private String memName;
 	 private String securityNo;
 	 private String address;
 	 private String memEmail;
 	 private String memGrade;
 	 private String gradeLevel;
 	 private String memRole;
 	 private String extensionNumber;
 	 private String phone;
 	 private Date enrollDate;
 	 private Date quitDate;
 	 private String memSalary;
 	 private int accountNo;
 	 private String memIncentive;
 	 private String memCertificate;
 	 private String memWelfare;
 	 private String authLevel;
 	 private String status;
 	
 	 private String deptName;
 	 private String hashedPassword;
 	 private String memNewEmail;
 	 
 	 private int countB;
 	 private int countC;
 	 private int countD;
 	 private int countE;

	
}
