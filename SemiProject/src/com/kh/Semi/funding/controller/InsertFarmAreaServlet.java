package com.kh.Semi.funding.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.funding.model.service.cellClass;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/InsertFarmArea")
public class InsertFarmAreaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFarmAreaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
		String[] arr = req.getParameterValues("bak");
		String farmSize = req.getParameter("farmSize");
		String farmQTY = req.getParameter("farmQTY");
		String path = this.getServletContext().getRealPath("/farmArea/");
		int result = 0;
		//셀 조회 15x15
//		String[][] num = new cellClass().test();
//		System.out.println(num[0][0]);
		
		//셀 값 삽입
		result = new cellClass().createTeble(arr, name, path, farmSize);
		
		String bool = "true";
		if(result != 0)
			bool = "true";
		else{
			bool = "false";
		}
		res.sendRedirect("views/common/InsertFarmAreaPopup.jsp?bool="+bool+"&attachNo="+result+"&farmQTY="+farmQTY);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
