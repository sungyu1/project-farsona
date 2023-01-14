package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.UserDAO;
import com.smhrd.model.Want;
import com.smhrd.model.WantDAO;

public class wantDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String want_id = request.getParameter("want_id");
		System.out.println(want_id);
		
		// DAO -> deleteMember() 메소드 사용 _ 매개변수, 반환타입 고려
		WantDAO dao = new WantDAO();
		int cnt = dao.deleteWant(want_id);
		System.out.println("cnt" + cnt);
		
		if(cnt>0) { // 삭제 성공
			System.out.println("삭제 성공😊😊");
			response.sendRedirect("faceInfoList.jsp");
		}else { // 삭제 실패
			System.out.println("삭제 실패😥😥");
			response.sendRedirect("faceUpdate.jsp");
		
		}
	}

}