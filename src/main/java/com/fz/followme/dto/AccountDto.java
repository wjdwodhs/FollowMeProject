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
public class AccountDto {
	private int accountNo;
	private String bankName;
	private String bankAccountNo;
	private String accountHolder;
}
