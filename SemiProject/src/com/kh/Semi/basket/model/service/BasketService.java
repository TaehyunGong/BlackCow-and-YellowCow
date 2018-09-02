package com.kh.Semi.basket.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.Semi.basket.model.dao.BasketDao;
import com.kh.Semi.basket.model.vo.Basket;
import static com.kh.Semi.common.JDBCTemplate.*;
import static com.kh.Semi.common.JDBCTemplate.close;
import static com.kh.Semi.common.JDBCTemplate.commit;
import static com.kh.Semi.common.JDBCTemplate.rollback;
public class BasketService {

	public ArrayList<Basket> selectList(int userNo) {
		// TODO Auto-generated method stub
		System.out.println("바스켓 서비스 도착");
		Connection con = getConnection();
		System.out.println(userNo);
		
		ArrayList<Basket> list = new BasketDao().selectList(con , userNo);
		
		close(con);
		return list;
	}

	public ArrayList<Basket> basketDelete(int cart , int userNo) {
		// TODO Auto-generated method stub
		System.out.println("바스켓 딜리트 서비스 도착");
		Connection con = getConnection();
		ArrayList<Basket> list = null;
		int result = 0;
		System.out.println("바스켓 번호 다오" + cart);
		
		result  = new BasketDao().basketDelete(con,cart);
		System.out.println("삭제 : " + result);
		
		if(result > 0){
			list = new BasketDao().selectList(con , userNo);
			commit(con);
			
		}else{
			rollback(con);
		}
		
		close(con);
		
		return list;
	}

	public int insertPdBasket(Basket bk) {
		
		Connection con = getConnection();
		
		
		int result = new BasketDao().insertPdBasket(con, bk);
		
		if(result > 0){
			
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		
		return result;
	}

	public int deletePdBasket(Basket bk) {
		
		Connection con = getConnection();
		
		
		int result = new BasketDao().deletePdBasket(con, bk);
		
		if(result > 0){
			
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		
		return result;
	}

	public ArrayList<Basket> selectPdBasketList(int member_No) {
		
		Connection con = getConnection();
		
		
		ArrayList<Basket> bklist = new BasketDao().selectPdBasketList(con, member_No);
		
		close(con);
		
		
		return bklist;
	}

}
