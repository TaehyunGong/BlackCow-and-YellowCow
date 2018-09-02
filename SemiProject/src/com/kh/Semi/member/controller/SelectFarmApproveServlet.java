package com.kh.Semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.member.model.service.MemberService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class SelectFarmApproveServlet
 */
@WebServlet("/farmApprove")
public class SelectFarmApproveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFarmApproveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> list = new MemberService().farmerApprove();
		
		String page = "";
		
		if(list != null){
			page = "views/admin/farmerApprove.jsp";
			request.setAttribute("list", list);
		}else{
			page = "views/common/page_404.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
