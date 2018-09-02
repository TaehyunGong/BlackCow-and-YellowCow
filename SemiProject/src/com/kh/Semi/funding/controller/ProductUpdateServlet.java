package com.kh.Semi.funding.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.Semi.funding.model.service.FundingService;
import com.kh.Semi.funding.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ProductUpdateServlet
 */
@WebServlet("/productUpdate")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getSession().getServletContext().getRealPath("/");
		String savaPath = root + "images/funding/";
		System.out.println("savaPath : " + savaPath);
		int maxSize = 1024 * 1024 * 10;
		
		/*HttpSession session = request.getSession();
		session.getAttribute("loginUser");*/
		
		MultipartRequest multiRequest = new MultipartRequest(request,savaPath,maxSize , "UTF-8", new DefaultFileRenamePolicy());
		
		int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
		int productNo = Integer.parseInt(multiRequest.getParameter("product_no"));
		int proDetailNo = Integer.parseInt(multiRequest.getParameter("pro_detail_no"));
		String proContent = multiRequest.getParameter("proContent");
		String proName = multiRequest.getParameter("proName");
		int price = Integer.parseInt(multiRequest.getParameter("price"));
		int count = Integer.parseInt(multiRequest.getParameter("count"));
		String category = multiRequest.getParameter("category");
		String proType = multiRequest.getParameter("productType");
		String fileName = multiRequest.getFilesystemName("filename");
		System.out.println(fileName);
		String deadlines = multiRequest.getParameter("deadline");
		String[] dead = deadlines.split("/");
		
		String date = dead[2]+"-"+dead[0]+"-"+dead[1];
        Date d = Date.valueOf(date);
		
		Product pro = new Product();
		pro.setMember_No(memberNo);
		pro.setProduct_No(productNo);
		pro.setPro_Detail_No(proDetailNo);
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
		
		int result = new FundingService().updateProduct(pro, fileName);
		
		String page = "";
		if(result > 0){
			page = "/allFunding";
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
