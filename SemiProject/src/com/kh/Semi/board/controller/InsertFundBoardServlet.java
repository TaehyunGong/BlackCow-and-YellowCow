package com.kh.Semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.board.model.service.BoardService;
import com.kh.Semi.facing.model.service.FacingService;
import com.kh.Semi.facing.model.vo.Facing;

/**
 * Servlet implementation class InsertFundBoardServlet
 */
@WebServlet("/insertFd.bo")
public class InsertFundBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFundBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content = request.getParameter("replyCtArea");
		int pNum = Integer.parseInt(request.getParameter("pro_De_No"));
		int mNum = Integer.parseInt(request.getParameter("memberNo"));
		String type = request.getParameter("bdType");
		String board = request.getParameter("refBoard");
		int progress = Integer.parseInt(request.getParameter("progressNum"));
		
		
		if(type.equals("B4")){
			// 쪽지 전달하기
			
			int sellerNum = Integer.parseInt(request.getParameter("sellerNo"));
			String pro_name = request.getParameter("pro_name");
			
			
			int result = 0;
			
			String page = "";
			
			System.out.println(pNum);
			
			if(!content.equals("")){
			
			result = new BoardService().insertFundBoard(pNum, mNum, type, board, content);
			
			}
			
			
			
			if(result > 0){
				
				response.sendRedirect(request.getContextPath() + "/selectFd.bo?pnum="+ pNum + "&type="+ type +"&board="+ board +"&progress=" + progress);
			
				
				if(board.equals("R5")){
				if(sellerNum != 0 && !pro_name.equals("") ){
					
					String FCtitle = "<" + pro_name + "> 상품문의";
					
					
					
					Facing f = new Facing();
					f.setWriter(String.valueOf(mNum));
					f.setFacing_Title(FCtitle);
					f.setFacing_Content(content);
					
					
					int fcResult = new FacingService().sendFacing(f, sellerNum);
				
					}
				}	
				
				
			}else{
				page = "views/exception/errorPage.jsp";
				request.setAttribute("msg", "게시판 입력 실패!");
			}
		}else{
			
			// 쪽지 전달하기
			
			int sellerNum = Integer.parseInt(request.getParameter("sellerNo"));
			String pro_name = request.getParameter("pro_name");
			
			
			int result = 0;
			
			String page = "";
			
			System.out.println(pNum);
			
			if(!content.equals("")){
			
			result = new BoardService().insertFundBoard(pNum, mNum, type, board, content);
			
			}
			
			
			
			if(result > 0){
				
				response.sendRedirect(request.getContextPath() + "/selectFoodBoard.bo?pnum="+ pNum + "&type="+ type +"&board="+ board);
			
				
				if(board.equals("R5")){
				if(sellerNum != 0 && !pro_name.equals("") ){
					
					String FCtitle = "<" + pro_name + "> 상품문의";
					
					
					
					Facing f = new Facing();
					f.setWriter(String.valueOf(mNum));
					f.setFacing_Title(FCtitle);
					f.setFacing_Content(content);
					
					
					int fcResult = new FacingService().sendFacing(f, sellerNum);
				
					}
				}	
				
				
			}else{
				page = "views/exception/errorPage.jsp";
				request.setAttribute("msg", "게시판 입력 실패!");
			}
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
