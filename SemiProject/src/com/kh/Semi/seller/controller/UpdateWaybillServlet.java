package com.kh.Semi.seller.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.Semi.member.model.vo.Member;
import com.kh.Semi.payment.model.service.PaymentService;

/**
 * Servlet implementation class UpdateWaybillServlet
 */
@WebServlet("/updateWaybill")
public class UpdateWaybillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWaybillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int memberNo = m.getMember_No();
		String deliNo = request.getParameter("deliNo");
		String waybill = request.getParameter("waybill");
		
		int result = new PaymentService().updateWaybill(deliNo, waybill, memberNo);
		
		JSONObject data = new JSONObject();
		
		data.put("result", result);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(data.toJSONString());
		
		out.flush();
		out.close();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
