package com.kh.Semi.message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.message.model.service.MessageService;
import com.kh.Semi.message.model.vo.Message;

/**
 * Servlet implementation class MessageSendServlet
 */
@WebServlet("/msend")
public class MessageSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		Message msg = new Message();
		msg.setList_no(Integer.parseInt(request.getParameter("listno")));
		msg.setSender(request.getParameter("userid"));
		msg.setContent(request.getParameter("content"));
		System.out.println(msg);
	
		RequestDispatcher view = null;
		try{
			if(new MessageService().sendMessage(msg) > 0) {
				response.sendRedirect("/hifive/mpage?listno="+msg.getList_no()+"&uid="+msg.getSender());
				
			} else {
				view = request.getRequestDispatcher("views/message/messageError.jsp");
				request.setAttribute("message", "쪽지보내기 실패");
				view.forward(request, response);
			}
		} catch(Exception e){
			view = request.getRequestDispatcher("views/message/messageError.jsp");
			request.setAttribute("message", e.getMessage());
			view.forward(request, response);
		}
	}

}
