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
 * Servlet implementation class EditInformation
 */
@WebServlet("/editInfo.mem")
public class EditInformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditInformationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String userNick = request.getParameter("userNick");
		String userAddress = request.getParameter("userAddress");
		String userEmail = request.getParameter("userEmail");
//		String memberPwd = m.getMember_Pwd();
		int memberNo = m.getMember_No();
		
//		System.out.println("이름 : " + userName);
//		System.out.println("비번 : " + userPwd);
//		System.out.println("닉넴 : " + userNick);
//		System.out.println("주소 : " + userAddress);
//		System.out.println("이멜 : " + userEmail);
//		System.out.println("DB비번 : " + memberPwd);
		
		if(userPwd.equals("z4PhNX7vuL3xVChQ1m2AB9Yg5AULVxXcg/SpIdNs6c5H0NE8XYXysP+DGNKHfuwvY7kxvUdBeoGlODJ6+SfaPg==")){
			userPwd = m.getMember_Pwd();
		}
		
//		System.out.println("공백일때 유저 비번 : " + userPwd);
		m.setMember_No(memberNo);
		m.setMember_Name(userName);
		m.setMember_Pwd(userPwd);
		m.setMember_Nick(userNick);
		m.setAddress(userAddress);
		m.setEmail(userEmail);
		
		int result = new MemberService().userInfoUpdate(m);
		
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
