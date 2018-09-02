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
 * Servlet implementation class AdminCategoryChartServlet
 */
@WebServlet("/adcategoryChart")
public class AdminCategoryChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCategoryChartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HashMap<String, Object> h = new FundingService().getAdminCategoryChart();
		
		JSONObject data = new JSONObject();
		data.put("fruit", h.get("fruit"));
		data.put("food", h.get("food"));
		data.put("spe", h.get("spe"));
		data.put("vege", h.get("vege"));
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
