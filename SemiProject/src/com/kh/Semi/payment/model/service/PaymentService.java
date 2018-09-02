package com.kh.Semi.payment.model.service;

import static com.kh.Semi.common.JDBCTemplate.close;
import static com.kh.Semi.common.JDBCTemplate.commit;
import static com.kh.Semi.common.JDBCTemplate.getConnection;
import static com.kh.Semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.Semi.basket.model.vo.Basket;
import com.kh.Semi.facing.model.dao.FacingDao;
import com.kh.Semi.funding.model.dao.FundingDao;
import com.kh.Semi.funding.model.service.cellClass;
import com.kh.Semi.payment.model.dao.PaymentDao;
import com.kh.Semi.payment.model.vo.Payment;
import com.kh.Semi.payment.model.vo.PaymentProduct;
import com.kh.Semi.payment.model.vo.Refund;
public class PaymentService {

	public ArrayList<Payment> selectList(int i) {

		// TODO Auto-generated method stub
		System.out.println("서비스 도착");
		Connection con = getConnection();
		System.out.println(i);

		ArrayList<Payment> list = new PaymentDao().selectList(con ,i);
		
		close(con);
		
		return list;
	}
	
	public ArrayList<Payment> selectOList(int i) {
		// TODO Auto-generated method stub
		
		System.out.println("상시 서비스 도착");
		Connection con = getConnection();
		System.out.println(i);
		ArrayList<Payment> list = new PaymentDao().selectOList(con ,i);
		
		close(con);
		
		return list;
	}


