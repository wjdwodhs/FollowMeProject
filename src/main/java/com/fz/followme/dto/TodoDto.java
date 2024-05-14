package com.fz.followme.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class TodoDto {
	
	private int todoNo;
	private String memNo;
	private String content;
	private String todoDone;

}
