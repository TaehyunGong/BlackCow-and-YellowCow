package com.kh.Semi.funding.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.funding.model.service.FundingService;

/**
 * Servlet implementation class ModifyProduct
 */
@WebServlet("/modify")
public class ModifyProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int detailNo = Integer.parseInt(request.getParameter("modify"));
		
		HashMap<String, Object> hmap = new FundingService().modifyProduct(detailNo);
		
		String page = "";
		if(hmap != null){
			page = "views/seller/modifyApply.jsp";
			request.setAttribute("hmap", hmap);
		}else{
			page = "views/common/page_404.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
