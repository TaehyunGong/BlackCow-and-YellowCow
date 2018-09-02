package com.kh.Semi.payment.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.kh.Semi.basket.model.vo.Basket;
import com.kh.Semi.member.model.vo.Member;
import com.kh.Semi.payment.model.service.PaymentService;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/PaymentViewBasket")
public class PaymentViewBasket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentViewBasket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String imp = req.getParameter("imp");
		String basketList = req.getParameter("basketList");
		String addr = req.getParameter("address");
		Type type = new TypeToken<ArrayList<Basket>>(){}.getType();
		ArrayList<Basket> list = new Gson().fromJson(basketList, type);
		
		HttpSession session = req.getSession();
		Member user = (Member)session.getAttribute("loginUser");
		String[] imps =imp.split(",");
		int result = 0;
		
		result = new PaymentService().insertBasketPayment(list, addr, imps, user.getMember_No());
		
		String page = "";
		if(result > 0){
			if(result == 0){
				page = "views/payment/paymentFalse.jsp";		//결제 실패
			}else{
				page = "views/payment/paymentResult.jsp";		//결제 성공
			}
		}else{
			page = "views/payment/paymentFalse.jsp";
		}
		
		res.sendRedirect(page);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
