package com.kh.Semi.seller.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.Semi.facing.model.vo.Facing;
import com.kh.Semi.funding.model.service.FundingService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class CompareMonthServlet
 */
@WebServlet("/compareMonth")
public class CompareMonthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompareMonthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int memberNo = m.getMember_No();
		
		ArrayList<HashMap<String, Object>> list = new FundingService().getCompareMonth(memberNo);
		
		JSONArray data = new JSONArray();
        JSONObject dataMap = null;
        
        for(HashMap<String, Object> h : list){
           dataMap = new JSONObject();
           
           dataMap.put("jan", h.get("jan"));
           dataMap.put("feb", h.get("feb"));
           dataMap.put("mar", h.get("mar"));
           dataMap.put("apr", h.get("apr"));
           dataMap.put("may", h.get("may"));
           dataMap.put("jun", h.get("jun"));
           dataMap.put("jul", h.get("jul"));
           dataMap.put("aug", h.get("aug"));
           dataMap.put("sep", h.get("sep"));
           dataMap.put("oct", h.get("oct"));
           dataMap.put("nov", h.get("nov"));
           dataMap.put("dec", h.get("dec"));
           data.add(dataMap);
        }
		
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
