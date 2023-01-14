package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.smhrd.model.Want;
import com.smhrd.model.WantDAO;

public class faceInfoCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 사용자가 입력한 id, pw 받기
		//request.setCharacterEncoding("UTF-8");

		// 2. Member 객체 생성(id, pw)
		// 고유번호
		//String want_id = "want" + request.getParameter("want_id");
		// 이름
		//String want_name = "%" + request.getParameter("want_name") + "%";
		// 나이
		//String want_age = "%" + request.getParameter("want_age") + "%";
		// 성별
		//String want_gen = request.getParameter("gender");
		// 죄명
		//String rep_cate = request.getParameter("rep_cate");
		// 대상구분 전체 공개수배
		//String want_open = request.getParameter("want_open");

		//Want vo = new Want(want_id, want_name, want_age, want_gen, rep_cate, want_open);

		// 3. MemberDAO 객체 생성
		WantDAO dao = new WantDAO();

		// 4. dao.selectMember() 메서드 호출
		//Want wantMember = dao.selectMember(vo);

//		if (wantMember != null) { // 로그인 성공
//			System.out.println("검색성공");
//
//			// 5. 세션 저장
//			HttpSession session = request.getSession();
//			session.setAttribute("wantMember", wantMember);
//			response.sendRedirect("faceinfoList.jsp");
//
//		} else { // 로그인 실패
//			System.out.println("검색실패");
//			response.sendRedirect("faceinfoList.jsp");
//		}

		int num = Integer.parseInt(request.getParameter("num"));
		List<Want> list = dao.selectAllListPage(num);
		//System.out.println("1번" + num);

		
		// java를 json 객체로 변환
		JsonObject json = new JsonObject(); // json 객체
		JsonArray jarray = new JsonArray(); // json array

		for (Want w : list) {
			json.addProperty("want_id", w.getWant_id());
			json.addProperty("want_name", w.getWant_name());
			json.addProperty("want_age", w.getWant_age());
			json.addProperty("want_gen", w.getWant_gen());
			json.addProperty("want_img", w.getWant_img());
			json.addProperty("rep_cate", w.getRep_cate());
			json.addProperty("admin_adr1", w.getAdmin_adr1());
			json.addProperty("want_open", w.getWant_open());
			json.addProperty("want_char", w.getWant_char());
			json.addProperty("num", w.getNum());

			jarray.add(json);
			json = new JsonObject();
			
			//System.out.println(w.getWant_id());
		}

		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.print(jarray);

	}

}
