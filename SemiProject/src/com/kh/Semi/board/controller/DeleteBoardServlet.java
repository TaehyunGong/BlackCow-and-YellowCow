package com.kh.Semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.board.model.service.BoardService;

/**
 * Servlet implementation class DeleteBoardServlet
 */
@WebServlet("/delete.bo")
public class DeleteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    } 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(boardNo);
		
		int result = new BoardService().deleteBoard(boardNo);
		
		if(result > 0){
			response.sendRedirect(request.getContextPath() + "/selectList.bo");
		}else{
			request.setAttribute("msg", "삭제하지 못했습니다.");
			request.getRequestDispatcher("views/exception/errorPage.jsp").forward(request, response);;
		}
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
