package com.kh.Semi.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.kh.Semi.board.model.service.BoardService;
import com.kh.Semi.board.model.vo.Board;

/**
 * Servlet implementation class SelectOneQnaServlet
 */
@WebServlet("/selectOne.hp")
public class SelectOneQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		Board b = new BoardService().selectOneQna(num);
		
		String page = "";
		
		if(b != null){
			page = "views/helpDesk/help_QnAwriteLoad.jsp";
			request.setAttribute("b", b);
		}else{
			page = "views/exception/errorPage.jsp";
			request.setAttribute("msg", "조회에 실패했습니다.");
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
