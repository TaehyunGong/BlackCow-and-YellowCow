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
 * Servlet implementation class InsertQnaAnswerServlet
 */
@WebServlet("/insertAnswer.hp")
public class InsertQnaAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQnaAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		관리자 QNA답변등록 서블릿
		
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMember_No());
		
		Board b = new Board();
		b.setBoard_No(num);
		b.setBoard_Title(title);
		b.setBoard_Content(content);
		b.setMember_No(writer);
		
		System.out.println(b);
//		상태를 답변완료로 바꾸며 게시글을 업데이트.
		int result = new BoardService().insertQnaAnswer(b);
		
		String page = "";
		if(result > 0){
			page = "/searchAllQna.hp";
			request.setAttribute("b", b);
		}else{
			page = "views/exception/errorPage.jsp";
			request.setAttribute("msg", "답변등록실풰");
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
