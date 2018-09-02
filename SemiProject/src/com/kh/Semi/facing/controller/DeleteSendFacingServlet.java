package com.kh.Semi.facing.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.facing.model.service.FacingService;

/**
 * Servlet implementation class DeleteSendFacingServlet
 */
@WebServlet("/deleteSendFacing.fa")
public class DeleteSendFacingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSendFacingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		int result = new FacingService().deleteSendFacing(num);
		
		if(result > 0){
			request.getRequestDispatcher("/selectSendList.fa").forward(request, response);
		}else{
			request.setAttribute("msg", "삭제 실패 !");
			request.getRequestDispatcher("views/exception/errorPage.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
