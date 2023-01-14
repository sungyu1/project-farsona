package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.Report;
import com.smhrd.model.ReportDAO;

public class reportProCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Report list = (Report) session.getAttribute("list");
		int num = (int)list.getNum();
		String rep_pro = request.getParameter("rep_pro");
		
		//System.out.println(num);
		//System.out.println(rep_pro);
		ReportDAO dao = new ReportDAO();

		Report updatePro = new Report(num, rep_pro);
		int cnt = dao.updatePro(updatePro);

		if (cnt > 0) {
			System.out.println("updatePro 성공");
			HttpSession session1 = request.getSession();
			session1.setAttribute("updatePro", updatePro);
			response.sendRedirect("reportContent.jsp");
		} else { // 로그인 실패
			System.out.println("updatePro 실패");
			response.sendRedirect("reportListPaging.jsp");
		}

	}

}
