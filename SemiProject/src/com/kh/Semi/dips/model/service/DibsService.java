package com.kh.Semi.dips.model.service;

import static com.kh.Semi.common.JDBCTemplate.close;
import static com.kh.Semi.common.JDBCTemplate.commit;
import static com.kh.Semi.common.JDBCTemplate.getConnection;
import static com.kh.Semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.Semi.basket.model.vo.Basket;
import com.kh.Semi.dips.model.dao.DibsDao;
import com.kh.Semi.dips.model.vo.Dibs;

public class DibsService {

	public int insertDibs(Dibs dib) {
		int result = 0;
		Connection con = getConnection();

		ArrayList<Dibs> list = new DibsDao().selectDibsOne(con, dib);
		
		if(list.size() > 0){	//이미 존제하는 찜을 또 찜했을때 저장x
			return 0;
		}
		
		result = new DibsDao().insertDibs(con, dib);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int deleteDibs(Dibs dib) {
		int result = 0;
		Connection con = getConnection();
		
		result = new DibsDao().deleteDibs(con, dib);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public ArrayList<Dibs> selectDibsList(int member_No) {
		Connection con = getConnection();

		ArrayList<Dibs> list = new DibsDao().selectDibsMemOne(con, member_No);
		
		close(con);
		return list;
	}

	public ArrayList<Dibs> selectList(int userNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		System.out.println("-----찜:"+userNo);
		
		ArrayList<Dibs> list = new DibsDao().selectList(con, userNo);
		
	
		
		close(con);
		
		return list;
	}

	public ArrayList<Dibs> deleteDibsList(int num , int userNo) {
		// TODO Auto-generated method stub
		
		Connection con = getConnection();
		ArrayList<Dibs> list = null;
		System.out.println("딥 서비스 카트번호"+num);
		System.out.println("딥 서비스 유저번호"+userNo);
		int result = new DibsDao().deleteDibsList(con, num);
		
		if(result > 0){
			commit(con);
			System.out.println("------2번 가는 찜리스트");
			list = new DibsDao().selectList(con, userNo);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return list;
	}

	public ArrayList<Dibs> selectListO(int userNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		System.out.println("-----찜:"+userNo);
		
		ArrayList<Dibs> list = new DibsDao().selectListO(con, userNo);
		
	
		
		close(con);
		
		return list;
	}

}
