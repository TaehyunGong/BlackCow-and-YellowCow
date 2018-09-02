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
 * Servlet implementation class PasswordCheck
 */
@WebServlet("/passCheck.mem")
public class PasswordCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		int memberNo = m.getMember_No();
		String userPwd = request.getParameter("userPwd");
		System.out.println("테스트1");
		String userPwd2 = new MemberService().passCheck(memberNo, userPwd);
		
		JSONObject result = new JSONObject();
		System.out.println("패스1"+userPwd);
		System.out.println("패스2"+userPwd2);
		
		if(userPwd.equals(userPwd2)){
			result.put("passCheck", URLEncoder.encode("true", "UTF-8"));
		}else{
			result.put("passCheck", URLEncoder.encode("false", "UTF-8"));
		}
		System.out.println("테스트2");
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
