package com.kh.Semi.funding.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.Semi.funding.model.service.FundingService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class RecordCheckServlet
 */
@WebServlet("/recordCheck")
public class RecordCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecordCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		int memberNo = m.getMember_No();
		int recordDate = new FundingService().recordCheck(memberNo);
		System.out.println(recordDate);
		
		JSONObject result = new JSONObject();
		
		if(recordDate > 30){
			result.put("recordCheck", URLEncoder.encode("true", "UTF-8"));
		}else{
			result.put("recordCheck", URLEncoder.encode("false", "UTF-8"));
		}
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(result.toJSONString());
		
		out.flush();
		out.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
