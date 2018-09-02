package com.kh.Semi.basket.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.basket.model.service.BasketService;
import com.kh.Semi.basket.model.vo.Basket;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class BasketServlet
 */

@WebServlet(name = "basket.bo", urlPatterns = { "/basket.bo" })
public class SelectBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SelectBasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        System.out.println("서블릿도착");
        
        int userNo = Integer.parseInt(request.getParameter("userNo"));
        
        System.out.println(userNo);
        
        ArrayList<Basket> list = new BasketService().selectList(userNo);
        
        System.out.println("바스켓서비스 : " + list);
        
     
        String page = "";
        
        if(list != null)
        {
           page="views/basket/basketOtview.jsp";
           request.setAttribute("list", list);
        }else{
           page="views/exception/erroPage.jsp";
           request.setAttribute("msg", "조회실패");
        }
        
        RequestDispatcher view = request.getRequestDispatcher(page);
        view.forward(request, response);
     }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
