package com.kh.Semi.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.board.model.vo.Board;
import com.kh.Semi.funding.model.service.FundingService;

/**
 * Servlet implementation class StoryBoardUpdate
 */
@WebServlet("/storyUpdate")
public class StoryBoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoryBoardUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String storyContent = request.getParameter("storyContent");
		String memberNo = request.getParameter("memberNo");
		int detailNo = Integer.parseInt(request.getParameter("detailNo"));
		
		Board b = new Board();
		b.setMember_No(memberNo);
		b.setBoard_Content(storyContent);
		b.setPro_Detail_No(detailNo);
		
		
		int result = new FundingService().insertStory(b);
		
		String page = "";
		
		if(result > 0){
			page = "/allFunding";
		}else{
			page="/views/common/page_404.jsp";
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
