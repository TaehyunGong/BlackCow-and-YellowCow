package com.kh.Semi.funding.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.funding.model.service.FundingService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/deleteApp")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int member_no = m.getMember_No();
		
		int proDetailNo = Integer.parseInt(request.getParameter("deleteApp"));
		
		int getProductNo = new FundingService().getProductNo(proDetailNo);
		
		int result = new FundingService().deleteProduct(getProductNo, member_no);
		
		String page = "";
		if(result > 0){
			page = "views/seller/sellerMain.jsp";
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
