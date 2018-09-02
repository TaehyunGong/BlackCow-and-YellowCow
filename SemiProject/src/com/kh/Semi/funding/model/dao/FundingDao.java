package com.kh.Semi.funding.model.dao;

import static com.kh.Semi.common.JDBCTemplate.close;

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
import java.util.HashMap;
import java.util.Properties;

import com.kh.Semi.funding.model.vo.MainFunding;
import com.kh.Semi.funding.model.vo.Product;
import com.kh.Semi.funding.model.vo.ProductList;

public class FundingDao {
   
   private Properties prop = new Properties();
   
   public FundingDao(){
      
      String fileName = FundingDao.class.getResource("/sql/funding/funding-query.properties").getPath();
      
      try {
         prop.load(new FileReader(fileName));
         
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
   

   public int insertProduct(Connection con, Product pro) {
      PreparedStatement pstmt = null;
      int result = 0;
      String query = prop.getProperty("insertProduct");
      
      System.out.println(pro);
      
      try {
         pstmt = con.prepareStatement(query);
         pstmt.setString(1, pro.getProduct_Type());
         pstmt.setString(2, pro.getFunding_Type());
         pstmt.setString(3, pro.getCategory());
            
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      
      return result;
   }


   public int insertProductDetail(Connection con, Product pro) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      
      String query = prop.getProperty("insertProDetail");
      
      try {
        pstmt = con.prepareStatement(query);
        pstmt.setInt(1, pro.getProduct_No());
		pstmt.setInt(2, pro.getMember_No());
		pstmt.setString(3, pro.getPro_Name());
		pstmt.setDate(4, pro.getDeadline());
		pstmt.setInt(5, pro.getPro_Price());
		pstmt.setInt(6, pro.getPro_Count());
         
         
        result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally{
         close(pstmt);
      }
      return result;
   }


   public int getProductNo(Connection con) {
      Statement stmt = null;
      ResultSet rset = null;
      int productNo = 0;
      String query = prop.getProperty("getProductNo");
      
      try {
         stmt = con.createStatement();
         rset = stmt.executeQuery(query);
         
         if(rset.next()){
            productNo = rset.getInt(1);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally{
         close(rset);
         close(stmt);
      }
      
      return productNo;
   }
   
   public int getProDetailNo(Connection con) {
      Statement stmt = null;
      ResultSet rset = null;
      int proDetailNo = 0;
      String query = prop.getProperty("getProDetailNo");
      
      try {
         stmt = con.createStatement();
         rset = stmt.executeQuery(query);
         
         if(rset.next()){
            proDetailNo = rset.getInt(1);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally{
         close(rset);
         close(stmt);
      }
      
      return proDetailNo;
   }


   public int insertProductRecord(Connection con, Product pro) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("insertProRecord");
      
      try {
         pstmt = con.prepareStatement(query);
         pstmt.setInt(1, pro.getPro_Detail_No());
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }finally{
         close(pstmt);
      }
      
      return result;
   }

   
   //메인페이지의 펀딩 리스트 조회
 	public ArrayList<MainFunding> mainSelect(Connection conn) {
 		ArrayList<MainFunding> list = new ArrayList<MainFunding>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
 		
 		String query = prop.getProperty("mainSelect");
 		
 		try {
 			pstmt = conn.prepareStatement(query);
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				MainFunding fund = new MainFunding();
 				
 				fund.setPro_detail_no(rset.getInt("PRO_DETAIL_NO"));
 				fund.setPro_name(rset.getString("PRO_NAME"));
 				fund.setPro_count(rset.getInt("COUNT"));
 				fund.setPro_qty(rset.getInt("QTY"));
 				fund.setPro_price(rset.getInt("PRO_PRICE"));
 				fund.setPro_date(dateFormat.format(rset.getDate("PRO_DATE")));
 				fund.setOri_fileName(rset.getString("ORI_FILENAME"));
 				fund.setPercent_qty(rset.getInt("RANKS"));
 				fund.setProgress(rset.getString("PROGRESS"));
 				list.add(fund);
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

 	//메인 먹거리 리스트
	public ArrayList<MainFunding> mainSelectFood(Connection conn) {
		ArrayList<MainFunding> list = new ArrayList<MainFunding>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
 		
 		String query = prop.getProperty("mainSelectFood");
 		
 		try {
 			pstmt = conn.prepareStatement(query);
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				MainFunding fund = new MainFunding();
 				
 				fund.setPro_detail_no(rset.getInt("PRO_DETAIL_NO"));
 				fund.setPro_name(rset.getString("PRO_NAME"));
 				fund.setPro_count(rset.getInt("COUNT"));
 				fund.setPro_qty(rset.getInt("QTY"));
 				fund.setPro_price(rset.getInt("PRO_PRICE"));
 				fund.setPro_date(dateFormat.format(rset.getDate("PRO_DATE")));
 				fund.setOri_fileName(rset.getString("ORI_FILENAME"));
 				fund.setPercent_qty(rset.getInt("RANKS"));
 				fund.setProgress(rset.getString("PROGRESS"));
 				
 				list.add(fund);
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
	
	//메인 펀딩 신규리스트
	public ArrayList<MainFunding> mainSelectTwo(Connection conn) {
		ArrayList<MainFunding> list = new ArrayList<MainFunding>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
 		
 		String query = prop.getProperty("mainSelectTwo");
 		
 		try {
 			pstmt = conn.prepareStatement(query);
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				MainFunding fund = new MainFunding();
 				
 				fund.setPro_detail_no(rset.getInt("PRO_DETAIL_NO"));
 				fund.setPro_name(rset.getString("PRO_NAME"));
 				fund.setPro_count(rset.getInt("COUNT"));
 				fund.setPro_qty(rset.getInt("QTY"));
 				fund.setPro_price(rset.getInt("PRO_PRICE"));
 				fund.setPro_date(dateFormat.format(rset.getDate("PRO_DATE")));
 				fund.setOri_fileName(rset.getString("ORI_FILENAME"));
 				fund.setPercent_qty(rset.getInt("RANKS"));
 				fund.setProgress(rset.getString("PROGRESS"));
 				
 				list.add(fund);
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
 	

	public ArrayList<ProductList> selectFundingListAll(Connection conn, String progress) {
		ArrayList<ProductList> list = new ArrayList<ProductList>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
 		
 		String query = prop.getProperty("selectFundingListAll");
 		
 		try {
 			pstmt = conn.prepareStatement(query);
 			
 			pstmt.setString(1, progress+"%");
 			
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				ProductList fund = new ProductList();
 				
 				fund.setPro_detail_no(rset.getInt("pro_detail_no"));
 				fund.setRanks(rset.getInt("ranks"));
 				fund.setPro_name(rset.getString("pro_name"));
 				fund.setPro_count(rset.getInt("count"));
 				fund.setPro_qty(rset.getInt("qty"));
 				fund.setPro_date(rset.getDate("pro_date"));
 				fund.setPro_price(rset.getInt("pro_price"));
 				fund.setOri_fileName(rset.getString("ori_filename"));
 				fund.setProgress(rset.getString("PROGRESS"));
 				list.add(fund);
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


	public ArrayList<ProductList> selectFundFourListAll(Connection conn, int num, String progress) {
		ArrayList<ProductList> list = new ArrayList<ProductList>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		String query = prop.getProperty("selectFundFourListAll");
 		
 		try {
 			pstmt = conn.prepareStatement(query);
 			pstmt.setString(1, progress+"%");
 			pstmt.setInt(2, (num-4));
 			pstmt.setInt(3, num);
 			
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				ProductList fund = new ProductList();
 				
 				fund.setPro_detail_no(rset.getInt("pro_detail_no"));
 				fund.setRanks(rset.getInt("ranks"));
 				fund.setPro_name(rset.getString("pro_name"));
 				fund.setPro_count(rset.getInt("count"));
 				fund.setPro_qty(rset.getInt("qty"));
 				fund.setPro_date(rset.getDate("pro_date"));
 				fund.setPro_price(rset.getInt("pro_price"));
 				fund.setOri_fileName(rset.getString("ori_filename"));
 				fund.setProgress(rset.getString("PROGRESS"));
 				list.add(fund);
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


	public ArrayList<ProductList> selectFundingListOne(Connection conn, String catagory, String progress) {
		ArrayList<ProductList> list = new ArrayList<ProductList>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		String query = prop.getProperty("selectFundingListOne");
 		
 		try {
 			pstmt = conn.prepareStatement(query);
 			
 			pstmt.setString(1, catagory);
 			pstmt.setString(2, progress+"%");
 			
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				ProductList fund = new ProductList();
 				
 				fund.setPro_detail_no(rset.getInt("pro_detail_no"));
 				fund.setRanks(rset.getInt("ranks"));
 				fund.setPro_name(rset.getString("pro_name"));
 				fund.setPro_count(rset.getInt("count"));
 				fund.setPro_qty(rset.getInt("qty"));
 				fund.setPro_date(rset.getDate("pro_date"));
 				fund.setPro_price(rset.getInt("pro_price"));
 				fund.setOri_fileName(rset.getString("ori_filename"));
 				fund.setProgress(rset.getString("PROGRESS"));
 				
 				list.add(fund);
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


	public ArrayList<ProductList> selectFundFourListOne(Connection conn, int num, String progress, String catagory) {
		ArrayList<ProductList> list = new ArrayList<ProductList>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		String query = prop.getProperty("selectFundFourListOne");
 		
 		try {
 			pstmt = conn.prepareStatement(query);
 			
 			pstmt.setString(1, catagory);
 			pstmt.setString(2, progress+"%");
 			pstmt.setInt(3, (num-4));
 			pstmt.setInt(4, num);
 			
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				ProductList fund = new ProductList();
 				
 				fund.setPro_detail_no(rset.getInt("pro_detail_no"));
 				fund.setRanks(rset.getInt("ranks"));
 				fund.setPro_name(rset.getString("pro_name"));
 				fund.setPro_count(rset.getInt("count"));
 				fund.setPro_qty(rset.getInt("qty"));
 				fund.setPro_date(rset.getDate("pro_date"));
 				fund.setPro_price(rset.getInt("pro_price"));
 				fund.setOri_fileName(rset.getString("ori_filename"));
 				fund.setProgress(rset.getString("PROGRESS"));
 				
 				list.add(fund);
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
 	
	public ArrayList<HashMap<String, Object>> selectAllFunding(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectAllFunding");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset != null){
				list = new ArrayList<HashMap<String, Object>>();
				
				while(rset.next()){
					hmap = new HashMap<String, Object>();
					
					hmap.put("pro_detail_no", rset.getString("pro_detail_no"));
					hmap.put("ranks", rset.getString("ranks"));
					hmap.put("product_no", rset.getString("product_no"));
					hmap.put("pro_name", rset.getString("pro_name"));
					hmap.put("category", rset.getString("category"));
					hmap.put("pro_date", rset.getDate("pro_date"));
					hmap.put("pro_deadline", rset.getDate("PRO_deadline"));
					hmap.put("pro_price", rset.getString("pro_price"));
					hmap.put("pro_count", rset.getString("pro_count"));
					hmap.put("pro_qty", rset.getString("pro_qty"));
					hmap.put("funding_type", rset.getString("funding_type"));
					hmap.put("record_date", rset.getString("record_date"));
					hmap.put("progress", rset.getString("progress"));
					hmap.put("member_no", rset.getInt("member_no"));
					
					list.add(hmap);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
 	
	public ArrayList<HashMap<String, Object>> selectAllProduct(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectAllProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<HashMap<String, Object>>();
				
				while(rset.next()){
					hmap = new HashMap<String, Object>();
					
					hmap.put("pro_detail_no", rset.getString("pro_detail_no"));
					hmap.put("ranks", rset.getString("ranks"));
					hmap.put("product_no", rset.getString("product_no"));
					hmap.put("pro_name", rset.getString("pro_name"));
					hmap.put("category", rset.getString("category"));
					hmap.put("pro_date", rset.getDate("pro_date"));
					hmap.put("pro_deadline", rset.getDate("PRO_deadline"));
					hmap.put("pro_price", rset.getString("pro_price"));
					hmap.put("pro_count", rset.getString("pro_count"));
					hmap.put("pro_qty", rset.getString("pro_qty"));
					hmap.put("funding_type", rset.getString("funding_type"));
					hmap.put("record_date", rset.getString("record_date"));
					hmap.put("progress", rset.getString("progress"));
					hmap.put("member_no", rset.getInt("member_no"));
					
					list.add(hmap);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<HashMap<String, Object>> refundApprove(Connection con, int memberNo) {
	      ArrayList<HashMap<String, Object>> list = null;
	      HashMap<String, Object> hmap = null;
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String query = prop.getProperty("refundApprove");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, memberNo);
	         rset = pstmt.executeQuery();
	         
	         if(rset != null){
	            list = new ArrayList<HashMap<String, Object>>();
	            while(rset.next()){
	               hmap = new HashMap<String, Object>();
	               hmap.put("member_id", rset.getString("member_id"));
	               hmap.put("member_nick", rset.getString("member_nick"));
	               hmap.put("pay_no", rset.getInt("pay_no"));
	               hmap.put("pay_detail_no", rset.getInt("pay_detail_no"));
	               hmap.put("product_count", rset.getInt("product_count"));
	               hmap.put("pro_name", rset.getString("pro_name"));
	               hmap.put("product_type", rset.getString("product_type"));
	               hmap.put("funding_type", rset.getString("funding_type"));
	               hmap.put("pay_price", rset.getInt("pay_price"));
	               hmap.put("accept_no", rset.getString("accept_no"));
	               hmap.put("complete_no", rset.getString("complete_no"));
	               
	               list.add(hmap);
	               System.out.println(hmap);
	            }
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         close(rset);
	         close(pstmt);
	      }
	      
	      return list;
	   }
	
	public int recordCheck(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int recordDate = 0;
		
		String query = prop.getProperty("recordCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				recordDate = rset.getInt("CHECKDATE");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return recordDate;
	}


	public HashMap<String, Object> modifyProduct(Connection con, int detailNo) {
		HashMap<String, Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("modifyProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, detailNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("board_no", rset.getString("board_no"));
				hmap.put("board_content", rset.getString("board_content"));
				hmap.put("product_no", rset.getString("product_no"));
				hmap.put("pro_detail_no", rset.getString("pro_detail_no"));
				hmap.put("pro_name", rset.getString("pro_name"));
				hmap.put("pro_deadline", rset.getDate("pro_deadline"));
				hmap.put("pro_price", rset.getString("pro_price"));
				hmap.put("pro_count", rset.getString("pro_count"));
				hmap.put("product_type", rset.getString("product_type"));
				hmap.put("funding_type", rset.getString("funding_type"));
				hmap.put("category", rset.getString("category"));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return hmap;
	}

	//엑셀파일 DB에 인설트
	public int insertAttachFarmArea(Connection conn, String fileName) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		
		String query = prop.getProperty("insertAttachFarmArea");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, fileName);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	//엑셀파일 인설트 전 해당 파일이 목록에 있나 확인
	public int checkAttachFarmArea(Connection conn, String fileName) {
		int check = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("checkAttachFarmArea");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fileName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){		//한번이라도 실행하면 값이 있는거
				check = rset.getInt("FILE_NO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return check;
	}


	public int updateAttachFarmNo(Connection conn, int pro_Detail_No, int attachNo) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		
		String query = prop.getProperty("updateAttachFarmNo");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, pro_Detail_No);
			pstmt.setInt(2, attachNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}


	public int qtyCheck(Connection con, int memberNo, int proDetailNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("qtyCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, proDetailNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	public int insertThumbnail(Connection conn, int pro_Detail_No, String fileName) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		
		String query = prop.getProperty("insertThumbnail");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, fileName);
			pstmt.setInt(2, pro_Detail_No);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}


	public int updateThumbnail(Connection con, Product pro, String fileName) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateThumbnail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fileName);
			pstmt.setInt(2, pro.getPro_Detail_No());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}


	public int updateProduct(Connection con, Product pro) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pro.getProduct_Type());
			pstmt.setString(2, pro.getFunding_Type());
			pstmt.setString(3, pro.getCategory());
			pstmt.setInt(4, pro.getProduct_No());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}


	public int updateProDetail(Connection con, Product pro) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProDetail");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pro.getPro_Name());
			pstmt.setDate(2, pro.getDeadline());
			pstmt.setInt(3, pro.getPro_Price());
			pstmt.setInt(4, pro.getPro_Count());
			pstmt.setInt(5, pro.getPro_Detail_No());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}


	public int deleteProduct(Connection con, int productNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, productNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}


	public int getAppProductNo(Connection con, int proDetailNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int productNo = 0;
		
		String query = prop.getProperty("getAppProductNo");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, proDetailNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				productNo = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return productNo;
	}


	public int progChange(Connection con, String prog, int detailNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("progChange");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, prog);
			pstmt.setInt(2, detailNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	//먹거리 리스트 전부 가져오기
	public ArrayList<ProductList> selectFoodingListAll(Connection conn) {
		ArrayList<ProductList> list = new ArrayList<ProductList>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		String query = prop.getProperty("selectFoodingListAll");
 		
 		try {
 			pstmt = conn.prepareStatement(query);
 			
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				ProductList fund = new ProductList();
 				
 				fund.setPro_detail_no(rset.getInt("pro_detail_no"));
 				fund.setRanks(rset.getInt("ranks"));
 				fund.setPro_name(rset.getString("pro_name"));
 				fund.setPro_count(rset.getInt("count"));
 				fund.setPro_qty(rset.getInt("qty"));
 				fund.setPro_date(rset.getDate("pro_date"));
 				fund.setPro_price(rset.getInt("pro_price"));
 				fund.setOri_fileName(rset.getString("ori_filename"));
 				fund.setProgress(rset.getString("PROGRESS"));
 				fund.setSellerName(rset.getString("member_name"));
 				list.add(fund);
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


	public ArrayList<ProductList> selectFoodFourListAll(Connection conn, int num) {
		ArrayList<ProductList> list = new ArrayList<ProductList>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		String query = prop.getProperty("selectFoodFourListAll");
 		
 		try {
 			pstmt = conn.prepareStatement(query);
 			pstmt.setInt(1, (num-4));
 			pstmt.setInt(2, num);
 			
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				ProductList fund = new ProductList();
 				
 				fund.setPro_detail_no(rset.getInt("pro_detail_no"));
 				fund.setRanks(rset.getInt("ranks"));
 				fund.setPro_name(rset.getString("pro_name"));
 				fund.setPro_count(rset.getInt("count"));
 				fund.setPro_qty(rset.getInt("qty"));
 				fund.setPro_date(rset.getDate("pro_date"));
 				fund.setPro_price(rset.getInt("pro_price"));
 				fund.setOri_fileName(rset.getString("ori_filename"));
 				fund.setProgress(rset.getString("PROGRESS"));
 				fund.setSellerName(rset.getString("member_name"));
 				list.add(fund);
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

	public ArrayList<HashMap<String, Object>> getFundingApprove(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> h = null;
		String query = prop.getProperty("getFundingApprove");
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()){
					h = new HashMap<String, Object>();
					h.put("farm_name", rset.getString("farm_name"));
					h.put("farm_address", rset.getString("farm_address"));
					h.put("member_id", rset.getString("member_id"));
					h.put("pro_detail_no", rset.getInt("pro_detail_no"));
					h.put("pro_name", rset.getString("pro_name"));
					h.put("pro_count", rset.getInt("pro_count"));
					h.put("pro_price", rset.getInt("pro_price"));
					h.put("pro_date", rset.getDate("pro_date"));
					h.put("pro_deadline", rset.getDate("pro_deadline"));
					h.put("product_no", rset.getInt("product_no"));
					h.put("product_type", rset.getString("product_type"));
					h.put("funding_type", rset.getString("funding_type"));
					h.put("category", rset.getString("category"));
					h.put("board_content", rset.getString("board_content"));
					
					list.add(h);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return list;
	}


	public int productApprove(Connection con, int product_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("productApp");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, product_no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}


	public int proRecordUpdate(Connection con, int pro_detail_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("proRecordUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pro_detail_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}


	public int productReject(Connection con, int product_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("productReject");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, product_no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<HashMap<String, Object>> getProductApprove(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> h = null;
		String query = prop.getProperty("getProductApprove");
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()){
					h = new HashMap<String, Object>();
					h.put("farm_name", rset.getString("farm_name"));
					h.put("farm_address", rset.getString("farm_address"));
					h.put("member_id", rset.getString("member_id"));
					h.put("pro_detail_no", rset.getInt("pro_detail_no"));
					h.put("pro_name", rset.getString("pro_name"));
					h.put("pro_count", rset.getInt("pro_count"));
					h.put("pro_price", rset.getInt("pro_price"));
					h.put("pro_date", rset.getDate("pro_date"));
					h.put("pro_deadline", rset.getDate("pro_deadline"));
					h.put("product_no", rset.getInt("product_no"));
					h.put("product_type", rset.getString("product_type"));
					h.put("funding_type", rset.getString("funding_type"));
					h.put("category", rset.getString("category"));
					h.put("board_content", rset.getString("board_content"));
					
					list.add(h);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return list;
  }
	public ArrayList<ProductList> selectFoodFourListOne(Connection conn, int num, String catagory) {
		ArrayList<ProductList> list = new ArrayList<ProductList>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		String query = prop.getProperty("selectFoodFourListOne");
 		
 		try {
 			pstmt = conn.prepareStatement(query);
 			
 			pstmt.setString(1, catagory);
 			pstmt.setInt(2, (num-4));
 			pstmt.setInt(3, num);
 			
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				ProductList fund = new ProductList();
 				
 				fund.setPro_detail_no(rset.getInt("pro_detail_no"));
 				fund.setRanks(rset.getInt("ranks"));
 				fund.setPro_name(rset.getString("pro_name"));
 				fund.setPro_count(rset.getInt("count"));
 				fund.setPro_qty(rset.getInt("qty"));
 				fund.setPro_date(rset.getDate("pro_date"));
 				fund.setPro_price(rset.getInt("pro_price"));
 				fund.setOri_fileName(rset.getString("ori_filename"));
 				fund.setProgress(rset.getString("PROGRESS"));
 				fund.setSellerName(rset.getString("member_name"));
 				list.add(fund);
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


	public ArrayList<ProductList> selectFoodListOne(Connection conn, String catagory) {
		ArrayList<ProductList> list = new ArrayList<ProductList>();
 		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		
 		String query = prop.getProperty("selectFoodListOne");
 		
 		try {
 			pstmt = conn.prepareStatement(query);
 			
 			pstmt.setString(1, catagory);
 			
 			rset = pstmt.executeQuery();
 			
 			while(rset.next()){
 				ProductList fund = new ProductList();
 				
 				fund.setPro_detail_no(rset.getInt("pro_detail_no"));
 				fund.setRanks(rset.getInt("ranks"));
 				fund.setPro_name(rset.getString("pro_name"));
 				fund.setPro_count(rset.getInt("count"));
 				fund.setPro_qty(rset.getInt("qty"));
 				fund.setPro_date(rset.getDate("pro_date"));
 				fund.setPro_price(rset.getInt("pro_price"));
 				fund.setOri_fileName(rset.getString("ori_filename"));
 				fund.setProgress(rset.getString("PROGRESS"));
 				fund.setSellerName(rset.getString("member_name"));
 				list.add(fund);
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


	public int getMemberNo(Connection con, int pro_detail_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getMemberNo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pro_detail_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public HashMap<String, Object> getCategoryChart(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> h = null;
		
		String query = prop.getProperty("getCategoryTotal");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, "과수");
			pstmt.setInt(3, memberNo);
			pstmt.setInt(4, memberNo);
			pstmt.setString(5, "식량작물");
			pstmt.setInt(6, memberNo);
			pstmt.setInt(7, memberNo);
			pstmt.setString(8, "특용작물");
			pstmt.setInt(9, memberNo);
			pstmt.setInt(10, memberNo);
			pstmt.setString(11, "채소");
			pstmt.setInt(12, memberNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				h = new HashMap<String, Object>();
				h.put("fruit", rset.getInt("fruit"));
				h.put("food", rset.getInt("food"));
				h.put("spe", rset.getInt("spe"));
				h.put("vege", rset.getInt("vege"));
			}
			} catch (SQLException e) {
        e.printStackTrace();
      }finally{
        close(rset);
        close(pstmt);
      }	
			return h;
}

	public int sellerFundingUsedCheck(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("sellerFundingUsedCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}

		return result;

	}


	public HashMap<String, Object> getMonthTotal(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> h = null;
		
		String query = prop.getProperty("getMonthTotal");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, memberNo);
			pstmt.setInt(3, memberNo);
			pstmt.setInt(4, memberNo);
			pstmt.setInt(5, memberNo);
			pstmt.setInt(6, memberNo);
			pstmt.setInt(7, memberNo);
			pstmt.setInt(8, memberNo);
			pstmt.setInt(9, memberNo);
			pstmt.setInt(10, memberNo);
			pstmt.setInt(11, memberNo);
			pstmt.setInt(12, memberNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				h = new HashMap<String, Object>();
				h.put("jan", rset.getInt("jan"));
				h.put("feb", rset.getInt("feb"));
				h.put("mar", rset.getInt("mar"));
				h.put("apr", rset.getInt("apr"));
				h.put("may", rset.getInt("may"));
				h.put("jun", rset.getInt("jun"));
				h.put("jul", rset.getInt("jul"));
				h.put("aug", rset.getInt("aug"));
				h.put("sept", rset.getInt("sept"));
				h.put("oct", rset.getInt("oct"));
				h.put("nov", rset.getInt("nov"));
				h.put("dec", rset.getInt("dec"));
			}
			} catch (SQLException e) {
        e.printStackTrace();
      }finally{
        close(rset);
        close(pstmt);
      }	
			return h;
	}


	public HashMap<String, Object> getYearTotal(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> h = null;
		
		String query = prop.getProperty("getYearTotal");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, memberNo);
			pstmt.setInt(3, memberNo);
			pstmt.setInt(4, memberNo);
			pstmt.setInt(5, memberNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				h = new HashMap<String, Object>();
				h.put("foyear", rset.getInt("foyear"));
				h.put("thyear", rset.getInt("thyear"));
				h.put("twyear", rset.getInt("twyear"));
				h.put("onyear", rset.getInt("onyear"));
				h.put("toyear", rset.getInt("toyear"));
			}
			} catch (SQLException e) {
				e.printStackTrace();
      }finally{
        close(rset);
        close(pstmt);
      }	
			return h;
	}


	public ArrayList<HashMap<String, Object>> getCompareMonth(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> h = null;
		ArrayList<HashMap<String, Object>> list = null;
		String query = prop.getProperty("getCompareMonth");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, memberNo);
			pstmt.setInt(3, memberNo);
			pstmt.setInt(4, memberNo);
			pstmt.setInt(5, memberNo);
			pstmt.setInt(6, memberNo);
			pstmt.setInt(7, memberNo);
			pstmt.setInt(8, memberNo);
			pstmt.setInt(9, memberNo);
			pstmt.setInt(10, memberNo);
			pstmt.setInt(11, memberNo);
			pstmt.setInt(12, memberNo);
			
			rset = pstmt.executeQuery();
			if(rset != null){
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()){
					h = new HashMap<String, Object>();
					h.put("jan", rset.getInt("jan"));
					h.put("feb", rset.getInt("feb"));
					h.put("mar", rset.getInt("mar"));
					h.put("apr", rset.getInt("apr"));
					h.put("may", rset.getInt("may"));
					h.put("jun", rset.getInt("jun"));
					h.put("jul", rset.getInt("jul"));
					h.put("aug", rset.getInt("aug"));
					h.put("sep", rset.getInt("sept"));
					h.put("oct", rset.getInt("oct"));
					h.put("nov", rset.getInt("nov"));
					h.put("dec", rset.getInt("dec"));
					list.add(h);
				}
			}
			} catch (SQLException e) {
				e.printStackTrace();
      }finally{
        close(rset);
        close(pstmt);
      }	
			return list;
	}


	public HashMap<String, Object> getAdminCategoryChart(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> h = null;
		
		String query = prop.getProperty("getAdminCategoryTotal");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "과수");
			pstmt.setString(2, "식량작물");
			pstmt.setString(3, "특용작물");
			pstmt.setString(4, "채소");
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				h = new HashMap<String, Object>();
				h.put("fruit", rset.getInt("fruit"));
				h.put("food", rset.getInt("food"));
				h.put("spe", rset.getInt("spe"));
				h.put("vege", rset.getInt("vege"));
			}
			} catch (SQLException e) {
        e.printStackTrace();
      }finally{
        close(rset);
        close(pstmt);
      }	
			return h;
	}


	public HashMap<String, Object> getAdminMonthTotal(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> h = null;
		
		String query = prop.getProperty("getAdminMonthTotal");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				h = new HashMap<String, Object>();
				h.put("jan", rset.getInt("jan"));
				h.put("feb", rset.getInt("feb"));
				h.put("mar", rset.getInt("mar"));
				h.put("apr", rset.getInt("apr"));
				h.put("may", rset.getInt("may"));
				h.put("jun", rset.getInt("jun"));
				h.put("jul", rset.getInt("jul"));
				h.put("aug", rset.getInt("aug"));
				h.put("sep", rset.getInt("sept"));
				h.put("oct", rset.getInt("oct"));
				h.put("nov", rset.getInt("nov"));
				h.put("dec", rset.getInt("dec"));
			}
			} catch (SQLException e) {
        e.printStackTrace();
      }finally{
        close(rset);
        close(pstmt);
      }	
			return h;
	}


	public HashMap<String, Object> getAdminYearTotal(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> h = null;
		
		String query = prop.getProperty("getAdminYearTotal");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				h = new HashMap<String, Object>();
				h.put("foyear", rset.getInt("foyear"));
				h.put("thyear", rset.getInt("thyear"));
				h.put("twyear", rset.getInt("twyear"));
				h.put("onyear", rset.getInt("onyear"));
				h.put("toyear", rset.getInt("toyear"));
			}
			} catch (SQLException e) {
				e.printStackTrace();
      }finally{
        close(rset);
        close(pstmt);
      }	
			return h;
	}
	
}