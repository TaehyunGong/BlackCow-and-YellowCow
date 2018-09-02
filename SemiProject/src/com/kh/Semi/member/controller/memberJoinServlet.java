package com.kh.Semi.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.member.model.service.MemberService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class memberJoinServlet
 */
@WebServlet("/join.mem")
public class memberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		System.out.println("비번 : " + req.getParameter("userPwd"));
		String userName = req.getParameter("userName");
		String userNick = req.getParameter("userNick");
		String email = req.getParameter("email");
		Member member = new Member(); 
		
		member.setMember_Id(userId);
		member.setMember_Pwd(userPwd);
		member.setMember_Name(userName);
		member.setEmail(email);
		member.setMember_Nick(userNick);
		
		int result = new MemberService().memberJoin(member);		// 가입 호출
		
		
		String page = "index.jsp";
		if(result > 0){
		}else{
		}
		
		res.sendRedirect(page);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
