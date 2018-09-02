package com.kh.Semi.facing.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.facing.model.service.FacingService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class WriteInfoServlet
 */
@WebServlet("/writeInfo.fa")
public class WriteInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Member> list = new FacingService().selectAllMemberList();
		
		String page = "";
		
		if(list != null && list.size() > 0){
			page = "views/mail/mailWrite.jsp";
			request.setAttribute("list", list);
		}else{
			page = "views/exception/errorPage.jsp";
			request.setAttribute("msg", "쪽지도 못보내나요");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
