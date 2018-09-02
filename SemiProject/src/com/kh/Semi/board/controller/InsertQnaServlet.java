package com.kh.Semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.board.model.service.BoardService;
import com.kh.Semi.board.model.vo.Board;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class InsertQnaServlet
 */
@WebServlet("/insert.hp")
public class InsertQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMember_No());
		
		System.out.println(title);
		System.out.println(content);
		System.out.println(writer);
		
		Board b = new Board();
		b.setBoard_Title(title);
		b.setBoard_Content(content);
		b.setMember_No(writer);
		
		int result = new BoardService().insertQna(b);
		
		if(result > 0){
//			request.setAttribute("result", "문의가 접수되었습니다.");
			response.sendRedirect("views/helpDesk/help_QnA.jsp");
		}else{
			request.setAttribute("result", "문의접수에 실패했습니다.");
			response.sendRedirect("views/helpDesk/help_QnA.jsp");
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
