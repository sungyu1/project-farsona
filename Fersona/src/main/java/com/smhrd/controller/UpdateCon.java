package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class UpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String police_id = loginMember.getPolice_id();
		
		String admin_pw = request.getParameter("admin_pw");
		String admin_phone = request.getParameter("admin_phone");
		
		Member updateMember = new Member(police_id, admin_pw, admin_phone);
		
		// 1. MemberDAO updateMember() 메서드 작성
		MemberDAO dao = new MemberDAO();

		// 2. updateMember -> 반환타입 int
		int cnt = dao.updateMember(updateMember);
		
		// 4-2. 수정한 값이 화면에 출력

		// 3. 수정이 되었으면 콘솔창에 "수정 성공", 수정이 안됐으면 "수정 실패" 출력
		if(cnt>0) { // 수정 성공
			System.out.println("수정 완");
			session.setAttribute("updateMember", updateMember);
			
			// 4-1. 수정 성공하면 main.jsp 이동
			response.sendRedirect("main.jsp");
			
			
		}else { // 수정 실패
			System.out.println("수정 ㄴㄴ");
			response.sendRedirect("update.jsp");
		}
	}

}
