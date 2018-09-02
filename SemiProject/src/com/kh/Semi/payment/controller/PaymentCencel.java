package com.kh.Semi.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.Semi.member.model.vo.Member;
import com.kh.Semi.payment.model.service.IamportClient;
import com.kh.Semi.payment.model.service.PaymentService;
import com.kh.Semi.payment.model.vo.CancelData;
import com.kh.Semi.payment.model.vo.Refund;

/**
 * Servlet implementation class PaymentCencel
 */
@WebServlet("/paymentCencel")
public class PaymentCencel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentCencel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

    // -- 환불 서블릿 -- 
    // 필요한 값 : 판매자 아이디, 환불할 상품number, payNo , 환불할 유저의닉네임, 환불할 금액
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Member seller = (Member)session.getAttribute("loginUser");
		if(seller == null){
			String htmlResponse = "<html>";
			htmlResponse += "<script>";
			htmlResponse += "alert('로그인을 하여주시게 바랍니다.');";
			htmlResponse += "location.href='"+req.getContextPath()+"/MainFunding';</script>";
			htmlResponse += "</html>";
			PrintWriter out = res.getWriter();
			out.println(htmlResponse);
		}
		
		String imp = req.getParameter("imp");			//결제번호
		String productType = req.getParameter("pro_type");	// 펀딩 아님 먹거리
		String payNo = req.getParameter("pay_no");		//해당 구매 번호
		String user_nick = req.getParameter("member_nick");	//환불할 유저의 닉네임
		String pay_detail_no = req.getParameter("pay_detail_no");	//환불할 유저의 닉네임
		
		System.out.println("req.getParameter('pay_price') : " + req.getParameter("pay_price"));
		
		
		if(productType.equals("상시 먹거리 상품"))
			productType = "N";
		else
			productType= "F";
		
		Refund rf = new Refund();
		rf.setImp(imp);
		rf.setProductType(productType);
		rf.setUser_nick(user_nick);
		rf.setSeller_Id(seller.getMember_Id());
		rf.setPayNo(Integer.parseInt(payNo));
		rf.setPayment_Record_seq(Integer.parseInt(pay_detail_no));
		
		int amount = 0;
		CancelData cd = null;
		if(req.getParameter("pay_price") != null){		//amount 에 값이 들어온다면 부분 환불
			
			cd = new CancelData(imp,true, new BigDecimal(req.getParameter("pay_price")));
			amount = Integer.parseInt(req.getParameter("pay_price"));
			rf.setAmount(amount);
			System.out.println("amonut : " + rf.getAmount());
			
		}else{										// 값이 안들어온다면 전액 환불이다.
			cd = new CancelData(imp,true);
		}
		
		//----------------------------------------------// DB에 저장
		
		/*
		 *	 var imp = $(this).parent().parent().children('.accept_no').text();
	         var pro_type = $(this).parent().parent().children('.pro_type').text();
	         var pay_no = $(this).parent().parent().children('.pay_no').val();
	         var pay_detail_no = $(this).parent().parent().children('.pay_detail_no').val();
	         var member_nick = $(this).parent().parent().children('.member_nick').text();
	         var pay_price = $(this).parent().parent().children('.pay_price').text();
		 */
		
		
		// 환불시 사용할 클래스 
		
		String path = this.getServletContext().getRealPath("/farmArea/");
		int result = new PaymentService().updateRefundRecord(rf, path);		//환불 성공시 payment_RECORD 값 refund로 수정
		
		if(result > 0){
			IamportClient ic = new IamportClient();
			try {
				ic.cancelPayment(cd);					//환불 성공
				System.out.println("환불 성공");
			} catch (Exception e) {e.printStackTrace();}
		}else{
			System.out.println("환불 실패");
		}

		new Gson().toJson(result, res.getWriter());
	}
	
	
	//	System.out.println(ic.paymentByImpUid(imp).getResponse().getBuyerName());	//조회
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
