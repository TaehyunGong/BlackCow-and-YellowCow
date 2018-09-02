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

/**
 * Servlet implementation class ProductViewCounting
 */
@WebServlet("/ProductViewCounting")
public class ProductViewCounting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductViewCounting() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("product_page"));
		String progressd = req.getParameter("progress");
		Board b = new Board();
		String page = "";
		if(progressd == null){		//먹거리
			b.setPro_Detail_No(num);
			b.setBoard_Type("B5");
			b.setRef_Board("R1");
			page = "selectFood.bo?product_page="+num;
		}else{						//펀딩
			int progress = Integer.parseInt(progressd);
			b.setPro_Detail_No(num);
			b.setBoard_Type("B4");
			b.setRef_Board("R1");
			page = "selectProduct.bo?product_page="+num+"&progress="+progress;
		}
		
		new BoardService().updateBoardCount(b);	//조회수 상승

		res.sendRedirect(page);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
