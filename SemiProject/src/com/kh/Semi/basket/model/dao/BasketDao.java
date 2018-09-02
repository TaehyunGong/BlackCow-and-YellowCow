package com.kh.Semi.basket.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.Semi.basket.model.vo.Basket;
import com.kh.Semi.payment.model.dao.PaymentDao;

import static com.kh.Semi.common.JDBCTemplate.*;

public class BasketDao {

	private Properties prop = new Properties();
	
	public BasketDao(){
	      String fileName = BasketDao.class.getResource("/sql/basket/basket-query.properties").getPath();
	      try {
	         prop.load(new FileReader(fileName));
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	   }

	   public ArrayList<Basket> selectList(Connection con, int userNo) {
	      System.out.println("바스켓 다오 도착");
	      ArrayList<Basket> list = null;
	      
	      ResultSet rset = null;
	      PreparedStatement pstmt = null;
	      String query = prop.getProperty("selectBasket");
	      System.out.println("DAO쿼리 : " + query);
	      
	      try {
	         
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, userNo);
	         rset = pstmt.executeQuery();
	         
	         list = new ArrayList<Basket>();
	         
	         
	         while(rset.next())
	         {
	            Basket b = new Basket();
	            
	            b.setBas_num(rset.getInt("rownum"));
	            b.setCart_no(rset.getInt("cart_no"));
	            b.setOri_filename(rset.getString("ori_filename"));
	            b.setPro_title(rset.getString("pro_name"));
	            b.setPrice(rset.getInt("pro_price"));
	            b.setProduct_count(rset.getInt("product_count"));
	            b.setProduct_no(rset.getInt("product_no"));
	            list.add(b);
	            
	         }
	         System.out.println("바스켓 리스트값" + list);
		        
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally
	      {
	         close(rset);
	         close(pstmt);
	      }
	      
	      
	      return list;
	   }

	public int basketDelete(Connection con, int cart) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		System.out.println("바스켓 딜리트 도착");
		System.out.println("바스켓 번호 다오" + cart);
		int result = 0;
		
		String query = prop.getProperty("deleteBasket");
		System.out.println("딜리트 쿼리 : " +query);
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, cart);
			
			result = pstmt.executeUpdate();
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertPdBasket(Connection con, Basket bk) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertPdBasket");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bk.getMember_no());
			pstmt.setInt(2, bk.getPro_detail_no());
			pstmt.setInt(3, bk.getProduct_count());
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			close(pstmt);
		}
		
		
		
		
		return result;
	}

	public int deletePdBasket(Connection con, Basket bk) {
		
		
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("deletePdBasket");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bk.getMember_no());
			pstmt.setInt(2, bk.getPro_detail_no());
			

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	public ArrayList<Basket> selectPdBasketList(Connection con, int member_No) {
		
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ArrayList<Basket> bklist = null;
		
		String query = prop.getProperty("selectPdBasketList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, member_No);
			
			rset = pstmt.executeQuery();
			
			bklist = new ArrayList<Basket>();
			
			while(rset.next()){
				
				Basket bk = new Basket();
				
				bk.setCart_no(rset.getInt("cart_no"));
				bk.setMember_no(rset.getInt("member_no"));
				bk.setPro_detail_no(rset.getInt("pro_detail_no"));
				bk.setProduct_count(rset.getInt("product_count"));
				
	
				
				bklist.add(bk);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			close(pstmt);
			close(rset);
		}
		
		
		return bklist;
	}
	
	

}
