package com.kh.Semi.basket.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.Semi.basket.model.service.BasketService;
import com.kh.Semi.basket.model.vo.Basket;

/**
 * Servlet implementation class InsertProductBasketServlet
 */
@WebServlet("/insertBasket.bk")
public class InsertProductBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductBasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		Basket bk = new Basket();
		
		bk.setMember_no(user_no);
		bk.setPro_detail_no(num);
		bk.setProduct_count(amount);
		
		int result = new BasketService().insertPdBasket(bk);
		
		
		new Gson().toJson(result, response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
