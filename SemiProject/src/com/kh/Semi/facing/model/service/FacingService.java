package com.kh.Semi.facing.model.service;

import static com.kh.Semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.Semi.board.model.dao.BoardDao;
import com.kh.Semi.board.model.vo.Board;
import com.kh.Semi.facing.model.dao.FacingDao;
import com.kh.Semi.facing.model.vo.Facing;
import com.kh.Semi.member.model.vo.Member;
import com.kh.Semi.facing.model.dao.FacingDao;
import com.kh.Semi.facing.model.vo.Facing;



public class FacingService {

	//쪽지 전체 조회 메소드
	public ArrayList<Facing> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Facing> list = new FacingDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;

}

	public int getListCountFacing() {
		Connection con = getConnection();
		
		int listCount = new FacingDao().getListCountFacing(con);
		
		close(con);
		
		return listCount;
	}

	public Facing selectOne(int num) {
		Connection con = getConnection();
		Facing f = null;
		
		int result = new FacingDao().updateReception(con, num);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		f = new FacingDao().selectOne(con, num);
		
		close(con);
		
		return f;
	}

	public int getSendListCountFacing() {
		Connection con = getConnection();
		
		int listCount = new FacingDao().getSendListCountFacing(con);
		
		close(con);
		
		return listCount;
	}


	public ArrayList<Facing> SendSelectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Facing> list = new FacingDao().SendSelectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public Facing sendSelectOne(int num) {
		Connection con = getConnection();
		
		Facing f = new FacingDao().sendSelectOne(con, num);
		
		close(con);
		
		return f;
	}

	public int insertFacing(Facing f) {
		Connection con = getConnection();
		
		int result = new FacingDao().insertFacing(con, f);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Member> selectAllMemberList() {
		Connection con = getConnection();
		
		ArrayList<Member> list = new FacingDao().selectAllMemberList(con);
		
		close(con);
		return list;
	}

	public int sendFacing(Facing f, int receiverNo1) {
		Connection con = getConnection();
		
		int result = new FacingDao().sendFacing(con, f, receiverNo1);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteFacing(int num) {
		Connection con = getConnection();
		
		int result = new FacingDao().deleteFacing(con, num);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Facing updateInfoFacing(int num) {
		Connection con = getConnection();
		
		Facing f = new FacingDao().updateInfoFacing(con, num);
		
		close(con);
		
		return f;
	}

	public int deleteSendFacing(int num) {
		Connection con = getConnection();
		
		int result = new FacingDao().deleteSendFacing(con, num);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Facing> sellerSellectFacing(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<Facing> list = new FacingDao().sellerSellectFacing(con, memberNo);
		
		close(con);
		
		return list;
	}
	
	
	
	}
	
