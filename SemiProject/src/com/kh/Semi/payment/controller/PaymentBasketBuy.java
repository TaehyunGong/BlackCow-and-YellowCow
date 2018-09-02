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

/**
 * Servlet implementation class PaymentBasketBuy
 */
@WebServlet("/paymentBasketBuy")
public class PaymentBasketBuy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentBasketBuy() {
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
		
		String[] basketList = req.getParameterValues("chkBox");		//장바구니에서 카트넘버 넘겨 받았을때
		ArrayList<Basket> list = new PaymentService().selectBascketBuy(basketList);			//장바구니 리스트 가져오기
		
		String[] addressList = new PaymentService().selectAddress(user.getMember_No()); 	// 0 = 멤버주소 , 1 = ADD1 주소 , 2 = ADD2 주소
		
		req.setAttribute("addressList", addressList);
		req.setAttribute("basketList", list);
		
		RequestDispatcher views = req.getRequestDispatcher("/views/payment/paymentBasket.jsp");
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
