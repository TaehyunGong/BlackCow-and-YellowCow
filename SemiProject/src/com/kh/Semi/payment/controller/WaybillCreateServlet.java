package com.kh.Semi.payment.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.util.URLEncoder;

import com.kh.Semi.member.model.vo.Member;
import com.kh.Semi.payment.model.service.PaymentService;
import com.kh.Semi.payment.model.service.WaybillExcel;

/**
 * Servlet implementation class WaybillCreateServlet
 */
@WebServlet("/waybillCreate")
public class WaybillCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WaybillCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int memberNo = m.getMember_No();
		ArrayList<HashMap<String, Object>> list = new PaymentService().selectWaybill(memberNo);
		
		String root = request.getSession().getServletContext().getRealPath("/waybill/");
		
		String excelName = new WaybillExcel().WaybillCreate(list, root);
		String path = root + File.separator + excelName;
		String down = root+excelName;
				
		File file = new File(path);

		  String userAgent = request.getHeader("User-Agent");
		  boolean ie = userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("rv:11") > -1;
		  String fileName = null;
		   
		  
		  response.setContentType("application/octet-stream");
		  response.setHeader("Content-Disposition","attachment;filename=\"" +excelName+"\";");
		  
		  FileInputStream fis=new FileInputStream(file);
		  BufferedInputStream bis=new BufferedInputStream(fis);
		  ServletOutputStream so=response.getOutputStream();
		  BufferedOutputStream bos=new BufferedOutputStream(so);
		  
		  byte[] data=new byte[2048];
		  int input=0;
		  while((input=bis.read(data))!=-1){
		   bos.write(data,0,input);
		   bos.flush();
		  }
		  
		  if(bos!=null) bos.close();
		  if(bis!=null) bis.close();
		  if(so!=null) so.close();
		  if(fis!=null) fis.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
