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
 * Servlet implementation class ViewFiled
 */
@WebServlet("/ViewFiled")
public class ViewFiled extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewFiled() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
		String price = req.getParameter("price");
		String path = this.getServletContext().getRealPath("/farmArea/");
		
		String[][] arr = new cellClass().viewField(name, path);
		int farmSize = new cellClass().viewFieldFarmSize(name, path);
		
		for(String[] str : arr){
			for(String s : str)
				System.out.print(s);
			System.out.println();
		}
		
		String page = "/views/common/fieldView.jsp";
		req.setAttribute("price", price);
		req.setAttribute("farmSize", farmSize);
		req.setAttribute("field", arr);
		RequestDispatcher view = req.getRequestDispatcher(page);
		view.forward(req, res);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
