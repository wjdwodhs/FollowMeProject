package com.fz.followme.dto;

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
public class CareerDto {
	
	private int carrNo;
	private String memNo;
	private String carrTime;
	private String carrCorp;
	private String carrContent;

}
