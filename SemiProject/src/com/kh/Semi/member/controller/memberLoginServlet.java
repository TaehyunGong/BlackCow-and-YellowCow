package com.kh.Semi.member.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.regex.Pattern;

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
 * Servlet implementation class memberLoginServlet
 */
@WebServlet("/login.mem")
public class memberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		

		Member loginUser = new MemberService().memberLogin(userId, userPwd);
		
		String page = "";
		HttpSession session = req.getSession();
		if(loginUser != null){
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("msg", "로그인성공");
			req.setAttribute("bool", "loginComplete");
		}else{
			session.setAttribute("msg", "로그인실패");
			req.setAttribute("bool", "loginFalse");
		}
		
        /*String url = URLDecoder.decode(backURL, "UTF-8");
        int count = 0;
		for(int i=0; i<url.length(); i++){
			if(url.charAt(i) == '/' || url.charAt(i) == '\\'){
				count+=1;
				if(count == 4){
					url = url.substring(i);
					break;
				}
			}
		}
		System.out.println("url : " + url);*/
		page = "/MainFunding";//url; 			//임시용 인덱스
		RequestDispatcher view = req.getRequestDispatcher(page);
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
