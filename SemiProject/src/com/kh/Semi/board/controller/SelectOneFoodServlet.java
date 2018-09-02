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
import com.kh.Semi.funding.model.service.cellClass;
import com.kh.Semi.funding.model.vo.ProductList;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class SelectOneFoodServlet
 */
@WebServlet("/selectFood.bo")
public class SelectOneFoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneFoodServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("product_page"));
		
		//상세페이지 정보 및 메인사진
		HashMap<String, Object> intro = new BoardService().selectFoodProduct(num);
		
		
	
		
		// 남은 판매 일수
		int remain = 0;
		
		if( intro.get("pro_count") != null || intro.get("pro_qty") != null ){
			int count = (int) intro.get("pro_count");  
			int qty = (int) intro.get("pro_qty");
			
			remain = count - qty;
		}
		
		
		
	
		String page = "";
		
		// 찜하기
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		if(member != null){
			ArrayList<Dibs> dibs = new DibsService().selectDibsList(member.getMember_No());
			req.setAttribute("dibs", dibs);
		}
		
		if(member != null){
			ArrayList<Basket> bklist = new BasketService().selectPdBasketList(member.getMember_No());
			req.setAttribute("bklist", bklist);
		}
		
		
		//상품 진행상태
		ProductList productStatus = new BoardService().selectProgressStatus(num);
		
		if(productStatus != null){
			req.setAttribute("productStatus", productStatus);
		}
		
		
		
		
		
		
		
		
		
		if(intro != null){	
			
			
			
			page = "views/food/foodIntro.jsp";
			req.setAttribute("intro", intro);
			req.setAttribute("pnum", num);
			req.setAttribute("remain", remain);
			
		
		}
		
		
		
		
		
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
