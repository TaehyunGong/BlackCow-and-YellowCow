package com.kh.Semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.board.model.service.BoardService;
import com.kh.Semi.board.model.vo.Board;
import com.kh.Semi.board.model.vo.PageInfo;

/**
 * Servlet implementation class SearchBoardServlet
 */
@WebServlet("/search.bo")
public class SearchBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchCondition = request.getParameter("searchCondition");
		System.out.println("검색종류 : " + searchCondition);
		ArrayList<Board> list = null;
		
		String searchValue = request.getParameter("searchValue");
		System.out.println("검색값 : " + searchValue);
		
		int currentPage;
		int limit;
		int startPage;
		int endPage;
		int maxPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = 0;
		if(searchCondition.equals("allList")){
			listCount = new BoardService().getListCount();
		}else if(searchCondition.equals("writer")){
			listCount = new BoardService().getListCountWriter(searchValue);
		}else if(searchCondition.equals("title")){
			listCount = new BoardService().getListCountTitle(searchValue);
		}else if(searchCondition.equals("content")){
			listCount = new BoardService().getListCountContent(searchValue);
		}
		
		limit = 10;
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage / limit + 0.9)) -1) * limit + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage, listCount);
		
		
		if(searchCondition.equals("allList")){
			list = new BoardService().selectAllList(currentPage, limit);
		}else if(searchCondition.equals("writer")){
			String writer = searchValue;
			list = new BoardService().searchWriter(writer, currentPage, limit);
		}else if(searchCondition.equals("title")){
			String title = searchValue;
			list = new BoardService().searchTitle(title, currentPage, limit);
		}else if(searchCondition.equals("content")){
			String content = searchValue;
			list = new BoardService().searchContent(content, currentPage, limit);
		}
		
		String page = "views/community/doran_searchResult.jsp";
		if(list != null || list.size() > 0){
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("searchCondition", searchCondition);
		}else{
			request.setAttribute("msg", "검색 결과가 없습니다.");
			request.setAttribute("searchCondition", searchCondition);
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
