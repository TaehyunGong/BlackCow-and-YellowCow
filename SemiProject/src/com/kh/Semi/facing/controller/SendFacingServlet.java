package com.kh.Semi.facing.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.Semi.facing.model.service.FacingService;
import com.kh.Semi.facing.model.vo.Facing;
import com.kh.Semi.member.model.service.MemberService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class SendFacingServlet
 */
@WebServlet("/sendFacing.fa")
public class SendFacingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendFacingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMember_No());
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String receiver = request.getParameter("receiver");
		String receiverNo = "";
		int receiverNo1 = 0;
		
		ArrayList<Member> list = new MemberService().selectAllMember();
		
		System.out.println("서블릿 sendFacing list : " + list);
		if(list != null){
			for(int i = 0; i < list.size(); i++){
				if(receiver.equals(list.get(i).getMember_Nick())){
					System.out.println("같은경우 있긴있냐");
//					receiverNo = String.valueOf(((Member)(list.get(i))).getMember_No());
					receiverNo1 = list.get(i).getMember_No();
				}
			}
		}
		System.out.println("작성자 : " + writer);
		System.out.println("제목 : " + title);
		System.out.println("내용 : " + content);
		System.out.println("받는사람 : " + receiver);
		System.out.println("받는사람 유저번호 : " + receiverNo1);
		
		Facing f = new Facing();
		f.setWriter(writer);
		f.setFacing_Title(title);
		f.setFacing_Content(content);
		
		int result = new FacingService().sendFacing(f, receiverNo1);
		
		response.setContentType("application/json");
		new Gson().toJson(result, response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
