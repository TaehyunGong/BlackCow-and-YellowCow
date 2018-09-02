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
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class UpdateOneBoardServlet
 */
@WebServlet("/updateOneBoard.bo")
public class UpdateOneBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOneBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		게시글 수정하는 메소드
		
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = String.valueOf(((Member)(request.getSession()).getAttribute("loginUser")).getMember_No());
		
		Board b = new Board();
		b.setBoard_No(num);
		b.setBoard_Title(title);
		b.setBoard_Content(content);
		b.setMember_No(writer);
		
		int result = new BoardService().updateOneBoard(b);
		
		if(b != null){
			b = new BoardService().selectOne(b.getBoard_No());
		}
		
		String page = "";
		if(result > 0){
			page = "/selectOne.bo?num="+b.getBoard_No();
			request.getSession().setAttribute("b", b);
		}else{
			page = "views/exception/errorPage.jsp";
			request.setAttribute("msg", "게시글 수정 실패");
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
