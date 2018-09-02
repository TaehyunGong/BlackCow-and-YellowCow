package com.kh.Semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.member.model.service.MemberService;
import com.kh.Semi.member.model.vo.Member;

@WebServlet("/selectAllMember.mem")
public class SelectAllMemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAllMemberList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> list = new MemberService().selectAllMember();
		
		String page = "";
		
		if(list != null){
			page = "views/admin/adminMemberList.jsp";
			request.setAttribute("list", list);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "조회 결과가 없습니다!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
