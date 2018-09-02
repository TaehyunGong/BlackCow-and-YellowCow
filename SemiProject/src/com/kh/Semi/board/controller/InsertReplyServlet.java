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
import com.kh.Semi.board.model.vo.Reply;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/insert.rp")
public class InsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String rep_content = request.getParameter("content");
		String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMember_No());
		
		System.out.println(boardNo);
		System.out.println(rep_content);
		System.out.println(writer);
		
		Board b = new Board();
		b.setBoard_No(boardNo);
		b.setBoard_Content(rep_content);
		b.setMember_No(writer);
		
		ArrayList<Board> replyList = new BoardService().insertReply(b);
		
		response.setContentType("application/json");
		new Gson().toJson(replyList, response.getWriter());
		
		
		
		
		
		
		
//		String userId = request.getParameter("replyUserId");
//		int rep_Level = Integer.parseInt(request.getParameter("replyLevel"));
//		int ref_BoardNo = Integer.parseInt(request.getParameter("ref_boardNo"));
//		int ref_replyNo = Integer.parseInt(request.getParameter("ref_replyNo"));
//		String content = request.getParameter("rep_content");
//		
//		System.out.println(userId);
//		System.out.println(rep_Level);
//		System.out.println(ref_BoardNo);
//		System.out.println(ref_replyNo);
//		System.out.println(content);
//		
//		Reply rep = new Reply();
//		rep.setRep_Writer(userId);
//		rep.setRep_Level(rep_Level);
//		rep.setRep_Board_No(ref_BoardNo);
//		rep.setRep_No(ref_replyNo);
//		rep.setRep_Content(content);
//		
//		HttpSession session = request.getSession();
//		Member loginUser = (Member)session.getAttribute("loginUser");
//		
//		if(loginUser != null){
//			rep.setRep_Writer(loginUser.getMember_Nick());
//		}
//		
//		ArrayList<Reply> replyList = new BoardService().insertReply(rep);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
