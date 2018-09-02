package com.kh.Semi.dips.model.dao;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.Semi.dips.model.vo.Dibs;
import com.kh.Semi.funding.model.dao.FundingDao;
import com.kh.Semi.funding.model.vo.ProductList;

import static com.kh.Semi.common.JDBCTemplate.close;
import static com.kh.Semi.common.JDBCTemplate.commit;
import static com.kh.Semi.common.JDBCTemplate.getConnection;
import static com.kh.Semi.common.JDBCTemplate.rollback;

public class DibsDao {
	
	   private Properties prop = new Properties();
	   
	public DibsDao() {
		 String fileName = FundingDao.class.getResource("/sql/dibs/dibs-query.properties").getPath();
	      
	      try {
	         prop.load(new FileReader(fileName));
	         
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	}

	public int insertDibs(Connection con, Dibs dib) {
		PreparedStatement pstmt = null;
	      int result = 0;
	      String query = prop.getProperty("insertDibs");
	      
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         
	         pstmt.setInt(1, dib.getMember_no());
	         pstmt.setInt(2, dib.getPro_detail_no());
	         
	         result = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	    	  close(pstmt);
	      }
	      
	      return result;
	}

	public ArrayList<Dibs> selectDibsOne(Connection con, Dibs dib) {
		ArrayList<Dibs> list = new ArrayList<Dibs>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		String query = prop.getProperty("selectDibsOne");
 		
 		try {
 			pstmt = con.prepareStatement(query);
 			
 			pstmt.setInt(1, dib.getMember_no());
 			pstmt.setInt(2, dib.getPro_detail_no());
 			
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				Dibs dibs = new Dibs();
 				
 				dibs.setDibs_no(rset.getInt("DIBS_NO"));
 				dibs.setMember_no(rset.getInt("MEMBER_NO"));
 				dibs.setPro_detail_no(rset.getInt("PRO_DETAIL_NO"));
 				
 				list.add(dibs);
 			}
 			
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}finally{
 			close(rset);
 			close(pstmt);
 		}
 		
 		return list;
	}

	public int deleteDibs(Connection con, Dibs dib) {
		PreparedStatement pstmt = null;
	      int result = 0;
	      String query = prop.getProperty("deleteDibs");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         
	         pstmt.setInt(1, dib.getMember_no());
	         pstmt.setInt(2, dib.getPro_detail_no());
	         
	         result = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	    	  close(pstmt);
	      }
	      
	      return result;
	}
	
	//멤버 번호만 가지고 찜목록 가져오기
	public ArrayList<Dibs> selectDibsMemOne(Connection con, int member_No) {
		ArrayList<Dibs> list = new ArrayList<Dibs>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		String query = prop.getProperty("selectDibsMemOne");
 		
 		try {
 			pstmt = con.prepareStatement(query);
 			
 			pstmt.setInt(1, member_No);
 			
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				Dibs dibs = new Dibs();
 				
 				dibs.setDibs_no(rset.getInt("DIBS_NO"));
 				dibs.setMember_no(rset.getInt("MEMBER_NO"));
 				dibs.setPro_detail_no(rset.getInt("PRO_DETAIL_NO"));
 				
 				
 				
 				list.add(dibs);
 			}
 			
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}finally{
 			close(rset);
 			close(pstmt);
 		}
 		
 		return list;
	}



	public ArrayList<Dibs> selectList(Connection con, int userNo) {
		// TODO Auto-generated method stub
		ArrayList<Dibs> list = new ArrayList<Dibs>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		System.out.println("다오도착");
 		
 		String query = prop.getProperty("selectList1");
 		
 		System.out.println("2번째 도착쿼리:"+query);
 		
 		list = new ArrayList<Dibs>();
        
 
 		
 		try {
 			
 			pstmt = con.prepareStatement(query);
 			
 			pstmt.setInt(1, userNo);
 			
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				
 				Dibs dibs = new Dibs();
 				
 				dibs.setRanks(rset.getInt("RANKS"));
 				dibs.setOri_fileName(rset.getString("ORI_FILENAME"));
 				dibs.setPro_name(rset.getString("PRO_NAME"));
 				dibs.setPro_detail_no(rset.getInt("PRO_DETAIL_NO"));
 				dibs.setMember_nick(rset.getString("MEMBER_NICK"));
 				dibs.setPro_date(rset.getDate("PRO_DATE"));
 				dibs.setProgress(rset.getString("PROGRESS"));
 				dibs.setDibs_no(rset.getInt("DIBS_NO"));
 				dibs.setDibs_no(rset.getInt("PRODUCT_NO"));
 				
 				list.add(dibs);
 				
 				
 				
 			}
 			System.out.println("찜 리스트 값 :" +list);
 			
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}finally{
 			close(rset);
 			close(pstmt);
 		}
 		
 		return list;
	}

	public int deleteDibsList(Connection con, int num) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteDibs2");
		int result = 0;
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, num);
	         
	         result = pstmt.executeUpdate();
	         
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	    	  close(pstmt);
	      }
	      System.out.println("찜다오 딜리트리스트 result값:"+result);
	      return result;
	}

	public ArrayList<Dibs> selectListO(Connection con, int userNo) {
		// TODO Auto-generated method stub
		ArrayList<Dibs> list = new ArrayList<Dibs>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		System.out.println("다오도착");
 		
 		String query = prop.getProperty("selectList2");
 		
 		System.out.println("2번째 도착쿼리:"+query);
 		
 		list = new ArrayList<Dibs>();
        
 
 		
 		try {
 			
 			pstmt = con.prepareStatement(query);
 			
 			pstmt.setInt(1, userNo);
 			
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				
 				Dibs dibs = new Dibs();
 				
 				dibs.setRanks(rset.getInt("RANKS"));
 				dibs.setOri_fileName(rset.getString("ORI_FILENAME"));
 				dibs.setPro_name(rset.getString("PRO_NAME"));
 				dibs.setPro_detail_no(rset.getInt("PRO_DETAIL_NO"));
 				dibs.setMember_nick(rset.getString("MEMBER_NICK"));
 				dibs.setPro_date(rset.getDate("PRO_DATE"));
 				dibs.setProgress(rset.getString("PROGRESS"));
 				dibs.setDibs_no(rset.getInt("DIBS_NO"));
 				dibs.setDibs_no(rset.getInt("PRODUCT_NO"));
 				
 				list.add(dibs);
 				
 				
 				
 			}
 			System.out.println("찜 리스트 값 :" +list);
 			
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}finally{
 			close(rset);
 			close(pstmt);
 		}
 		
 		return list;
	}

	

}
