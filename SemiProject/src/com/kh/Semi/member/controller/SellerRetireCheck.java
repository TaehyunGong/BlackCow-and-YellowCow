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
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class SellerRetireCheck
 */
@WebServlet("/sellerRetire.mem")
public class SellerRetireCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerRetireCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member m = (Member) request.getSession().getAttribute("loginUser");
		String userId = m.getMember_Id();
		int memberNo = m.getMember_No();
		String password = request.getParameter("password");
		
		
		int result = new MemberService().sellerRetire(memberNo, password);
		
		
		JSONObject data = new JSONObject();
		
		data.put("retireCheck", result);
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
