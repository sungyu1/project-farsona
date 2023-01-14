package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Want;
import com.smhrd.model.WantDAO;

public class faceUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		WantDAO dao = new WantDAO();
		String want_id = request.getParameter("want_id");
		System.out.println(want_id);

		Want wantMember = dao.selectOne(want_id);
		
		if (wantMember != null) { // 로그인 성공
			System.out.println("조회 성공");

			// 5. 세션 저장
			HttpSession session = request.getSession();
			session.setAttribute("wantMember", wantMember);
			response.sendRedirect("faceUpdate.jsp");

		} else { // 로그인 실패
			System.out.println("조회 실패");
			response.sendRedirect("faceUpdate.jsp");
		}

	}

}
