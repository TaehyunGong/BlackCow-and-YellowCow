package com.kh.Semi.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.google.gson.JsonObject;
import com.kh.Semi.member.model.service.MemberService;
import com.kh.Semi.member.model.vo.Member;

/**
 * Servlet implementation class NaverLogin
 */
@WebServlet("/NaverLogin")
public class NaverLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		String code = req.getParameter("code");
//		String state = req.getParameter("state");
		
		String access_token = "";
		String refresh_token = "";
		
		String clientId = "OA8xSbJB_nNsZA1XOZLt";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "G4liGExxLw";//애플리케이션 클라이언트 시크릿값";
	    String code = req.getParameter("code");
	    String state = req.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8001/Semi/MainFunding", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    
	    
	    StringBuffer rese = null;
	    
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      rese = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        rese.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	    	  System.out.println();
	      }
	    } catch (Exception e) {
	    	System.out.println();
	      System.out.println("실패 : "+e);
	    }
	    
	    JSONObject json = (JSONObject)JSONValue.parse(rese.toString());
	    refresh_token = (String)json.get("refresh_token");
	    access_token = (String)json.get("access_token");
	    
		try {
			String token = access_token;// 네이버 로그인 접근 토큰;
			String header = "Bearer " + token; // Bearer 다음에 공백 추가
            apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            json = (JSONObject)JSONValue.parse(response.toString());
            json = (JSONObject)JSONValue.parse(json.get("response").toString());
            
            req.setAttribute("email", json.get("email"));
            req.setAttribute("name", json.get("name"));
            req.setAttribute("id", json.get("id"));
            req.setAttribute("refresh_token", refresh_token);
            
        } catch (Exception e) {
            System.out.println(e);
        }
		
		Member loginUser = new MemberService().memberSNSLogin((String)json.get("id"));
		String page = "/views/common/naverLoginCallback.jsp";
		RequestDispatcher view = req.getRequestDispatcher(page);
		
	    HttpSession session = req.getSession();
		if(loginUser != null){
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("msg", "로그인성공");
			req.setAttribute("bool", true);
		}else{
			session.setAttribute("msg", "로그인실패");
			req.setAttribute("bool", false);
		}
		
		view.forward(req, res);		//보내준다.
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
