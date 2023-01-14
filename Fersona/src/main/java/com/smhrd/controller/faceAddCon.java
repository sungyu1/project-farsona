package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.Want;
import com.smhrd.model.WantDAO;

public class faceAddCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int num = Integer.parseInt(request.getParameter("num"));
		String want_id = "want" + num;
		String want_name = request.getParameter("want_name");
		String want_age = request.getParameter("want_age");
		String want_gen = request.getParameter("want_gen");
		String want_img = request.getParameter("want_img");
		String rep_cate = request.getParameter("rep_cate");
		String admin_adr1 = request.getParameter("admin_adr1");
		String want_open = request.getParameter("want_open");
		String want_char = request.getParameter("want_char");

		System.out.println(num);
		System.out.println(want_id);
		System.out.println(want_name);
		System.out.println(want_age);
		System.out.println(want_gen);
		System.out.println(want_img);
		System.out.println(rep_cate);
		System.out.println(admin_adr1);
		System.out.println(want_open);
		System.out.println(want_char);
		
		Want vo = new Want(num, want_id, want_name, want_age, want_gen, want_img, rep_cate, admin_adr1, want_open, want_char);

		WantDAO dao = new WantDAO();

		int cnt = dao.insertWant(vo);

		if (cnt > 0) {
			System.out.println("수배자 등록 성공");

			RequestDispatcher rd = request.getRequestDispatcher("faceInfoList.jsp");
			request.setAttribute("result", "success");
			rd.forward(request, response);
		} else {
			System.out.println("수배자 등록 실패");
			RequestDispatcher rd = request.getRequestDispatcher("faceAdd.jsp");
			request.setAttribute("result", "fail");
			rd.forward(request, response);

		}

	}
}
