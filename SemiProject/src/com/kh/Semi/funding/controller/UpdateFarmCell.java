package com.kh.Semi.funding.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.Semi.funding.model.service.cellClass;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class UpdateFarmCell
 */
@WebServlet("/updateFarmCell")
public class UpdateFarmCell extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFarmCell() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String usera = req.getParameter("user");					//구매자 아이디
		String seller = req.getParameter("seller");				//판매자 아이디
		String[] arr = req.getParameterValues("bak");			//구매한 면적 배열
		String path = this.getServletContext().getRealPath("/farmArea/");
		
		HttpSession session = req.getSession();
		Member user = (Member)session.getAttribute("loginUser");
		
		//셀 구매
		new cellClass().insertCell(arr, user.getMember_Nick(), seller, path);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
