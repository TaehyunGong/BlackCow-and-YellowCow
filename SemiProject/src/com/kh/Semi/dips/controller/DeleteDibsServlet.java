package com.kh.Semi.dips.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.Semi.dips.model.service.DibsService;
import com.kh.Semi.dips.model.vo.Dibs;

/**
 * Servlet implementation class DeleteDibsServlet
 */
@WebServlet("/deleteDibs")
public class DeleteDibsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDibsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String num = req.getParameter("num");
		String user_no = req.getParameter("user_no");
		
		Dibs dib = new Dibs();
		dib.setMember_no(Integer.parseInt(user_no));
		dib.setPro_detail_no(Integer.parseInt(num));

		int result = new DibsService().deleteDibs(dib);
		
		new Gson().toJson(result, res.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
