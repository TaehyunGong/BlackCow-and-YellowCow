package com.kh.Semi.facing.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.facing.model.service.FacingService;
import com.kh.Semi.facing.model.vo.Facing;

/**
 * Servlet implementation class SelectOneFacing
 */
@WebServlet("/selectOne.fa")
public class SelectOneFacing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneFacing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));
		
		Facing f = new FacingService().selectOne(num);
		
		String page = null;
		
		System.out.println("한개보는 서블릿 : " + f);
		if(f != null){
			page = "views/mail/mailBox.jsp";
			request.setAttribute("f", f);
		}else{
			page = "views/exception/errorPage.jsp";
			request.setAttribute("msg", "조회에 실패하셨습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
