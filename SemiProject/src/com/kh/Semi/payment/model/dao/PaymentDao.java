package com.kh.Semi.payment.model.dao;

import java.sql.Statement;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.Semi.basket.model.vo.Basket;
import com.kh.Semi.payment.model.vo.Payment;
import com.kh.Semi.payment.model.vo.PaymentProduct;
import com.kh.Semi.payment.model.vo.Refund;

import static com.kh.Semi.common.JDBCTemplate.*;

public class PaymentDao {

	
	private Properties prop = new Properties();
	
	public PaymentDao()
	{
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Payment> selectOList(Connection con, int i) {
		// TODO Auto-generated method stub
		System.out.println("상시 다오도착");
		ArrayList<Payment> list = null;
	
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("selectList2");
		System.out.println("상시 쿼리지낫냐");
		System.out.println(query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Payment>();
			
			while(rset.next()){
				
				
				Payment p = new Payment();
				/*p.setPay_detail_no(rset.getInt("pay_detail_no"));*/
				p.setPay_num(rset.getInt("rownum"));
				p.setPro_name(rset.getString("pro_name"));
				p.setOri_fileName(rset.getString("ori_fileName"));			
				p.setPay_date(rset.getDate("pay_date"));
				p.setPro_price(rset.getInt("pro_price"));
				p.setPay_type(rset.getString("pay_type"));
				p.setWaybill(rset.getString("waybill"));
				p.setPay_detail_no(rset.getInt("pay_detail_no"));
				p.setRefund_prog(rset.getString("refund_prog"));
				p.setProgress(rset.getString("progress"));
				p.setSellerNo(rset.getInt("member_no"));
				p.setMember_nick(rset.getString("member_nick"));
				list.add(p);
				
				
				
			}
			System.out.println("상시다오"+list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Payment> selectList(Connection con, int i) {
		// TODO Auto-generated method stub
		System.out.println("다오도착");
		ArrayList<Payment> list = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("selectList1");
		System.out.println(" 쿼리지낫냐");
		
		System.out.println(query);
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
	
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Payment>();
			System.out.println("여긴 3번");
			while(rset.next()){
				
				Payment p = new Payment();
			
				p.setPay_num(rset.getInt("rownum"));
				p.setPro_name(rset.getString("pro_name"));
				p.setOri_fileName(rset.getString("ori_fileName"));			
				p.setPay_date(rset.getDate("pay_date"));
				p.setPro_price(rset.getInt("pro_price"));
				p.setPay_type(rset.getString("pay_type"));
				p.setWaybill(rset.getString("waybill"));
				p.setPay_detail_no(rset.getInt("pay_detail_no"));
				p.setRefund_prog(rset.getString("refund_prog"));
				p.setProgress(rset.getString("progress"));
				p.setSellerNo(rset.getInt("member_no"));
				p.setMember_nick(rset.getString("member_nick"));
				
				list.add(p);
				
				
				
			}
			System.out.println("다오"+list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int updateReason(Connection con, int writer, String reason) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateReason");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reason);
			pstmt.setInt(2, writer);
			
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
	//요청번호
	//환불상태
	
	public String selectSellerName(Connection con, int pro_detail_no) {
		String nick = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectSellerName");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pro_detail_no);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				nick = rset.getString("MEMBER_ID");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		
		return nick;
	}

	public PaymentProduct selectPaymentProduct(Connection con, int pro_detail_no) {
		PaymentProduct pd = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPaymentProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pro_detail_no);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				pd = new PaymentProduct();
				pd.setPro_detail_no(rset.getInt("PRO_DETAIL_NO"));
				pd.setPro_name(rset.getString("PRO_NAME"));
				pd.setPro_date(rset.getDate("PRO_DATE"));
				pd.setPro_deadLine(rset.getDate("PRO_DEADLINE"));
				pd.setPro_price(rset.getInt("PRO_PRICE"));
				pd.setOri_fileName(rset.getString("ORI_FILENAME"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return pd;
	}

	public int insertPayment(int pro_detail_no, int amount, int user_no, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("insertPayment");
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, pro_detail_no);
			pstmt.setInt(2, amount);
			pstmt.setInt(3, user_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int selectSqeun(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("selectSqeun");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	public int insertPaymentRecord(Connection conn, int squn, String[] imps) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("insertPaymentRecord");
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, squn);
			pstmt.setString(2, imps[0]);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int updatePaymentProduct(int pro_detail_no, int amount, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("updatePaymentProduct");
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, amount);
			pstmt.setInt(2, pro_detail_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int insertDelivery(Connection conn, int payNo, int user_no, String address) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("insertDelivery");
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, payNo);
			pstmt.setInt(2, user_no);
			pstmt.setString(3, address);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public String[] selectAddress(Connection con, int i2, String[] addr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectAddress");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, i2);
			
			rset = pstmt.executeQuery();
			
			for(int i=1; rset.next(); i++){
				if(rset.getString(2).equals("AD1")){
					addr[1] = rset.getString(1);
				}else{
					addr[2] = rset.getString(1);
				}
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return addr;
	}

	public String selectMemberAddress(Connection con, int i) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String addr = null;
		String query = prop.getProperty("selectMemberAddress");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, i);
			
			rset = pstmt.executeQuery();

			if(rset.next())
				addr = rset.getString(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return addr;
	}

	public int updateAddress(Connection conn, String num, String address, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("updateAddress");
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, address);
			pstmt.setInt(2, user_no);
			pstmt.setString(3, "AD"+num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int updateMemberAddress(Connection conn, String address, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("updateMemberAddress");
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, address);
			pstmt.setInt(2, user_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int insertAddress(Connection conn, String num, String address, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("insertAddress");
		
		String ADD = "AD1";
		if(num.equals("1")) ADD = "AD1";
		else ADD = "AD2";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, user_no);
			pstmt.setString(2, address);
			pstmt.setString(3, ADD);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<HashMap<String, Object>> getAllBuyer(Connection con, int memberNo) {
		ArrayList<HashMap<String, Object>> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> h = null;
		System.out.println("memberNo");
		String query = prop.getProperty("getAllBuyer");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			if(rset != null){
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()){
					h = new HashMap<String, Object>();
					h.put("pay_no", rset.getInt("pay_no"));
					h.put("pay_detail_no", rset.getInt("pay_detail_no"));
					h.put("accept_no", rset.getString("accept_no"));
					h.put("pro_name", rset.getString("pro_name"));
					h.put("product_type", rset.getString("product_type"));
					h.put("funding_type", rset.getString("funding_type"));
					h.put("member_id", rset.getString("member_id"));
					h.put("member_name", rset.getString("member_name"));
					h.put("progress", rset.getString("progress"));
					h.put("pay_type", rset.getString("pay_type"));
					h.put("pay_date", rset.getDate("pay_date"));
					h.put("pay_level", rset.getString("pay_level"));
					h.put("refund_prog", rset.getString("refund_prog"));
					
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
  
	public Basket selectBascketBuy(Connection con, String basketNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Basket basket = null;
		String query = prop.getProperty("selectBascketBuy");
		
		try {
			int num = Integer.parseInt(basketNo);
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();

			if(rset.next()){
				basket = new Basket();
				
				basket.setCart_no(rset.getInt("CART_NO"));
				basket.setPro_detail_no(rset.getInt("PRO_DETAIL_NO"));
				basket.setPrice(rset.getInt("PRO_PRICE"));
				basket.setPro_title(rset.getString("PRO_NAME"));
				basket.setProduct_count(rset.getInt("PRODUCT_COUNT"));
				basket.setOri_filename(rset.getString("ORI_FILENAME"));
				basket.setMember_no(rset.getInt("MEMBER_NO"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block	
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return basket;
	}

	public ArrayList<HashMap<String, Object>> selectWaybill(Connection con, int memberNo) {
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> h = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectWaybill");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()){
					h = new HashMap<String, Object>();
					h.put("delivery_no", rset.getInt("delivery_no"));
					h.put("pro_name", rset.getString("pro_name"));
					h.put("product_count", rset.getInt("product_count"));
					h.put("pay_date", rset.getDate("pay_date"));
					h.put("member_id", rset.getString("member_id"));
					h.put("member_name", rset.getString("member_name"));
					h.put("pay_address", rset.getString("pay_address"));
					h.put("waybill", rset.getString("waybill"));
					
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
	public int updateRefundRecord(Connection conn, Refund rf) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("updateRefundRecord");
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, rf.getPayment_Record_seq());			//PAYMENT_RECORD 의 시퀀스
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int updateRefundQTY(Connection con, Refund rf) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("updateRefundQTY");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, rf.getPayNo());
			pstmt.setInt(2, rf.getPayNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int updateWaybill(Connection con, String deliNo, String waybill) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateWaybill");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, waybill);
			pstmt.setString(2, deliNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
      			close(pstmt);
		}
		return result;
	}

	public int deleteBasket(Connection con, int cart_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("deleteBasket");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, cart_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
		}
		return result;
	}

	public Basket selectFoodtBuy(Connection con, String pro_detail_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Basket basket = null;
		String query = prop.getProperty("selectFoodtBuy");
		try {
			int num = Integer.parseInt(pro_detail_no);
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();

			if(rset.next()){
				basket = new Basket();
				
				basket.setPro_detail_no(rset.getInt("PRO_DETAIL_NO"));
				basket.setPrice(rset.getInt("PRO_PRICE"));
				basket.setPro_title(rset.getString("PRO_NAME"));
				basket.setProduct_count(rset.getInt("PRO_COUNT"));
				basket.setOri_filename(rset.getString("ORI_FILENAME"));
				basket.setMember_no(rset.getInt("MEMBER_NO"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block	
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return basket;
	}

	public int getMemberNo(Connection con, String deliNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getMemberNoFromDeli");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(deliNo));
			
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

	//proDetailNo로 해당 상품 남은 수량 가져오기
	public int seelectCheckQTY(Connection conn, int pro_datail_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("seelectCheckQTY");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pro_datail_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt("PRO_QTY");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

}
