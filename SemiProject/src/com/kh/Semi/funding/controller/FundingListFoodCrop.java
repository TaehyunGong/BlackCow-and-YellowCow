package com.kh.Semi.funding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.funding.model.service.FundingService;
import com.kh.Semi.funding.model.vo.ProductList;

/**
 * Servlet implementation class FundingListFoodCrop
 */
@WebServlet("/fundingListFoodCrop")
public class FundingListFoodCrop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FundingListFoodCrop() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ArrayList<ProductList> list = new FundingService().selectFundingListChoice("식량작물"); 
		req.setAttribute("list", list);
		
		String page = "views/funding/fundingList_FoodCrop.jsp";
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
