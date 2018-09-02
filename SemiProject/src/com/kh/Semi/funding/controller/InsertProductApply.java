package com.kh.Semi.funding.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.funding.model.service.FundingService;
import com.kh.Semi.funding.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InsertProductApply
 */
@WebServlet("/insertProduct")
public class InsertProductApply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductApply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String savaPath = root + "images/funding/";
		int maxSize = 1024 * 1024 * 10;
		
		/*HttpSession session = request.getSession();
		session.getAttribute("loginUser");*/
		
		MultipartRequest multiRequest = new MultipartRequest(request,savaPath,maxSize , "UTF-8",new DefaultFileRenamePolicy());
		int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
		String proContent = multiRequest.getParameter("proContent");
		String proName = multiRequest.getParameter("proName");
		int price = Integer.parseInt(multiRequest.getParameter("price"));
		int count = Integer.parseInt(multiRequest.getParameter("count"));
		String category = multiRequest.getParameter("category");
		String proType = multiRequest.getParameter("productType");
		int attachNo = 0;
		if(!(multiRequest.getParameter("attachNo").equals("food"))){
			attachNo = Integer.parseInt(multiRequest.getParameter("attachNo"));
		}
		
		String fileName = multiRequest.getFilesystemName("filename");
		String deadlines = multiRequest.getParameter("deadline");
		String[] dead = deadlines.split("/");
		
		String date = dead[2]+"-"+dead[0]+"-"+dead[1];
        Date d = Date.valueOf(date);
		
		Product pro = new Product();
		pro.setMember_No(memberNo);
		pro.setPro_content(proContent);
		pro.setPro_Name(proName);
		pro.setPro_Price(price);
		pro.setPro_Count(count);
		pro.setCategory(category);
		pro.setDeadline(d);
		if(proType.equals("P1")){
			pro.setProduct_Type(proType);
		}else{
			pro.setFunding_Type(proType);
		}
		
		int result = new FundingService().insertProduct(pro, attachNo, fileName);
		
		
		if(result > 0){
			response.sendRedirect("views/seller/sellerMain.jsp");
		}else{
			response.sendRedirect("views/common/errorPage.jsp");
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
