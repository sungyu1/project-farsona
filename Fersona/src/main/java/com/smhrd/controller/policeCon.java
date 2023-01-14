package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.Police;


public class policeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사원번호 조회
		request.setCharacterEncoding("UTF-8");

		String police_id = request.getParameter("police_id");

		Police vo = new Police(police_id);

		MemberDAO dao = new MemberDAO();

		Police loginMember = dao.checkMember(vo);

		//String cnt = "1";

		if (loginMember != null) {
			System.out.println("사원번호 조회 성공");
			/*
			 * HttpSession session = request.getSession();
			 * session.setAttribute("loginMember", loginMember);
			 * response.sendRedirect("join.jsp");
			 */

			// 포워딩(forwarding) 방식
			RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
			// request객체에 공유할 값을 저장
			// request.setAttribute(네임, 값);
			request.setAttribute("loginMember", loginMember);
			// 넘겨줄 값
			rd.forward(request, response);
		} else {
			System.out.println("사원번호 조회 실패");
			RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
			//request.setAttribute("cnt", cnt);
			rd.forward(request, response);

			// response.sendRedirect("join.jsp");
		}


	}

}
