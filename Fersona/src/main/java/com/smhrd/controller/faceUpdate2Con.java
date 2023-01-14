package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Want;
import com.smhrd.model.WantDAO;

public class faceUpdate2Con extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String want_id = request.getParameter("want_id");
		String want_name = request.getParameter("want_name");
		String want_age = request.getParameter("want_age");
		String want_gen = request.getParameter("want_gen");
		String rep_cate = request.getParameter("rep_cate");
		String want_char = request.getParameter("want_char");
		String want_open = request.getParameter("want_open");
		
//		System.out.println(want_id);
//		System.out.println(want_name);
//		System.out.println(want_age);
//		System.out.println(want_gen);
//		System.out.println(rep_cate);
//		System.out.println(want_char);
//		System.out.println(want_open);
		
		Want updateWant = new Want(want_id, want_name, want_age, want_gen, rep_cate, want_open, want_char);
		WantDAO dao = new WantDAO();

		System.out.println(want_id);
		int cnt = dao.updateWant(updateWant);

		if (cnt > 0) {
			System.out.println("수정성공");
			HttpSession session1 = request.getSession();
			session1.setAttribute("updateWant", updateWant);
			response.sendRedirect("faceInfoList.jsp");
		} else {
			System.out.println("수정실패");
			response.sendRedirect("faceInfoList.jsp");
		}
	}

}
