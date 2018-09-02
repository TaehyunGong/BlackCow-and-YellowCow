package com.kh.Semi.funding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.Semi.funding.model.service.FundingService;
import com.kh.Semi.funding.model.vo.ProductList;

/**
 * Servlet implementation class SelectFundFourServlet
 */
@WebServlet("/selectFoodFourOne")
public class SelectFoodFourOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFoodFourOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String num = req.getParameter("num");
		String catagory = req.getParameter("catagory");
		
		
		ArrayList<ProductList> list = new FundingService().selectFoodFourListOne(Integer.parseInt(num), catagory); 
		
		//리스트가 빈값이면 널 반환
		if(list.size() == 0)
			list = null;
		
		new Gson().toJson(list, res.getWriter());
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
