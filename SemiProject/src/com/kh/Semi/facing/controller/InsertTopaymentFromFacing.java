package com.kh.Semi.facing.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.facing.model.service.FacingService;
import com.kh.Semi.facing.model.vo.Facing;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class InsertTopaymentFromFacing
 */
@WebServlet("/insert.pf")
public class InsertTopaymentFromFacing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertTopaymentFromFacing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String receiver = request.getParameter("receiver");
		//String title = request.getParameter("title");
		//String content = request.getParameter("content");
		String title ="환불합니다.";
		String contetn = "환불합니다.";
		String receiver = "받는사람"; 
		System.out.println("서블릿 도착");
		int writer = Integer.parseInt(request.getParameter("writer"));
		System.out.println("받는사람 "  );
		System.out.println("제목 : " + title);
		System.out.println("내용 : " + contetn);
		System.out.println("작성자 : " + writer);
		
		
		Facing f = new Facing();
		//f.setReceiver();
		f.setFacing_Title(title);
		f.setFacing_Content(contetn);
		//f.setWriter(writer);
		
		int result = new FacingService().insertFacing(f);
		
		if(result > 0){
			response.sendRedirect(request.getContextPath() + "/selectList.fa");
		}else{
			request.setAttribute("msg", "작성실패");
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
