package com.kh.Semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.Semi.board.model.service.BoardService;
import com.kh.Semi.board.model.vo.Board;
import com.kh.Semi.dips.model.service.DibsService;
import com.kh.Semi.dips.model.vo.Dibs;
import com.kh.Semi.funding.model.vo.ProductList;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class SelectFundStoryServlet
 */
@WebServlet("/selectFundStory.bo")
public class SelectFundStoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectFundStoryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("product_page"));
		int progress = Integer.parseInt(request.getParameter("progress"));
		// System.out.println("Story num값 : " + num);

		ArrayList<Board> story = new BoardService().selectFundStory(num);
		
		HashMap<String, Object> intro = new BoardService().selectProduct(num);
		
		
		int remain = 0;

		if (intro.get("pro_count") != null || intro.get("pro_qty") != null) {
			int count = (int) intro.get("pro_count");
			int qty = (int) intro.get("pro_qty");

			remain = count - qty;
		}
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		if(member != null){
			ArrayList<Dibs> dibs = new DibsService().selectDibsList(member.getMember_No());
			request.setAttribute("dibs", dibs);
		}
		
		ProductList productStatus = new BoardService().selectProgressStatus(num);
		
		if(productStatus != null){
			request.setAttribute("productStatus", productStatus);
		}

		String page = "";

		if (story != null) {

			page = "views/funding/story.jsp";
			request.setAttribute("story", story);
			request.setAttribute("pnum", num);
			request.setAttribute("intro", intro);
			request.setAttribute("remain", remain);
			request.setAttribute("progress", progress);
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
