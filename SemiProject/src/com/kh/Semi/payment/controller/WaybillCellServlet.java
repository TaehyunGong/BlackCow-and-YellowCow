package com.kh.Semi.payment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.member.model.vo.Member;
import com.kh.Semi.payment.model.service.PaymentService;
import com.kh.Semi.payment.model.service.WaybillDelete;
import com.kh.Semi.payment.model.service.WaybillExcel;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class WaybillCellServlet
 */
@WebServlet("/waybillCell")
public class WaybillCellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WaybillCellServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int sellNo = m.getMember_No();
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "waybill/";
		int maxSize = 1024 * 1024 * 10;
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize , "UTF-8", new DefaultFileRenamePolicy());
		
		String fileName = multiRequest.getFilesystemName("waybillExcel");
		String page = "";
		try {
			ArrayList<HashMap<String, Object>> list = new WaybillExcel().getExcelfile(savePath, fileName);
			int result = 0;
			if(list != null){
				new WaybillDelete().waybillDel(savePath, fileName);
				for(int i = 0; i < list.size(); i++){
					new PaymentService().updateWaybill(list.get(i).get("delivery_no").toString(), list.get(i).get("waybill").toString(), sellNo);
					result++;
				}
				
				if(result != list.size()){
					page = "/views/common/page_404.jsp";
				}else{
					page = "/selectWaybill";
				}
				request.getRequestDispatcher(page).forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
