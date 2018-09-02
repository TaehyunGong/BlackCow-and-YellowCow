package com.kh.Semi.common;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deleteimg
 */
@WebServlet("/deleteimg")
public class ImageDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String src = request.getParameter("src");
		String data = request.getParameter("data");
		String root = request.getSession().getServletContext().getRealPath("/");
		String[] srcArr = src.split("/");
		
		System.out.println(src);
		
		for(int i = 0; i < srcArr.length; i++){
			src = srcArr[i];
		}
		
		System.out.println(src);
		System.out.println(root + "upload_img/");
		
		String savePath = root + "upload_img/";
		
		File deleteFile = new File(savePath + src);
		deleteFile.delete();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
