package com.kh.Semi.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.Semi.board.model.service.BoardService;
import com.kh.Semi.facing.model.service.FacingService;
import com.kh.Semi.facing.model.vo.Facing;
import com.kh.Semi.payment.model.service.PaymentService;
import com.kh.Semi.payment.model.vo.Payment;

/**
 * Servlet implementation class ReturnPaymentServlet
 */
@WebServlet("/returnMoney.py")
public class ReturnPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*String writer1 = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMember_No());
		int writer = Integer.parseInt(writer1);*/
		
		
		String reason = request.getParameter("reason");
		int writer = Integer.parseInt(request.getParameter("writer"));
		
		
		System.out.println("체크시스템");
		
		
		System.out.println("신청자 : " + writer);
		System.out.println("사유 : " + reason);
		
		//판매자에게 메세지 보내기
		String title = "환불요청";
		
		int sellerNo = Integer.parseInt(request.getParameter("seller_No"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		 
		
		System.out.println("닉네임"+userNo);
		System.out.println("판매자 번호"+sellerNo);
		
		Facing f = new Facing();
		f.setWriter(String.valueOf(userNo));
		f.setFacing_Title(title);
		f.setFacing_Content(reason);
		int fcResult = new FacingService().sendFacing(f, sellerNo);
		
		/*ArrayList<Payment> list = new PaymentService().returnReason(writer, reason);*/
		
		int result = new PaymentService().returnReason(writer, reason);
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
