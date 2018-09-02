package com.kh.Semi.facing.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.facing.model.service.FacingService;
import com.kh.Semi.facing.model.vo.Facing;

/**
 * Servlet implementation class SendReFacingInfoServlet
 */
@WebServlet("/reMailFacing.fa")
public class SendReFacingInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendReFacingInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		Facing f = new FacingService().updateInfoFacing(num);
		
		if(f != null){
			request.setAttribute("f", f);
			request.getRequestDispatcher("views/mail/reMailWrite.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "답장페이지 진입 실패");
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
