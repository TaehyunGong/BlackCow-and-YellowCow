package com.kh.Semi.member.model.service;

import static com.kh.Semi.common.JDBCTemplate.close;
import static com.kh.Semi.common.JDBCTemplate.getConnection;
import static com.kh.Semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.Semi.member.model.dao.MemberDao;
import com.kh.Semi.member.model.vo.Member;

public class MemberService {


	public Member memberLogin(String userId, String userPwd) {
		Member user = null;
		Connection conn = getConnection();
		
		user = new MemberDao().memberLogin(userId, userPwd, conn);
		
		close(conn);
		
		return user;
	}

	public int memberJoin(Member member) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MemberDao().memberJoin(member, conn);
		
		if(result != 0)
			commit(conn);
		else
			rollback(conn);
			
		close(conn);
		return result;
	}

	//SNS 회원가입
	public int memberSNSJoin(Member member) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MemberDao().memberSNSJoin(member, conn);
		
		if(result != 0)
			commit(conn);
		else
			rollback(conn);
			
		close(conn);
		return result;
	}
	

	// 회원정보수정
	public int editInfo(Member member) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MemberDao().editInfo(member, conn);
		
		if(result != 0)
			commit(conn);
		else
			rollback(conn);
			
		close(conn);
		return result;
	}
	
	public ArrayList<Member> selectAllMember() {
		Connection con = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectAllMember(con);
		
		close(con);
		
		return list;
	}

	public int idCheck(String userId) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new MemberDao().idCheck(userId, conn);
		
		return result;
	}

	public Member memberSNSLogin(String SNS_ID) {
		Member user = null;
		Connection conn = getConnection();
		
		user = new MemberDao().memberSNSLogin(SNS_ID, conn);
		
		close(conn);
		
		return user;
	}
	
	public int farmerUpdate(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().farmerUpdate(con, m);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		return result;
	}

	public Member checkEmail(String email) {
		Connection con = getConnection();
		Member m = new Member();
		m = new MemberDao().checkEmail(con, email);
		close(con);
		return m;
	}

	public Member checkEmailMember(String userEmail) {
		Connection con = getConnection();
		Member m = new Member();
		m = new MemberDao().checkEmailMember(con, userEmail);
		close(con);
		return m;
	}

	
	public int sellerRetire(int memberNo, String password) {
		Connection con = getConnection();
		
		int result = new MemberDao().sellerRetire(con, memberNo, password);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public String passCheck(int memberNo, String password) {
		Connection con = getConnection();
		
		String password2 = new MemberDao().passCheck(con, memberNo, password);
		
		close(con);
		
		return password2;
	}

	public ArrayList<Member> farmerApprove() {
		Connection con = getConnection();
		
		ArrayList<Member> list = new MemberDao().farmerApprove(con);
		
		close(con);
		
		return list;
	}

	public int CheckFarmName(String farmName) {
		
		Connection con = getConnection();
		
		int result = new MemberDao().CheckFarmName(con, farmName);
		
		
		close(con);
		
		
		return result;
	}

	public int updateFarmerMember(String name, String address, String size, int mnum) {
		
		Connection con = getConnection();
		
		
		int result = new MemberDao().updateFarmerMember(con, name, address, size, mnum);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		
		close(con);
		
		
		return result;
	}

	public int goFarmer(Member m) {
		Connection con = getConnection();
		int result = new MemberDao().goFarmer(con, m);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int rejectFarmer(int memberNo) {
		Connection con = getConnection();
		int result = new MemberDao().rejectFarmer(con, memberNo);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public String deleteCheckMember(int userNo, String userPwd) {
		Connection con = getConnection();
		
		String userPwd1 = new MemberDao().deleteCheckMember(con, userNo, userPwd);
		
		close(con);
		
		return userPwd1;
	}

	public int deleteStatusMemberUpdate(int memberNo) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteStatusMemberUpdate(con, memberNo);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int userInfoUpdate(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().userInfoUpdate(con, m);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	
}
