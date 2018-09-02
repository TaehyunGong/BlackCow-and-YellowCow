package com.kh.Semi.funding.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.funding.model.service.FundingService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class AllFundingList
 */
@WebServlet("/allFunding")
public class AllFundingList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllFundingList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		int memberNo = m.getMember_No();
		ArrayList<HashMap<String, Object>> list = new FundingService().selectAllFunding(memberNo);
		String page = "";
		
		if(list != null){
			page = "views/seller/sellerFunding.jsp";
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
