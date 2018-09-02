package com.kh.Semi.dips.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.dips.model.service.DibsService;
import com.kh.Semi.dips.model.vo.Dibs;

/**
 * Servlet implementation class SelectDibServlet
 */
@WebServlet("/selectDibs")
public class SelectDibsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDibsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("찜옴 ㅎㅎ");
	
	System.out.println("찜 서블릿 도착");
	
	int userNo = Integer.parseInt(request.getParameter("userNo"));
	ArrayList<Dibs> list = new DibsService().selectList(userNo);
	System.out.println("찜 리스트"+list);
	String page = "";
	
	if(list != null)
	{
		page="views/dip/dipPview.jsp";
		request.setAttribute("list", list);
		
	}else
	{	
		   page="views/exception/erroPage.jsp";
           request.setAttribute("msg", "조회실패");
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
