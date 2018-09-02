package com.kh.Semi.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.Semi.member.model.service.MemberService;

/**
 * Servlet implementation class MemberFarmNameCheck
 */
@WebServlet("/farmNameCheck")
public class MemberFarmNameCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFarmNameCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String farmName = request.getParameter("name");
		
		
		int result = new MemberService().CheckFarmName(farmName);
			
		response.getWriter().print(result);
		
		//String msg = "";
		
		/*if(result > 0){
			
			msg = "존재하는 농가명입니다";
		}else{
			
			msg = "사용 가능한 농가명입니다";
		}*/
		
		/*response.setCharacterEncoding("UTF-8");
		response.getWriter().print(msg);*/
		
		/*JSONObject final1 = new JSONObject();
		
		final1.put("msg", URLEncoder.encode(msg,"UTF-8"));
		
		response.setContentType("application/json");
		
		PrintWriter out = response.getWriter();
		
		out.print(final1.toJSONString());
		
		out.flush();
		out.close();*/
		// 결과가 사용+가능한+농가명입니다
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
