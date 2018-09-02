package com.kh.Semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.board.model.service.BoardService;
import com.kh.Semi.board.model.vo.Board;
import com.kh.Semi.board.model.vo.PageInfo;

/**
 * Servlet implementation class SelectAllQnaListServlet
 */
@WebServlet("/selectList.hp")
public class SelectAllQnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllQnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currentPage;
		int limit;
		int startPage;
		int endPage;
		int maxPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = new BoardService().getListCountQna();
		
		limit = 10;
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage / limit + 0.9)) -1) * limit + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage, listCount);
		
		ArrayList<Board> list = new BoardService().selectAllQnaList(currentPage, limit);
		
		String page = "";
		
		if(list != null){
			page = "views/helpDesk/help_QnAsearchResult.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else{
			page = "views/exception/errorPage.jsp";
			request.setAttribute("msg", "조회실패");
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
