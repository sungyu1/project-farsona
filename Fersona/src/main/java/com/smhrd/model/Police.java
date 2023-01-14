package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@NoArgsConstructor // 기본 생성자
@RequiredArgsConstructor // final, @NonNUll
@AllArgsConstructor // 모든 파라미터 받는 생성자
public class Police {

	@NonNull
	private String police_id;
	private String police_name;
	private String police_adr1;
	private String police_adr2;

}
