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
 * Servlet implementation class SelectAllFundReplyServlet
 */
@WebServlet("/selectReply.bo")
public class SelectAllFundReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectAllFundReplyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String type = request.getParameter("type");
		String board = request.getParameter("board");
		

		ArrayList<Board> list = new BoardService().selectReply(bnum,type,board);

		response.setContentType("application/json");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
