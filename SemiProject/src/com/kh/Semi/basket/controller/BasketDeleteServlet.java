package com.kh.Semi.basket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.Semi.basket.model.service.BasketService;
import com.kh.Semi.basket.model.vo.Basket;

/**
 * Servlet implementation class BasketDeleteServlet
 */
@WebServlet("/basketDelete.bd")
public class BasketDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BasketDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("바스켓딜리트 서블릿 도착");
		
		int cart = Integer.parseInt(request.getParameter("cartNo"));
	   
		int userNo = Integer.parseInt(request.getParameter("userNo"));
	        
	    System.out.println("카트번호" + cart);
	    System.out.println("유저 번호" + userNo);
	     
		ArrayList<Basket> list = new BasketService().basketDelete(cart ,userNo);
		
		System.out.println("돌아온 서블릿:" + list);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
