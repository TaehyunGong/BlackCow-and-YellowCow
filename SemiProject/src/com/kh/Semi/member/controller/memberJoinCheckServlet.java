package com.kh.Semi.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.Semi.member.model.service.MemberService;

/**
 * Servlet implementation class memberJoinCheckServlet
 */
@WebServlet("/idCheck.mem")
public class memberJoinCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberJoinCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		int result = new MemberService().idCheck(userId);
		
		PrintWriter out =res.getWriter();
		
		String msg = "";
		
		if(result > 0){
			msg = "fail";
		}else{
			msg = "success";
		}
		
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(msg, res.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
