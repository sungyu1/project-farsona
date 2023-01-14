package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.smhrd.model.User;
import com.smhrd.model.UserDAO;


public class userPagingCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		UserDAO dao = new UserDAO();
		
		List<User> list = dao.selectAllListPage(num);
		
		JsonObject json = new JsonObject();  // json 객체
		JsonArray jarray = new JsonArray();  // json array
		
		for(User u:list) {
			json.addProperty("num", u.getNum());
			json.addProperty("mem_id", u.getMem_id());
			json.addProperty("mem_name", u.getMem_name());
			json.addProperty("mem_tel", u.getMem_tel());
			json.addProperty("mem_join", u.getMem_join());
			json.addProperty("mem_adr1", u.getMem_adr1());
			
			jarray.add(json);
			json = new JsonObject();

		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(jarray);
		
		
	}

}
