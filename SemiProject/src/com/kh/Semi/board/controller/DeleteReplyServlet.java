package com.kh.Semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.Semi.board.model.service.BoardService;
import com.kh.Semi.board.model.vo.Board;

/**
 * Servlet implementation class DeleteReplyServlet
 */
@WebServlet("/delete.rp")
public class DeleteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int replyNo = Integer.parseInt(request.getParameter("num"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		System.out.println(replyNo);
		System.out.println(boardNo);
		
		Board b = new Board();
		b.setBoard_No(boardNo);
		b.setBoard_Detail_No(replyNo);
		
		ArrayList<Board> replyList = new BoardService().deleteReply(b);
		
		response.setContentType("application/json");
		new Gson().toJson(replyList, response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
