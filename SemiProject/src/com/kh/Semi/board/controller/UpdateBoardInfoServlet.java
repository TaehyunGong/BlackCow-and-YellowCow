package com.kh.Semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.board.model.service.BoardService;
import com.kh.Semi.board.model.vo.Board;

/**
 * Servlet implementation class UpdateBoardInfoServlet
 */
@WebServlet("/updateBoardInfo.bo")
public class UpdateBoardInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoardInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		게시글 수정을 위한 보드 정보 받아오는 서블릿
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		
		Board b = new BoardService().updateInfoBoard(num);
		
		if(b != null){
			request.setAttribute("b", b);
			request.getRequestDispatcher("views/community/doran_writeUpdate.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "수정페이지 진입 실패");
			request.getRequestDispatcher("views/exception/errorPage.jsp").forward(request, response);
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
