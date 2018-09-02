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
 * Servlet implementation class AdminMonthTotalServlet
 */
@WebServlet("/adminMonthTotal")
public class AdminMonthTotalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMonthTotalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HashMap<String, Object> h = new FundingService().getAdminMonthTotal();
		
		JSONObject data = new JSONObject();
		data.put("jan", h.get("jan"));
		data.put("feb", h.get("feb"));
		data.put("mar", h.get("mar"));
		data.put("apr", h.get("apr"));
		data.put("may", h.get("may"));
		data.put("jun", h.get("jun"));
		data.put("jul", h.get("jul"));
		data.put("aug", h.get("aug"));
		data.put("sept", h.get("sept"));
		data.put("oct", h.get("oct"));
		data.put("nov", h.get("nov"));
		data.put("dec", h.get("dec"));
		
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
