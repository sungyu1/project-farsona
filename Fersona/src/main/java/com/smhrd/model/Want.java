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
public class Want {

	private int num;
	@NonNull
	private String want_id;
	private String want_name;
	private String want_age;
	private String want_gen;
	private String want_img;
	private String rep_cate;
	private String admin_adr1;
	private String want_open;
	private String want_char;

	
	public Want(@NonNull String want_id, String want_name, String want_age, String want_gen, String rep_cate,
			String want_open) {
		this.want_id = want_id;
		this.want_name = want_name;
		this.want_age = want_age;
		this.want_gen = want_gen;
		this.rep_cate = rep_cate;
		this.want_open = want_open;
	}


	public Want(@NonNull String want_id, String want_name, String want_age, String want_gen, String rep_cate, String want_open, String want_char) {
		this.want_id = want_id;
		this.want_name = want_name;
		this.want_age = want_age;
		this.want_gen = want_gen;
		this.rep_cate = rep_cate;
		this.want_open = want_open;
		this.want_char = want_char;
	}

	
	
	

}