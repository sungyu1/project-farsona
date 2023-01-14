package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 가입용으로 다시만들기

		// 사원번호 조회
		request.setCharacterEncoding("UTF-8");

		String police_id = request.getParameter("police_id");
		String admin_pw = request.getParameter("admin_pw");
		String admin_phone = request.getParameter("admin_phone");

		Member vo = new Member(police_id, admin_pw, admin_phone);

		MemberDAO dao = new MemberDAO();

		int cnt = dao.insertMember(vo);

		// 이미 가입된 사람인지 체크
		boolean checkID = dao.idCheck(police_id);
		
		if (cnt > 0 || checkID == true) {
			System.out.println("회원가입 성공");

			// HttpSession session = request.getSession();
			// session.setAttribute("joinMember", joinMember);
			// response.sendRedirect("login.jsp");

			// 포워딩(forwarding) 방식
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			// request객체에 공유할 값을 저장
			// request.setAttribute(네임, 값);
			request.setAttribute("result", "success");
			// 넘겨줄 값
			rd.forward(request, response);
		} else {
			System.out.println("회원가입 실패");
			RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
			request.setAttribute("result", "fail");
			rd.forward(request, response);

			// response.sendRedirect("login.jsp");
		}

	}

}
