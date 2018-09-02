package com.kh.Semi.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChoiceCell
 */
@WebServlet("/choiceCell")
public class ChoiceCell extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChoiceCell() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String[] arr = req.getParameterValues("bak");			//구매한 면적 배열
		String farmSize = req.getParameter("farmSize");
		
		String str = "";
		int amount = 0;
		PrintWriter out = res.getWriter();
		for(String s : arr){
			str += (s+" ");
			amount+=1;
		}
		
		String htmlResponse = "<html>";
		htmlResponse += "<script>";
		htmlResponse += "opener.document.getElementById('fundList').value ='"+str+"';";
		htmlResponse += "opener.document.getElementById('amount').value ='"+amount+"';";
		htmlResponse += "opener.document.getElementById('farmSize').value ='"+farmSize+"';";
		htmlResponse += "opener.parent.paymentPage();";
		htmlResponse += "window.close();</script>";
		htmlResponse += "</html>";

		out.println(htmlResponse);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
