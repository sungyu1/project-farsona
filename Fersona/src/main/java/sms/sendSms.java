package sms;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.Police;

public class sendSms extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String user_num = request.getParameter("user_num");

		Random random = new Random();
		String key = ""; // 인증키 생성

		String police_id = request.getParameter("police_id");
		Police vo = new Police(police_id);
		MemberDAO dao = new MemberDAO();
		Police loginMember = dao.checkMember(vo);

		for (int i = 0; i < 6; i++) {
			String num = Integer.toString(random.nextInt(10));
			key += num;
		}

		System.out.println("수신자 번호 : " + user_num);
		System.out.println("인증번호 : " + key);

		Examplesend examplesend = new Examplesend();
		examplesend.certifiedPhoneNumber(user_num, key);

		// RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
		//rd.forward(request, response);

		if (loginMember != null) {
			System.out.println("사원번호 조회 성공");
			request.setAttribute("user_num", user_num);
			request.setAttribute("key", key);
			RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
			request.setAttribute("loginMember", loginMember);
			rd.forward(request, response);
		} else {
			System.out.println("사원번호 조회 실패");
			RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
			rd.forward(request, response);

		}
	}

}