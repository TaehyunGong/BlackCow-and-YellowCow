package com.kh.Semi.funding.controller;

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
import com.kh.Semi.funding.model.service.FundingService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class MainFunding
 */
@WebServlet("/MainFunding")
public class MainFunding extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainFunding() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HashMap<String, ArrayList<com.kh.Semi.funding.model.vo.MainFunding>> map = new FundingService().mainSelect();
			
		
		req.setAttribute("list1", map.get("fund1"));
		req.setAttribute("list2", map.get("food"));
		req.setAttribute("list3", map.get("fund2"));
		
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		
		if(member != null){
			ArrayList<Dibs> dibs = new DibsService().selectDibsList(member.getMember_No());
			req.setAttribute("dibs", dibs);
		}
		
		ArrayList<Board> list = new BoardService().selectAllList(1, 10);
		req.setAttribute("boradList", list);
		
		String page = "views/main/main.jsp";
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
