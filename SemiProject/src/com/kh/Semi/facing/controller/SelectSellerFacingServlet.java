package com.kh.Semi.facing.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.Semi.facing.model.service.FacingService;
import com.kh.Semi.facing.model.vo.Facing;

/**
 * Servlet implementation class SelectFacingServlet
 */
@WebServlet("/selectFacing")
public class SelectSellerFacingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSellerFacingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int memberNo = Integer.parseInt(request.getParameter("member_no"));
		
        ArrayList<Facing> list = new FacingService().sellerSellectFacing(memberNo);
		int listSize = list.size();
//        new Gson().toJson(list, response.getWriter());
        
        JSONArray result = new JSONArray();
        JSONObject dataMap = null;
        
        for(Facing f : list){
           dataMap = new JSONObject();
           
           dataMap.put("facing_no", f.getFacing_No());
           dataMap.put("facing_title", URLEncoder.encode(f.getFacing_Title(),"UTF-8"));
           dataMap.put("facing_content", URLEncoder.encode(f.getFacing_Content(), "UTF-8"));
           dataMap.put("writer", URLEncoder.encode(f.getWriter(), "UTF-8"));
           dataMap.put("receiver", URLEncoder.encode(f.getReceiver(), "UTF-8"));
           dataMap.put("write_date", URLEncoder.encode(f.getWrite_Date().toString(), "UTF-8"));
           dataMap.put("listSize", listSize);
           result.add(dataMap);
        }
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
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
