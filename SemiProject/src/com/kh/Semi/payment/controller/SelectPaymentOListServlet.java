package com.kh.Semi.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.payment.model.service.PaymentService;
import com.kh.Semi.payment.model.vo.Payment;

/**
 * Servlet implementation class SelectPaymentOListServlet
 */
@WebServlet(name = "payment.po", urlPatterns = { "/payment.po" })
public class SelectPaymentOListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPaymentOListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("스블릿도착");
		/*request.getParameter("userNo");*/
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		System.out.println(userNo);
		ArrayList<Payment> list = new PaymentService().selectOList(userNo);
		
		request.setAttribute("list", list);
		System.out.println("상시 서블릿:" + list);
		String page = "";
		
		if(list != null)
		{
			request.setAttribute("list", list);
			page="views/payment/paymentOtview.jsp";
			
		}else
		{
			   page="views/exception/erroPage.jsp";
	           request.setAttribute("msg", "조회실패");
	        
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
