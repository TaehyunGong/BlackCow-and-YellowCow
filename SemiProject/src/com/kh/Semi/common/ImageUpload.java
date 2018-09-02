package com.kh.Semi.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ImageUpload
 */
@WebServlet("/imgUpload")
public class ImageUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		 String realFolder = "";
		 String filename1 = "";
		 int maxSize = 1024*1024*5;
		 String encType = "UTF-8";
		 String savefile = "upload_img";
		 ServletContext scontext = getServletContext();
		 realFolder = scontext.getRealPath(savefile);
		 
		 try{
		  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

		  Enumeration<?> files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		     filename1 = multi.getFilesystemName(file1);
		 } catch(Exception e) {
		  e.printStackTrace();
		 }
		 
		 String fullpath = realFolder + "\\" + filename1;

		 System.out.println("경로 : " +fullpath);
		 System.out.println("경로2 : " + request.getContextPath()+"/upload_img/" + filename1);
		 String path2 = request.getContextPath()+"/upload_img/" + filename1;
		 System.out.println("filename : " + filename1);
		 
		 JSONObject jobj = new JSONObject();
			jobj.put("url", path2);
			
			String data = jobj.toString();
			System.out.println("url : " + data);
			
			response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
			response.setCharacterEncoding("UTF-8");
			
			PrintWriter out = response.getWriter();
			out.print(jobj.toJSONString());
			out.flush();
			out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
