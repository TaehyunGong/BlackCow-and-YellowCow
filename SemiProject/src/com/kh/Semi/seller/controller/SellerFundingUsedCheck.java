package com.kh.Semi.seller.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.Semi.funding.model.service.FundingService;

/**
 * Servlet implementation class SellerFundingUsedCheck
 */
@WebServlet("/SellerFundingUsedCheck")
public class SellerFundingUsedCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerFundingUsedCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int no = Integer.parseInt(req.getParameter("num"));
		
		
		int result = new FundingService().sellerFundingUsedCheck(no);
		
		if(result > 0){
			result = 1;
		}else{
			result = 0;
		}
		
		new Gson().toJson(result, res.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
