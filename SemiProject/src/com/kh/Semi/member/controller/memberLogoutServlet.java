package com.kh.Semi.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout.mem")
public class memberLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public memberLogoutServlet() {
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getSession().invalidate();
		req.setAttribute("bool", "logout");
		String page = "MainFunding";//url; 			//임시용 인덱스
		res.sendRedirect(page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
