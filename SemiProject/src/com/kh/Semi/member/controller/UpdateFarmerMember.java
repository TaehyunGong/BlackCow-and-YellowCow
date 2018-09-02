package com.kh.Semi.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.member.model.service.MemberService;

/**
 * Servlet implementation class UpdateFarmerMember
 */
@WebServlet("/updateFarmerMember.me")
public class UpdateFarmerMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFarmerMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String size = request.getParameter("area");
		int mnum = Integer.parseInt(request.getParameter("mnum"));
		
		int result = new MemberService().updateFarmerMember(name, address, size, mnum);
		
		String page = "";
		
		if(result > 0){
			
			page = "views/doFarmer/doFarmer.jsp";
			request.setAttribute("msg", "농부되기 신청이 완료되었습니다. 확인 클릭 시 메인으로 이동합니다");
			
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
