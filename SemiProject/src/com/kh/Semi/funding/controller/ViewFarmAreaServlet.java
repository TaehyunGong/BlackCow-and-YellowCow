package com.kh.Semi.funding.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.funding.model.service.cellClass;

/**
 * Servlet implementation class ViewFarmAreaServlet
 */
@WebServlet("/viewFarm")
public class ViewFarmAreaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewFarmAreaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("member_id");
		String path = this.getServletContext().getRealPath("/farmArea/");
		String[][] arr = new cellClass().viewField(memberId, path);
		int farmSize = new cellClass().viewFieldFarmSize(memberId, path);
		
		
		String page = "/views/common/adminFarmView.jsp";
		request.setAttribute("farmSize", farmSize);
		request.setAttribute("field", arr);
		request.getRequestDispatcher(page).forward(request, response);;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
