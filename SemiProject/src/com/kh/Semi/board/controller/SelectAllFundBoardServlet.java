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

import com.kh.Semi.basket.model.service.BasketService;
import com.kh.Semi.basket.model.vo.Basket;
import com.kh.Semi.board.model.service.BoardService;
import com.kh.Semi.board.model.vo.Board;
import com.kh.Semi.dips.model.service.DibsService;
import com.kh.Semi.dips.model.vo.Dibs;
import com.kh.Semi.funding.model.vo.ProductList;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class SelectAllFundBoardServlet
 */
@WebServlet("/selectFd.bo")
public class SelectAllFundBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllFundBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		

		int pnum = Integer.parseInt(request.getParameter("pnum"));
		String type = request.getParameter("type");
		String board = request.getParameter("board");
		int progress = Integer.parseInt(request.getParameter("progress"));
		
		
		/*System.out.println(type);
		System.out.println(board);*/
		
		
		
		
		
		
		ArrayList<Board> list = new BoardService().selectFdBoard(pnum,type,board);
		
		HashMap<String, Object> intro = new BoardService().selectProduct(pnum);
		
		
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
		
	
		
		ProductList productStatus = new BoardService().selectProgressStatus(pnum);
		
		if(productStatus != null){
			request.setAttribute("productStatus", productStatus);
		}
		
		
		// 차트 불러오기
		
		ArrayList<HashMap<String, Object>> popRank = new BoardService().selectProductpopRank();
		
		if(popRank != null){
			
			request.setAttribute("popRank", popRank);
		}
		
		ArrayList<HashMap<String, Object>> newFundlist = new BoardService().selectNewProductList();
		
		if(newFundlist != null){
			
			request.setAttribute("newFundlist", newFundlist);
		}
		
		
		ArrayList<HashMap<String, Object>> deadlineFundlist = new BoardService().selectDeadlineProductList();
		
		if(deadlineFundlist != null){
			request.setAttribute("deadlineFundlist", deadlineFundlist);
		}
		
		String page = "";
		
		
		if(list != null){
		
			switch(board){
			
			case "R3" : page = "views/funding/cheerup.jsp"; break;
			case "R4" : page = "views/funding/reply.jsp"; break;
			case "R5" : page = "views/funding/qna.jsp"; break;
			}
			
			
			request.setAttribute("list", list);
			
			request.setAttribute("pnum", pnum);
			
			request.setAttribute("intro", intro);
			
			request.setAttribute("remain", remain);
			
			request.setAttribute("progress", progress);
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
