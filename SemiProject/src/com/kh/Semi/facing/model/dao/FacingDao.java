package com.kh.Semi.facing.model.dao;

import static com.kh.Semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.Semi.facing.model.vo.Facing;
import com.kh.Semi.member.model.vo.Member;
import com.kh.Semi.board.model.vo.Board;
import com.kh.Semi.facing.model.dao.FacingDao;

public class FacingDao {
	private Properties prop = new Properties();
	
	public FacingDao(){
		String fileName = FacingDao.class.getResource("/sql/Facing/Facing-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Facing> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Facing> list = null;
		//페이징처리 전
		/*Statement stmt = null;*/
		//페이징처리 후
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			//페이징처리 전
			/*stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);*/
			
			//페이징처리 후
			pstmt = con.prepareStatement(query);
			
			//조회 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Facing>();
			
			while(rset.next()){
				Facing f = new Facing();
				
				f.setFacing_No(rset.getInt("facing_No"));
				f.setFacing_Title(rset.getString("facing_Title"));
				f.setFacing_Content(rset.getString("facing_Content"));
				f.setWriter(rset.getString("member_nick"));
				f.setReceiver(rset.getString("receiver"));
				f.setWrite_Date(rset.getDate("write_Date"));
				f.setStatus(rset.getString("status"));
				f.setReception_Check(rset.getString("reception_Check"));
				
				list.add(f);
			}
			
			System.out.println("DAO LIST : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public int getListCountFacing(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount =0;
		
		String query = prop.getProperty("listCountFacing");
		try{
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				listCount = rset.getInt(1);
				
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public int updateReception(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateReception");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Facing selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Facing f= null;

		String query = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				f = new Facing();
				
				f.setFacing_No(rset.getInt("facing_No"));
				f.setFacing_Title(rset.getString("facing_Title"));
				f.setFacing_Content(rset.getString("facing_Content"));
				f.setWriter(rset.getString("MEMBER_NICK"));
				f.setReceiver(rset.getString("receiver"));
				f.setWrite_Date(rset.getDate("write_Date"));
				f.setStatus(rset.getString("status"));
				f.setReception_Check(rset.getString("reception_Check"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return f;
	}

	public int getSendListCountFacing(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount =0;
		
		String query = prop.getProperty("SendListCountFacing");
		try{
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				listCount = rset.getInt(1);
				
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<Facing> SendSelectList(Connection con, int currentPage, int limit) {
		ArrayList<Facing> list = null;
		//페이징처리 전
		/*Statement stmt = null;*/
		//페이징처리 후
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("SendSelectList");
		
		try {
			//페이징처리 전
			/*stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);*/
			
			//페이징처리 후
			pstmt = con.prepareStatement(query);
			
			//조회 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Facing>();
			
			while(rset.next()){
				Facing f = new Facing();
				
				f.setFacing_No(rset.getInt("facing_No"));
				f.setFacing_Title(rset.getString("facing_Title"));
				f.setFacing_Content(rset.getString("facing_Content"));
				f.setWriter(rset.getString("writer"));
				f.setReceiver(rset.getString("MEMBER_NICK"));
				f.setWrite_Date(rset.getDate("write_Date"));
				f.setStatus(rset.getString("status"));
				f.setReception_Check(rset.getString("reception_Check"));
				
				list.add(f);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public Facing sendSelectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Facing f= null;

		String query = prop.getProperty("sendSelectOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				f = new Facing();
				
				f.setFacing_No(rset.getInt("facing_No"));
				f.setFacing_Title(rset.getString("facing_Title"));
				f.setFacing_Content(rset.getString("facing_Content"));
				f.setWriter(rset.getString("writer"));
				f.setReceiver(rset.getString("MEMBER_NICK"));
				f.setWrite_Date(rset.getDate("write_Date"));
				f.setStatus(rset.getString("status"));
				f.setReception_Check(rset.getString("reception_Check"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return f;
	}

	public int insertFacing(Connection con, Facing f) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertFacing");
		System.out.println("DAO : "+ f.getReceiver());
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, f.getFacing_Title());
			pstmt.setString(2, f.getFacing_Content());
			pstmt.setString(3, f.getWriter());
			pstmt.setString(4, f.getReceiver());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Member> selectAllMemberList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;
		Member m = null;
		
		String query = prop.getProperty("selectAllMemberList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				list = new ArrayList<Member>();
				
				while(rset.next()){
					m = new Member();
					
					m.setMember_Id(rset.getString("member_id"));
					m.setMember_No(rset.getInt("member_no"));
					m.setMember_Nick(rset.getString("member_nick"));
					
					list.add(m);
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

	public int sendFacing(Connection con, Facing f, int receiverNo1) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("sendFacingOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, f.getFacing_Title());
			pstmt.setString(2, f.getFacing_Content());
			pstmt.setString(3, f.getWriter());
			pstmt.setInt(4, receiverNo1);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int deleteFacing(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteOneFacing");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public Facing updateInfoFacing(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Facing f = null;
		
		String query = prop.getProperty("reMailInfoFacing");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				f = new Facing();
				f.setFacing_No(rset.getInt("facing_no"));
				f.setFacing_Title(rset.getString("facing_title"));
				f.setFacing_Content(rset.getString("facing_content"));
				f.setWriter(rset.getString("member_nick"));
				f.setWrite_Date(rset.getDate("write_date"));
				f.setStatus(rset.getString("status"));
				f.setReception_Check(rset.getString("reception_check"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return f;
	}

	public int deleteSendFacing(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteSendFacing");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Facing> sellerSellectFacing(Connection con, int memberNo) {
		ArrayList<Facing> list = null;
		Facing f = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("sellerSellectFacing");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Facing>();
				while(rset.next()){
					f = new Facing();
					f.setFacing_No(rset.getInt("facing_no"));
					f.setFacing_Title(rset.getString("facing_title"));
					f.setFacing_Content(rset.getString("facing_content"));
					f.setWriter(rset.getString("member_nick"));
					f.setReceiver(rset.getString("receiver"));
					f.setWrite_Date(rset.getDate("write_date"));
					
					list.add(f);
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

	public int insertAlertToAdmin(Connection con, int member_No, String string) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAlertToAdmin");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, string);
			pstmt.setInt(2, member_No);
			pstmt.setString(3, "미확인");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int insertAlertToSeller(Connection con, int member_no, String string) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAlertToSeller");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, string);
			pstmt.setInt(2, member_no);
			pstmt.setString(3, "미확인");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int insertAlertToUser(Connection con, int sellNo, int memberNo, String string) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAlertToUser");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, string);
			pstmt.setInt(2, sellNo);
			pstmt.setInt(3, memberNo);
			pstmt.setString(4, "미확인");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	

}
