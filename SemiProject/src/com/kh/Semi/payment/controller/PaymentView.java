package com.kh.Semi.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.Semi.funding.model.service.cellClass;
import com.kh.Semi.member.model.vo.Member;
import com.kh.Semi.payment.model.service.PaymentService;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/paymentView")
public class PaymentView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String imp = req.getParameter("imp");
		String baks = req.getParameter("bak");
		int pro_detail_no = Integer.parseInt(req.getParameter("pro_detail_no"));
		int amount = Integer.parseInt(req.getParameter("amount"));
		int user_no = Integer.parseInt(req.getParameter("user_No"));
		String address = req.getParameter("addr");
		
		String[] imps =imp.split(",");
		String[] bak = baks.split(" ");
		
		HttpSession session = req.getSession();
		Member user = (Member)session.getAttribute("loginUser");
		
		String path = this.getServletContext().getRealPath("/farmArea/");
		
		//셀 값 삽입
		int result = 0;
		String sellerId = new PaymentService().selectSellerName(pro_detail_no);	//판매자 닉네임 가져옴
		
		String page = "";

		result = new PaymentService().insertPayment(pro_detail_no, amount, user_no, imps, address);	//payNo의 값을 가져온다.
		result = new cellClass().insertCell(bak, user.getMember_Nick(),sellerId , path, result);	//셀 값 삽입
		
		if(result == 0){
			page = "views/payment/paymentFalse.jsp";		//결제 실패
		}else{
			page = "views/payment/paymentResult.jsp";		//결제 성공
		}
		
		res.sendRedirect(page);
	}

	/*IamportClient ic = new IamportClient();
		try {
			System.out.println(ic.paymentByImpUid(imp).getResponse().getBuyerName());	//조회
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
