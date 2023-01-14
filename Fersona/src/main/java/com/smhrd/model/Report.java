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
public class Report {

	@NonNull
	private int num;
	private String rep_cate;
	private String rep_con;
	private String rep_date;
	private String rep_time;
	private String mem_id;
	private String rep_adr;
	private String mon_id;
	private String want_id;
	private String rep_pro;
	private String rep_wri;
	private String position;
	private String mon_img;
	private String mon_char;
	
	public Report(@NonNull int num, String rep_pro) {
		this.num = num;
		this.rep_pro = rep_pro;
	}
	
	
	
}
