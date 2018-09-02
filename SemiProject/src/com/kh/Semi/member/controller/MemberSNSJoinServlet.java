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
 * Servlet implementation class MemberSNSJoinServlet
 */
@WebServlet("/memberSNSJoin.mem")
public class MemberSNSJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSNSJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String nickname = req.getParameter("nick");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String id = req.getParameter("id");
		String refresh_token = req.getParameter("refresh_token");
		
		Member member = new Member();
		
		if(email == null){
			email = "noEmail";
		}
		if(name == null){
			name = "noName";
		}		
		member.setMember_Id(id);
		member.setMember_Pwd("123");
		member.setMember_Name(name);
		member.setEmail(email);
		member.setMember_Nick(nickname);
		member.setToken(refresh_token);
		
		int result = new MemberService().memberSNSJoin(member);		// 가입 호출
	
		
		String page = "/views/common/naverLoginCallback.jsp";
		if(result > 0){
			req.setAttribute("msg", "회원가입성공");
		}else{
			req.setAttribute("msg", "회원가입실패");
		}

		req.setAttribute("bool", true);
		req.setAttribute("suc", true);
		RequestDispatcher view = null;
		view = req.getRequestDispatcher(page);
		view.forward(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
