package com.smhrd.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@NoArgsConstructor // 기본 생성자
@RequiredArgsConstructor // final, @NonNUll
@AllArgsConstructor // 모든 파라미터 받는 생성자
public class User {

	@NonNull
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_join;
	private String mem_adr1;
	private String mem_adr2;
	private String mem_tel;
	private BigDecimal num;
	
}
