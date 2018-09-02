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
import com.kh.Semi.funding.model.service.cellClass;
import com.kh.Semi.funding.model.vo.ProductList;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class SelectOneProductServlet
 */
@WebServlet("/selectProduct.bo")
public class SelectOneProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("product_page"));
		int progress = Integer.parseInt(req.getParameter("progress"));

		
		//상세페이지 정보 및 메인사진
		HashMap<String, Object> intro = new BoardService().selectProduct(num);
		
	
	
		
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
		
		
		//상품 진행상태
		ProductList productStatus = new BoardService().selectProgressStatus(num);
		
		if(productStatus != null){
			req.setAttribute("productStatus", productStatus);
		}
		
		
		
		
		// 밭 정보 가져오기
		
		String name = (String) intro.get("member_Id");
		String path = this.getServletContext().getRealPath("/farmArea/");
			
		
		try{
			
			String[][] arr = new cellClass().viewField(name, path);
			/*int farmSize = new cellClass().viewFieldFarmSize(name, path);*/
			
			/*for(String[] str : arr){
				for(String s : str)
					System.out.print(s);
				System.out.println();
			}*/
			
			req.setAttribute("arr", arr);
			/*req.setAttribute("farmSize", farmSize);*/
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		
		if(intro != null){	
			
			page = "views/funding/productIntro.jsp";
			req.setAttribute("intro", intro);
			req.setAttribute("pnum", num);
			req.setAttribute("remain", remain);
			req.setAttribute("progress", progress);
		
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
