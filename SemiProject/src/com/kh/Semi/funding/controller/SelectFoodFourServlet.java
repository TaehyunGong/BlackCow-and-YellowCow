package com.kh.Semi.funding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.Semi.funding.model.service.FundingService;
import com.kh.Semi.funding.model.vo.ProductList;

/**
 * Servlet implementation class SelectFundFourServlet
 */
@WebServlet("/selectFoodFour")
public class SelectFoodFourServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFoodFourServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String num = req.getParameter("num");
		
		ArrayList<ProductList> list = new FundingService().selectFoodFourListAll(Integer.parseInt(num)); 
		
		//리스트가 빈값이면 널 반환
		if(list.size() == 0)
			list = null;
		
		new Gson().toJson(list, res.getWriter());
	}

	//PR값에 따른 진행사항 필터링
	private ArrayList<ProductList> progressbar(ArrayList<ProductList> lists, String progress){
		ArrayList<ProductList> list = new ArrayList<ProductList>();
		
		//전체라면 필터할 필요없음
		if(progress.equals("all")){
			return lists;
		}
		
		//필터링
		for(ProductList plt : lists){
			if(plt.getProgress().equals(progress)){
				list.add(plt);
			}
		}
		
		return list;
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
