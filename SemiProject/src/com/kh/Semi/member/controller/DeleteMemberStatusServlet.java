package com.kh.Semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.Semi.member.model.service.MemberService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class DeleteMemberStatusServlet
 */
@WebServlet("/deleteStatusMember.mem")
public class DeleteMemberStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int memberNo = m.getMember_No();
		
		int result = new MemberService().deleteStatusMemberUpdate(memberNo);
		
		if(result > 0){
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/");
		}else{
			request.setAttribute("msg", "탈퇴실패");
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
