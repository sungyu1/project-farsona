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
import com.smhrd.model.Report;
import com.smhrd.model.ReportDAO;

public class reportPagingCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ReportDAO dao = new ReportDAO();
		
		List<Report> list = dao.selectAllReport();
		
		JsonObject json = new JsonObject();  // json 객체
		JsonArray jarray = new JsonArray();  // json array
		
		for(Report r:list) {
			json.addProperty("num", r.getNum());
			json.addProperty("rep_cate", r.getRep_cate());
			json.addProperty("rep_con", r.getRep_con());
			json.addProperty("rep_date", r.getRep_date());
			json.addProperty("rep_time", r.getRep_time());
			json.addProperty("mem_id", r.getMem_id());
			json.addProperty("rep_adr", r.getRep_adr());
			json.addProperty("mon_id", r.getMon_id());
			json.addProperty("want_id", r.getWant_id());
			json.addProperty("rep_pro", r.getRep_pro());
			json.addProperty("rep_wri", r.getRep_wri());
			json.addProperty("position", r.getPosition());
			
			jarray.add(json);
			json = new JsonObject();

		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(jarray);
		
		
		
	}

}
