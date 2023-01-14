package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Report;
import com.smhrd.model.ReportDAO;

public class reportContentCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		ReportDAO dao = new ReportDAO();
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);

		Report list = dao.selectOne(num);
		System.out.println(list.getMem_id());
		System.out.println(list.getMon_id());
		System.out.println(list.getMon_img());

		if (list != null) {
			System.out.println("조회 성공");

			// 5. 세션 저장
			HttpSession session = request.getSession();
			session.setAttribute("list", list);
			response.sendRedirect("reportContent.jsp");

		} else { // 로그인 실패
			System.out.println("조회 실패");
			response.sendRedirect("reportListPaging.jsp");
		}

	}

}
