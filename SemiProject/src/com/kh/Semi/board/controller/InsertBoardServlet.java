package com.kh.Semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.Semi.board.model.service.BoardService;
import com.kh.Semi.board.model.vo.Board;
import com.kh.Semi.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/insert.bo")
public class InsertBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMember_No());
			
		Board b = new Board();
		b.setBoard_Title(title);
		b.setBoard_Content(content);
		b.setMember_No(writer);
		
		int result = new BoardService().insertBoard(b);
		
		if(result > 0){
			response.sendRedirect(request.getContextPath() + "/selectList.bo");
		}else{
			request.setAttribute("msg", "작성실패");
			request.getRequestDispatcher("views/exception/errorPage.jsp").forward(request, response);
		}
		
		
//		멀티파트..
		/*if(ServletFileUpload.isMultipartContent(request)){
//			용량제한.
			int maxSize = 1024 * 1024 * 10;
			
//			경로추출
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println(root);
			String savePath = root+"boardUploadFiles/";
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multi.getFileNames();
			
			while(files.hasMoreElements()){
				String name = files.nextElement();
				
				saveFiles.add(multi.getFilesystemName(name));
				originFiles.add(multi.getOriginalFileName(name));
			}
			
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			
			Board b = new Board();
			b.setBoard_Title(title);
			b.setBoard_Content(content);
			b.setMember_No(String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMember_No()));
			
		}*/
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
