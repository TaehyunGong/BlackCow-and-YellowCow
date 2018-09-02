package com.kh.Semi.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.Semi.funding.model.service.FundingService;

/**
 * Servlet implementation class AdminYearTotalServlet
 */
@WebServlet("/adminYearTotal")
public class AdminYearTotalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminYearTotalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HashMap<String, Object> h = new FundingService().getAdminYearTotal();
		
		JSONObject data = new JSONObject();
		data.put("foyear", h.get("foyear"));
		data.put("thyear", h.get("thyear"));
		data.put("twyear", h.get("twyear"));
		data.put("onyear", h.get("onyear"));
		data.put("toyear", h.get("toyear"));
		
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
