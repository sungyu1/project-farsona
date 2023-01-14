package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;


public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 1. 사용자가 입력한 id, pw 받기
		request.setCharacterEncoding("UTF-8");
		
		// 2. Member 객체 생성(id, pw)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Member vo = new Member(id, pw);
		
		// 3. MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// 4. dao.selectMember() 메서드 호출
		Member loginMember = dao.selectMember(vo);

		
		if(loginMember != null) { // 로그인 성공
			System.out.println("로그인 성공~~~~~~");
			
			// 5. 세션 저장
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
			response.sendRedirect("main.jsp");
			
		}else { // 로그인 실패
			System.out.println("😡😡😡😡로그인 실패😡😡😡😡");
			response.sendRedirect("login.jsp");
			
		}
		
		
	}

}
