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
 * Servlet implementation class FarmerInformationUpdate
 */
@WebServlet("/farmerUpdate")
public class FarmerInformationUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FarmerInformationUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String farm_name = request.getParameter("farm_name");
		String farm_size = request.getParameter("farm_size");
		String farm_address = request.getParameter("farm_address");
		int member_no = Integer.parseInt(request.getParameter("member_no"));
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		String page = "";
		
		Member m = new Member();
		m.setFarm_Name(farm_name);
		m.setFarm_Size(farm_size);
		m.setFarm_Address(farm_address);
		m.setMember_No(member_no);
		int result = new MemberService().farmerUpdate(m);
		
		if(result > 0){
			Member loginUser = new MemberService().memberLogin(userId, userPwd);
			request.getSession().setAttribute("loginUser", loginUser);
			page = "views/seller/farmerInformation.jsp";
		}else{
			page = "views/common/page_404.jsp";
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
