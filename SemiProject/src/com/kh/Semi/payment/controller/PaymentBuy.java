package com.kh.Semi.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.Semi.basket.model.vo.Basket;
import com.kh.Semi.member.model.vo.Member;
import com.kh.Semi.payment.model.service.PaymentService;
import com.kh.Semi.payment.model.vo.PaymentProduct;

/**
 * Servlet implementation class PaymentBuy
 */
@WebServlet("/PaymentBuy")
public class PaymentBuy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentBuy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Member user = (Member)session.getAttribute("loginUser");
		if(user == null){
			String htmlResponse = "<html>";
			htmlResponse += "<script>";
			htmlResponse += "alert('로그인을 하여주시게 바랍니다.');";
			htmlResponse += "location.href='"+req.getContextPath()+"/MainFunding';</script>";
			htmlResponse += "</html>";
			PrintWriter out = res.getWriter();
			out.println(htmlResponse);
		}
		
		String amount = (String)req.getParameter("amount");					//수량
		String pro_detail_no = (String)req.getParameter("pro_detail_no");	//해당 상품번호
		String fundList =(String)req.getParameter("fundList");				
		String farmSize =(String)req.getParameter("farmSize");
		
		PaymentProduct pd = new PaymentService().selectPaymentProduct(Integer.parseInt(pro_detail_no));
		
		
		
		String[] addressList = new PaymentService().selectAddress(user.getMember_No()); 	// 0 = 멤버주소 , 1 = ADD1 주소 , 2 = ADD2 주소
		
		req.setAttribute("fundList", fundList);
		req.setAttribute("amount", amount);
		req.setAttribute("pro_detail_no", pro_detail_no);
		req.setAttribute("farmSize", farmSize);
		req.setAttribute("product_payList", pd);
		req.setAttribute("addressList", addressList);
		
		RequestDispatcher views = req.getRequestDispatcher("/views/payment/payment.jsp");
		views.forward(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