	public int returnReason(int writer, String reason) {
		Connection con = getConnection();
		
		ArrayList<Payment> list = null;
		
		int result = new PaymentDao().updateReason(con, writer, reason);
		
		if(result > 0){
			commit(con);
			list = new PaymentDao().selectList(con, writer);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public String selectSellerName(int pro_detail_no) {
		
		String nick ="";
		Connection con = getConnection();
		
		nick = new PaymentDao().selectSellerName(con, pro_detail_no);
		
		close(con);
		
		return nick;
	}

	public PaymentProduct selectPaymentProduct(int pro_detail_no) {

		PaymentProduct pd = null;
		Connection con = getConnection();
		
		pd = new PaymentDao().selectPaymentProduct(con, pro_detail_no);
		
		close(con);
		
		return pd;
	}

	public int insertPayment(int pro_detail_no, int amount, int user_no, String[] imps, String address) {
		int result = 0;
		int payNo = 0;
		Connection conn = getConnection();
		
		/*
		 	imps0 : imp_474017742053	--결제번호
			imps1 : 배추배추양배추			--싱픔이름
			imps2 : noName				--구매유저 이름
			imps3 : 300  				--가격
		 */
		
		result = new PaymentDao().insertPayment(pro_detail_no, amount, user_no, conn);	//PAYMENT 값 넣기
		if(result != 0){
			result = new PaymentDao().updatePaymentProduct(pro_detail_no, amount, conn);//상품 구매량 더하기
		}else{
			rollback(conn);
			return result;
		}
		if(result != 0){
			if(result !=0 ){
				payNo = new PaymentDao().selectSqeun(conn);					//INSERT한 PAYMENT 시퀀스 가져오기
				if(new PaymentDao().insertDelivery(conn, payNo, user_no, address) == 0){	//DELIVERY에 값넣기
					rollback(conn);
					return result;
				}
				result = new PaymentDao().insertPaymentRecord(conn, payNo ,imps);//PAYMENT_RECORD값 넣기
				if(result == 0){
					rollback(conn);
				}else{
					commit(conn);		//결제 성공시
				}
			}else{
				rollback(conn);
			}
		}else{
			rollback(conn);
		}
			
		close(conn);
		return payNo;
	}

	//결제시 주소를 가져온다.
	public String[] selectAddress(int i) {
		String[] addr= new String[3];
		Connection con = getConnection();
		
		addr[0] = new PaymentDao().selectMemberAddress(con, i);
		addr = new PaymentDao().selectAddress(con, i, addr);
		
		close(con);
		
		return addr;
	}

	//주소 변경
	public int updateAddress(String num, String address, int user_no) {
		int result = 0;
		Connection con = getConnection();

		if(num.equals("0")){
			result = new PaymentDao().updateMemberAddress(con, address, user_no);
		}else{
			result = new PaymentDao().updateAddress(con, num, address, user_no);
		}
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int insertAddress(String num, String address, int user_no) {
		int result = 0;
		Connection con = getConnection();

		if(num.equals("0")){	//멤버의 주소는 기본이라 없을경우 추가를 아예 못해준다.
			result = 0;
		}else{
			result = new PaymentDao().insertAddress(con, num, address, user_no);
		}
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public ArrayList<HashMap<String, Object>> getAllBuyer(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new PaymentDao().getAllBuyer(con, memberNo);
		close(con);
		return list;
	}
	
	public ArrayList<Basket> selectBascketBuy(String[] basketList) {

		ArrayList<Basket> list = new ArrayList<Basket>();
		Connection con = getConnection();
		
		for(String baskets : basketList){
			Basket basket = new PaymentDao().selectBascketBuy(con, baskets);
			if(basket == null){		//하나라도 못가져오면 바로 널 반환
				return null;
			}
			list.add(basket);
		}
		return list;
	}
	//장바구니 결제시 DB insert
	public int insertBasketPayment(ArrayList<Basket> list, String addr, String[] imps, int member_no) {
		int result = 0;
		Connection conn = getConnection();
			
			for(Basket b : list){
				result = new PaymentDao().insertPayment(b.getPro_detail_no(), b.getProduct_count(), member_no, conn);	//PAYMENT 값 넣기
				if(result != 0){
					int checkQTY = new PaymentDao().seelectCheckQTY(conn, b.getPro_detail_no());	
					if(checkQTY > b.getProduct_count()){		//구매할 갯수가 남은 갯수보다 많다면 구매 취소
						rollback(conn);
						return -1;
					}
					result = new PaymentDao().updatePaymentProduct(b.getPro_detail_no(), b.getProduct_count(), conn);//상품 구매량 더하기
				}else{
					rollback(conn);
					return result;
				}
				if(result != 0){
					if(result !=0 ){
						result = new PaymentDao().selectSqeun(conn);					//INSERT한 PAYMENT 시퀀스 가져오기
						if(new PaymentDao().insertDelivery(conn, result, member_no, addr) == 0){	//DELIVERY에 값넣기
							rollback(conn);
							return 0;
						}
						result = new PaymentDao().insertPaymentRecord(conn, result ,imps);//PAYMENT_RECORD값 넣기
						if(result == 0){
							rollback(conn);
						}else{
							if(b.getCart_no() != 0)					//0일경우는 먹거리 1개 구매
								result = new PaymentDao().deleteBasket(conn, b.getCart_no());	//해당 장바구니 삭제
							if(result != 0){
								commit(conn);		//결제 성공시
							}else{
								rollback(conn);
							}
						}
					}else{
						rollback(conn);
					}
				}else{
					rollback(conn);
				}
				
			}
		
		close(conn);
		return result;
	}


	public ArrayList<HashMap<String, Object>> selectWaybill(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new PaymentDao().selectWaybill(con, memberNo);
		
		close(con);

		return list;
  }
	//환불 성공시 REFUND로 수정
	public int updateRefundRecord(Refund rf, String path) {
		int result = 0;
		Connection con = getConnection();

		result = new PaymentDao().updateRefundRecord(con, rf);		//PAYMENT_RECORD에서 REFUND로 수정해줌
		
		if(result > 0){
			if(rf.getProductType().equals("F")){		//펀딩일시
				rf.setAmount(new cellClass().resetCell(rf.getUser_nick()+rf.getPayNo(), rf.getSeller_Id(), path));	//둘다 넘겨준다. 밭 면적 되돌리기
				result = new PaymentDao().updateRefundQTY(con, rf); 									//QTY 더해줌
				if(result == 0){rollback(con); return 0;}
			}else{										//먹거리일시
				
				result = new PaymentDao().updateRefundQTY(con, rf); 									//QTY 더해줌
				if(result == 0){rollback(con); return 0;}
			}
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int updateWaybill(String deliNo, String waybill, int sellNo) {
		Connection con = getConnection();
		
		int result = new PaymentDao().updateWaybill(con, deliNo, waybill);
		int memberNo = new PaymentDao().getMemberNo(con, deliNo);
		int facingResult = new FacingDao().insertAlertToUser(con, sellNo, memberNo, "상품 배송이 시작되었습니다.");
		
		if(result > 0 && facingResult > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		return result;
	}

	public ArrayList<Basket> selectFoodtBuy(String pro_detail_no) {

		ArrayList<Basket> list = new ArrayList<Basket>();
		Connection con = getConnection();
		
		Basket basket = new PaymentDao().selectFoodtBuy(con, pro_detail_no);
		if(basket == null)
			list = null;
		else
			list.add(basket);
		
		return list;
	}


}
