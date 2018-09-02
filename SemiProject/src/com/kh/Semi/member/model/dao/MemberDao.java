package com.kh.Semi.member.model.dao;

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

import com.kh.Semi.member.model.vo.Member;

public class MemberDao {

Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Member memberLogin(String userId, String userPwd, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member user = null;
		
		String query = prop.getProperty("memberLogin");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				user = new Member();
				user.setMember_No(rset.getInt("MEMBER_NO"));
				user.setMember_Id(rset.getString("MEMBER_ID"));
				user.setMember_Pwd(rset.getString("MEMBER_PWD"));
				user.setMember_Name(rset.getString("MEMBER_NAME"));
				user.setMember_Nick(rset.getString("MEMBER_NICK"));
				user.setEmail(rset.getString("EMAIL"));
				user.setPhone(rset.getString("PHONE"));
				user.setTel(rset.getString("TEL"));
				user.setAddress(rset.getString("ADDRESS"));
				user.setMember_Type(rset.getString("MEMBER_TYPE"));
				user.setLogin_Type(rset.getString("LOGIN_TYPE"));
				user.setToken(rset.getString("TOKEN"));
				user.setWith_Check(rset.getString("WITH_CHECK"));
				user.setFarm_Name(rset.getString("FARM_NAME"));
				user.setFarm_Size(rset.getString("FARM_SIZE"));
				user.setFarm_Address(rset.getString("FARM_ADDRESS"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return user;
	}

	public int memberJoin(Member member, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("memberJoin");
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getMember_Id());
			pstmt.setString(2, member.getMember_Pwd());
			pstmt.setString(3, member.getMember_Name());
			pstmt.setString(4, member.getMember_Nick());
			pstmt.setString(5, member.getEmail());
			
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
	
	public int editInfo(Member member, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		String query = prop.getProperty("editInfo");
		System.out.println(query);
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getMember_Id());
			pstmt.setString(2, member.getMember_Pwd());
			pstmt.setString(3, member.getMember_Name());
			pstmt.setString(4, member.getMember_Nick());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getAddress());
			
			
			
			
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

	public ArrayList<Member> selectAllMember(Connection con) {
		ArrayList<Member> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAllMember");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			if(rset != null){
				list = new ArrayList<Member>();
				while(rset.next()){
					Member m = new Member();
					m.setMember_No(rset.getInt("member_no"));
					m.setMember_Id(rset.getString("member_id"));
					m.setMember_Pwd(rset.getString("member_pwd"));
					m.setMember_Name(rset.getString("member_name"));
					m.setMember_Nick(rset.getString("member_nick"));
					m.setEmail(rset.getString("email"));
					m.setPhone(rset.getString("phone"));
					m.setTel(rset.getString("tel"));
					m.setAddress(rset.getString("address"));
					m.setMember_Type(rset.getString("member_type"));
					m.setLogin_Type(rset.getString("login_type"));
					m.setToken(rset.getString("token"));
					m.setWith_Check(rset.getString("with_check"));
					m.setFarm_Name(rset.getString("farm_name"));
					m.setFarm_Size(rset.getString("farm_size"));
					m.setFarm_Address(rset.getString("farm_address"));
					
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

	public int idCheck(String userId, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("memberIdCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
				System.out.println(result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public Member memberSNSLogin(String SNS_ID, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member user = null;
		
		String query = prop.getProperty("memberSNSLogin");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, SNS_ID);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				user = new Member();
				user.setMember_No(rset.getInt("MEMBER_NO"));
				user.setMember_Id(rset.getString("MEMBER_ID"));
				user.setMember_Pwd(rset.getString("MEMBER_PWD"));
				user.setMember_Name(rset.getString("MEMBER_NAME"));
				user.setMember_Nick(rset.getString("MEMBER_NICK"));
				user.setEmail(rset.getString("EMAIL"));
				user.setPhone(rset.getString("PHONE"));
				user.setTel(rset.getString("TEL"));
				user.setAddress(rset.getString("ADDRESS"));
				user.setMember_Type(rset.getString("MEMBER_TYPE"));
				user.setLogin_Type(rset.getString("LOGIN_TYPE"));
				user.setToken(rset.getString("TOKEN"));
				user.setWith_Check(rset.getString("WITH_CHECK"));
				user.setFarm_Name(rset.getString("FARM_NAME"));
				user.setFarm_Size(rset.getString("FARM_SIZE"));
				user.setFarm_Address(rset.getString("FARM_ADDRESS"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return user;
	}

	public int memberSNSJoin(Member member, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("memberSNSJoin");
		String member_Type = "M2";
		if(member.getEmail().equals("noEmail")){
			member_Type="M1";
		}
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getMember_Id());
			pstmt.setString(2, member.getMember_Pwd());
			pstmt.setString(3, member.getMember_Name());
			pstmt.setString(4, member.getMember_Nick());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member_Type);
			pstmt.setString(7, member.getToken());
			
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
	
	public int farmerUpdate(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("farmerUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getFarm_Name());
			pstmt.setString(2, m.getFarm_Size());
			pstmt.setString(3, m.getFarm_Address());
			pstmt.setInt(4, m.getMember_No());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	
	public int sellerRetire(Connection con, int memberNo, String password) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("sellerRetire");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public String passCheck(Connection con, int memberNo, String password) {
		String password2 = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("passCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				password2 = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return password2;
	}

	
	public Member checkEmail(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member user = null;
		String qeury = prop.getProperty("checkEmail");
		
		try {
			pstmt = con.prepareStatement(qeury);
			pstmt.setString(1, email);
			
            rset = pstmt.executeQuery();
			
			if(rset.next()){
				user = new Member();
				user.setMember_No(rset.getInt("MEMBER_NO"));
				user.setMember_Id(rset.getString("MEMBER_ID"));
				user.setMember_Pwd(rset.getString("MEMBER_PWD"));
				user.setMember_Name(rset.getString("MEMBER_NAME"));
				user.setMember_Nick(rset.getString("MEMBER_NICK"));
				user.setEmail(rset.getString("EMAIL"));
				user.setPhone(rset.getString("PHONE"));
				user.setTel(rset.getString("TEL"));
				user.setAddress(rset.getString("ADDRESS"));
				user.setMember_Type(rset.getString("MEMBER_TYPE"));
				user.setLogin_Type(rset.getString("LOGIN_TYPE"));
				user.setToken(rset.getString("TOKEN"));
				user.setWith_Check(rset.getString("WITH_CHECK"));
				user.setFarm_Name(rset.getString("FARM_NAME"));
				user.setFarm_Size(rset.getString("FARM_SIZE"));
				user.setFarm_Address(rset.getString("FARM_ADDRESS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		

		
		return user;
	}

	public Member checkEmailMember(Connection con, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member user = null;
		String qeury = prop.getProperty("checkEmailMember");
		
		try {
			pstmt = con.prepareStatement(qeury);
			pstmt.setString(1, userEmail);
			
            rset = pstmt.executeQuery();
			
			if(rset.next()){
				user = new Member();
				user.setMember_No(rset.getInt("MEMBER_NO"));
				user.setMember_Id(rset.getString("MEMBER_ID"));
				user.setMember_Pwd(rset.getString("MEMBER_PWD"));
				user.setMember_Name(rset.getString("MEMBER_NAME"));
				user.setMember_Nick(rset.getString("MEMBER_NICK"));
				user.setEmail(rset.getString("EMAIL"));
				user.setPhone(rset.getString("PHONE"));
				user.setTel(rset.getString("TEL"));
				user.setAddress(rset.getString("ADDRESS"));
				user.setMember_Type(rset.getString("MEMBER_TYPE"));
				user.setLogin_Type(rset.getString("LOGIN_TYPE"));
				user.setToken(rset.getString("TOKEN"));
				user.setWith_Check(rset.getString("WITH_CHECK"));
				user.setFarm_Name(rset.getString("FARM_NAME"));
				user.setFarm_Size(rset.getString("FARM_SIZE"));
				user.setFarm_Address(rset.getString("FARM_ADDRESS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return user;
	}

	public ArrayList<Member> farmerApprove(Connection con) {
		ArrayList<Member> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = prop.getProperty("farmerApprove");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			if(rset != null){
				list = new ArrayList<Member>();
				while(rset.next()){
					m = new Member();
					m.setMember_No(rset.getInt("member_no"));
					m.setMember_Id(rset.getString("member_id"));
					m.setMember_Name(rset.getString("member_name"));
					m.setMember_Type(rset.getString("member_type"));
					m.setFarm_Name(rset.getString("farm_name"));
					m.setFarm_Address(rset.getString("farm_address"));
					m.setFarm_Size(rset.getString("farm_size"));
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

	public int CheckFarmName(Connection con, String farmName) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		int result = 0;
		
		
		String query = prop.getProperty("checkFarmName");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, farmName);
			
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

	public int updateFarmerMember(Connection con, String name, String address, String size, int mnum) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateFarmerMem");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, size);
			pstmt.setString(3, address);
			pstmt.setInt(4, mnum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;

}

	public int goFarmer(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("goFarmer");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m.getMember_No());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int rejectFarmer(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("rejectFarmer");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public String deleteCheckMember(Connection con, int userNo, String userPwd) {
		String userPwd1 = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("deleteCheckMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				userPwd1 = rset.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return userPwd1;
	}

	public int deleteStatusMemberUpdate(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMemberStatusUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int userInfoUpdate(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("userInfoUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMember_Pwd());
			pstmt.setString(2, m.getMember_Name());
			pstmt.setString(3, m.getMember_Nick());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getAddress());
			pstmt.setInt(6, m.getMember_No());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return result;
	}
	
	
	
}
