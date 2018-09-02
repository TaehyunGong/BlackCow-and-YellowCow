package com.kh.Semi.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.Semi.dips.model.service.DibsService;
import com.kh.Semi.dips.model.vo.Dibs;
import com.kh.Semi.facing.model.service.FacingService;
import com.kh.Semi.facing.model.vo.Facing;
import com.kh.Semi.member.model.vo.Member;
import com.kh.Semi.payment.model.service.PaymentService;
import com.kh.Semi.payment.model.vo.Payment;


@WebServlet(name = "payment.pf", urlPatterns = { "/payment.pf" })
//@WebServlet("/payment.po")
public class SelectPaymentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectPaymentListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("스블릿도착");
		/*request.getParameter("userNo");*/
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		System.out.println(userNo);
		ArrayList<Payment> list = new PaymentService().selectList(userNo);
		
		System.out.println(list);
		request.setAttribute("list", list);
		String page = "";
		
		if(list != null)
		{

			page="views/payment/paymentPview.jsp";
			request.setAttribute("list", list);
			
		}else
		{
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
