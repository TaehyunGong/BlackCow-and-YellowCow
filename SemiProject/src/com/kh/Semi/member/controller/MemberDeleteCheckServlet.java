package com.kh.Semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.Semi.member.model.service.MemberService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteCheckServlet
 */
@WebServlet("/deleteCheck.mem")
public class MemberDeleteCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		int userNo = m.getMember_No();
		String userPwd = request.getParameter("userPwd");
		String userPwd1 = request.getParameter("userPwd2");
		String userPwd2 = "";
		
		
		userPwd2 = new MemberService().deleteCheckMember(userNo, userPwd);
		
		System.out.println("탈퇴시 입력한 비밀번호 : " + userPwd);
		System.out.println("디비에 입력된 비밀번호  : " + userPwd2);
		
		int result = 0;
		
		if(userPwd.equals(userPwd2)){
			result = 1;
		}else{
			result = 2;
		}
		
		response.setContentType("application/json");
		new Gson().toJson(result, response.getWriter());
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
