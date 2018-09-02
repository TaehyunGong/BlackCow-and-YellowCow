package com.kh.Semi.funding.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.Semi.funding.model.service.FundingService;

/**
 * Servlet implementation class FundingQTYCheckServlet
 */
@WebServlet("/qtyCheck")
public class FundingQTYCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FundingQTYCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int proDetailNo = Integer.parseInt(request.getParameter("pro_detail_no"));
		
		int result = new FundingService().qtyCheck(memberNo, proDetailNo);
		System.out.println("qty체크");
		
		JSONObject data = new JSONObject();
		
		data.put("result", result);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(data.toJSONString());
		
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
