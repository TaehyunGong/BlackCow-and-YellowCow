package com.kh.Semi.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.Semi.member.model.service.MemberService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class KakaoLogin
 */
@WebServlet("/KakaoLogin")
public class KakaoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String user_id = req.getParameter("user_id");
		String email = req.getParameter("email");
		
		Member loginUser = new MemberService().memberSNSLogin(user_id);
		
	    HttpSession session = req.getSession();
		if(loginUser != null){
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("msg", "로그인성공");
			req.setAttribute("bool", true);
		}else{
			session.setAttribute("msg", "로그인실패");
			req.setAttribute("bool", false);
		}
		
		req.setAttribute("email", email);
		req.setAttribute("id", user_id);
		
		String page = "/views/common/naverLoginCallback.jsp";
		RequestDispatcher view = req.getRequestDispatcher(page);
		view.forward(req, res);		//보내준다.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
