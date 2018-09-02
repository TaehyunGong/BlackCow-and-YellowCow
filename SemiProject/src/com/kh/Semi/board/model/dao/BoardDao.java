package com.kh.Semi.board.model.dao;

import static com.kh.Semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.Semi.board.model.vo.Attach;
import com.kh.Semi.board.model.vo.Board;
import com.kh.Semi.funding.model.vo.Product;
import com.kh.Semi.funding.model.vo.ProductList;

public class BoardDao {

	private Properties prop = new Properties();

	// 기본생성자.
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//	게시판 전체 조회용 메소드.
	public ArrayList<Board> selectAllList(Connection con, int currentPage, int limit) {
		// Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;

		String query = prop.getProperty("selectAllList");

		try {
			// stmt = con.createStatement();
			// rset = stmt.executeQuery(query);

			pstmt = con.prepareStatement(query);

			list = new ArrayList<Board>();

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Board b = new Board();

				b.setBoard_No(rset.getInt("board_no"));
				b.setBoard_Type(rset.getString("board_type"));
				b.setBoard_Detail_No(rset.getInt("board_detail_no"));
				b.setBoard_Title(rset.getString("board_title"));
				b.setBoard_Content(rset.getString("board_content"));
				b.setMember_No(rset.getString("member_nick"));
				b.setWrite_Date(rset.getDate("write_date"));
				b.setBoard_Count(rset.getInt("board_count"));
				b.setBoard_Level(rset.getString("board_level"));
				b.setstatus(rset.getString("status"));

				list.add(b);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

//	게시글 페이징처리 listCount메소드.
	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("listCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return listCount;
	}

//	게시글 한개 등록.
	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertBoard");
		System.out.println(b.getBoard_Content());
		System.out.println(b.getBoard_Title());
		System.out.println(b.getMember_No());
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoard_Title());
			pstmt.setString(2, b.getBoard_Content());
			pstmt.setString(3, b.getMember_No());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

//	게시글 조회시 조회수 올리는 메소드.
	public int updateCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 게시글 한개 조회
	public Board selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;

		String query = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				b = new Board();
				b.setBoard_No(rset.getInt("board_no"));
				b.setBoard_Type(rset.getString("board_type"));
				b.setBoard_Detail_No(rset.getInt("board_detail_no"));
				b.setBoard_Title(rset.getString("board_title"));
				b.setBoard_Content(rset.getString("board_content"));
				b.setMember_No(rset.getString("member_nick"));
				b.setWrite_Date(rset.getDate("write_date"));
				b.setBoard_Count(rset.getInt("board_count"));
				b.setBoard_Level(rset.getString("board_level"));
				b.setstatus(rset.getString("status"));
				// b.setRef_No(rset.getInt("ref_no"));
				// b.setRef_Board(rset.getString("ref_board"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return b;
	}

//	댓글 insert.
	public int insertReply(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertReply");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoard_Content());
			pstmt.setString(2, b.getMember_No());
			pstmt.setInt(3, b.getBoard_No());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

//	댓글 조회.
	public ArrayList<Board> selectReplyList(Connection con, int Board_No) {
		PreparedStatement pstmt = null;
		ArrayList<Board> replyList = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectReplyList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Board_No);

			rset = pstmt.executeQuery();

			replyList = new ArrayList<Board>();

			while (rset.next()) {
				Board b = new Board();
				b.setBoard_No(rset.getInt("board_no"));
				b.setBoard_Detail_No(rset.getInt("board_detail_no"));
				b.setBoard_Content(rset.getString("board_content"));
       
				b.setMember_No(rset.getString("member_nick"));
				b.setRef_No(rset.getInt("ref_no"));
				b.setBoard_Level(rset.getString("board_level"));
				b.setWrite_Date(rset.getDate("write_date"));
				b.setstatus(rset.getString("status"));
				replyList.add(b);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return replyList;
	}

//	게시글 삭제.
	public int deleteBoard(Connection con, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

//	댓글 삭제.
	public int deleteReply(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteReply");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBoard_Detail_No());
			pstmt.setInt(2, b.getBoard_No());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

//	게시글 작성자 조회(페이징처리)
	public ArrayList<Board> searchWriter(Connection con, String writer, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<Board> list = null;
		ResultSet rset = null;

		String query = prop.getProperty("searchWriter");

		try {
			pstmt = con.prepareStatement(query);
			
			list = new ArrayList<Board>();
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit + 1;
			
			pstmt.setString(1, writer);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Board b = new Board();
				
				b.setBoard_No(rset.getInt("board_no"));
				b.setBoard_Type(rset.getString("board_type"));
				b.setBoard_Detail_No(rset.getInt("board_detail_no"));
				b.setBoard_Title(rset.getString("board_title"));
				b.setBoard_Content(rset.getString("board_content"));
				b.setMember_No(rset.getString("member_nick"));
				b.setWrite_Date(rset.getDate("write_date"));
				b.setBoard_Count(rset.getInt("board_count"));
				b.setBoard_Level(rset.getString("board_level"));
				b.setstatus(rset.getString("status"));
				
				list.add(b);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}

		return list;
	}

//	게시글 제목 조회(페이징처리)
	public ArrayList<Board> searchTitle(Connection con, String title, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<Board> list = null;
		ResultSet rset = null;

		String query = prop.getProperty("searchTitle");

		try {
			pstmt = con.prepareStatement(query);
			
			list = new ArrayList<Board>();
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit + 1;
			
			pstmt.setString(1, title);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Board b = new Board();
				
				b.setBoard_No(rset.getInt("board_no"));
				b.setBoard_Type(rset.getString("board_type"));
				b.setBoard_Detail_No(rset.getInt("board_detail_no"));
				b.setBoard_Title(rset.getString("board_title"));
				b.setBoard_Content(rset.getString("board_content"));
				b.setMember_No(rset.getString("member_nick"));
				b.setWrite_Date(rset.getDate("write_date"));
				b.setBoard_Count(rset.getInt("board_count"));
				b.setBoard_Level(rset.getString("board_level"));
				b.setstatus(rset.getString("status"));
				
				list.add(b);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public ArrayList<Board> selectFdBoard(Connection con, int pnum, String type, String board) {

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		ArrayList<Board> list = null;

		Board b = null;

		String query = prop.getProperty("selectFdBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pnum);
			pstmt.setString(2, board);
			pstmt.setString(3, type);

			rset = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while (rset.next()) {

				b = new Board();

				b.setBoard_No(rset.getInt("board_no"));
				b.setBoard_Type(rset.getString("board_type"));
				b.setBoard_Content(rset.getString("board_content"));
				b.setMember_No(rset.getString("member_name"));
				b.setWrite_Date(rset.getDate("write_date"));
				b.setPro_Detail_No(rset.getInt("pro_detail_no"));
				b.setRef_Board(rset.getString("ref_board"));

				list.add(b);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int insertFdBoard(Connection con, int pNum, int mNum, String type, String board, String content) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertFundBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, type);
			pstmt.setString(2, content);
			pstmt.setInt(3, mNum);
			pstmt.setInt(4, pNum);
			pstmt.setString(5, board);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertFundReply(Connection con, int bNum, String type, String board, String content, int pNum,
			int mNum) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertFundReply");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, type);
			pstmt.setString(2, content);
			pstmt.setInt(3, mNum);
			pstmt.setInt(4, pNum);
			pstmt.setString(5, board);
			pstmt.setInt(6, bNum);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public HashMap<String, Object> selectProduct(Connection con, int num) {

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		//Board b = null;
		
		HashMap<String, Object> intro = null;
		
		

		String query = prop.getProperty("selectFundProDt");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, num);

			rset = pstmt.executeQuery();

			//b = new Board();
			
			intro = new HashMap<String, Object>();
			
			if (rset.next()) {
				
				
				
				/*b.setBoard_Content(rset.getString("board_content"));
				b.setPro_Detail_No(rset.getInt("pro_detail_no"));*/
				
				
				
				intro.put("proDt", rset.getInt("pro_detail_no"));
				intro.put("board_content", rset.getString("board_content"));
				intro.put("member_name", rset.getString("member_name"));
				intro.put("ori_filename", rset.getString("ori_filename"));
				intro.put("pro_name", rset.getString("pro_name"));
				intro.put("pro_date", rset.getDate("pro_date"));
				intro.put("pro_deadline", rset.getDate("pro_deadline"));
				intro.put("pro_price", rset.getInt("pro_price"));
				intro.put("pro_count", rset.getInt("pro_count"));
				intro.put("pro_qty", rset.getInt("pro_qty"));
				intro.put("deadline", rset.getInt("deadline"));
				intro.put("member_Id", rset.getString("member_id"));
				intro.put("member_No", rset.getString("member_No"));
				
				
				
				
				
				
				
				
				
				

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return intro;
	}


	public ArrayList<Board> selectReply(Connection con, int bnum, String type, String board) {

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		ArrayList<Board> list = null;

		Board b = null;

		String query = prop.getProperty("selectReply");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bnum);
			pstmt.setString(2, board);
			pstmt.setString(3, type);

			rset = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while (rset.next()) {

				b = new Board();

				b.setBoard_No(rset.getInt("board_no"));
				b.setBoard_Type(rset.getString("board_type"));
				b.setBoard_Content(rset.getString("board_content"));
				b.setMember_No(rset.getString("member_name"));
				b.setWrite_Date(rset.getDate("write_date"));
				b.setPro_Detail_No(rset.getInt("pro_detail_no"));
				b.setRef_Board(rset.getString("ref_board"));
				b.setstatus(rset.getString("status"));
				b.setBoard_Level(rset.getString("board_level"));
				b.setRef_No(rset.getInt("ref_no"));

				list.add(b);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int insertProContent(Connection con, Board b, Product pro) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertProduct");
		if(pro.getProduct_Type() != null){
			b.setBoard_Type("B5");
		}else{
			b.setBoard_Type("B4");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoard_Type());
			pstmt.setString(2, b.getBoard_Content());
			pstmt.setString(3, b.getMember_No());
			pstmt.setInt(4, b.getPro_Detail_No());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertStory(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertStory");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoard_Content());
			pstmt.setString(2, b.getMember_No());
			pstmt.setInt(3, b.getPro_Detail_No());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

//	QNA 등록.
	public int insertQna(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertQna");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoard_Title());
			pstmt.setString(2, b.getBoard_Content());
			pstmt.setString(3, b.getMember_No());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

//	QNA페이징처리 listCount메소드.
	public int getListCountQna(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("listCountQna");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

//	전체 QNA문의 조회(페이징처리)
	public ArrayList<Board> selectAllQnaList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;

		String query = prop.getProperty("selectAllQnaList");

		try {
			pstmt = con.prepareStatement(query);

			list = new ArrayList<Board>();

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Board b = new Board();

				b.setBoard_No(rset.getInt("board_no"));
				b.setBoard_Type(rset.getString("board_type"));
				b.setBoard_Detail_No(rset.getInt("board_detail_no"));
				b.setBoard_Title(rset.getString("board_title"));
				b.setBoard_Content(rset.getString("board_content"));
				b.setMember_No(rset.getString("member_nick"));
				b.setWrite_Date(rset.getDate("write_date"));
				b.setBoard_Count(rset.getInt("board_count"));
				b.setBoard_Level(rset.getString("board_level"));
				b.setRef_No(rset.getInt("ref_no"));
				b.setstatus(rset.getString("status"));
				b.setQna_status(rset.getString("qna_status"));

				list.add(b);
			}
			System.out.println("관리자DAO : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

//	QNA게시글 한개 조회
	// QNA 게시글 한개 조회
	public Board selectOneQna(Connection con, int num) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;

		String query = prop.getProperty("selectOneQna");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				b = new Board();
				b.setBoard_No(rset.getInt("board_no"));
				b.setBoard_Type(rset.getString("board_type"));
				b.setBoard_Detail_No(rset.getInt("board_detail_no"));
				b.setBoard_Title(rset.getString("board_title"));
				b.setBoard_Content(rset.getString("board_content"));
				b.setMember_No(rset.getString("member_nick"));
				b.setWrite_Date(rset.getDate("write_date"));
				b.setBoard_Count(rset.getInt("board_count"));
				b.setBoard_Level(rset.getString("board_level"));
				b.setstatus(rset.getString("status"));
				b.setQna_status(rset.getString("qna_status"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return b;
	}

//	QNA답변등록
	// QNA 관리자 답변등록.
	public int insertQnaAnswer(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertQnaAnswer");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoard_Title());
			pstmt.setString(2, b.getBoard_Content());
			pstmt.setInt(3, b.getBoard_No());
      
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

//	QNA답변등록 시, 답변완료 상태변환 메소드.
	public int updateQnaStatus(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateQnaStatus");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, b.getBoard_No());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

//	게시글 수정을 위한 정보 받아오는 메소드.
//	게시물 수정을 위한 정보 받아오는 메소드.
	public Board updateInfoBoard(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("updateInfoBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				b = new Board();
				b.setBoard_No(rset.getInt("board_no"));
				b.setBoard_Type(rset.getString("board_type"));
				b.setBoard_Detail_No(rset.getInt("board_detail_no"));
				b.setBoard_Title(rset.getString("board_title"));
				b.setBoard_Content(rset.getString("board_content"));
				b.setMember_No(rset.getString("member_nick"));
				b.setWrite_Date(rset.getDate("write_date"));
				b.setBoard_Count(rset.getInt("board_count"));
				b.setBoard_Level(rset.getString("board_level"));
				b.setstatus(rset.getString("status"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return b;
	}

//	게시글 수정 메소드.
//	게시물 수정 메소드.
	public int updateOneBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateOneBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoard_Title());
			pstmt.setString(2, b.getBoard_Content());
			pstmt.setInt(3, b.getBoard_No());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Board> selectFundStory(Connection con, int num) {

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		ArrayList<Board> story = null;
		
		Board b = null;

		String query = prop.getProperty("selectFundStory");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, num);

			rset = pstmt.executeQuery();
			
			story = new ArrayList<Board>();
			
			while (rset.next()) {
				b = new Board();
				b.setBoard_Content(rset.getString("board_content"));
				b.setWrite_Date(rset.getDate("write_date"));
				
				story.add(b);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return story;
	}

//	QNA답변 등록을 위해 정보 받아오는 메소드.
//	QNA 관리자 답변페이지에 필요한 정보 받아오는 메소드.
	public Board updateQnaInfo(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("updateQnaInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				b = new Board();
				b.setBoard_No(rset.getInt("board_no"));
				b.setBoard_Type(rset.getString("board_type"));
				b.setBoard_Detail_No(rset.getInt("board_detail_no"));
				b.setBoard_Title(rset.getString("board_title"));
				b.setBoard_Content(rset.getString("board_content"));
				b.setMember_No(rset.getString("member_nick"));
				b.setWrite_Date(rset.getDate("write_date"));
				b.setBoard_Count(rset.getInt("board_count"));
				b.setBoard_Level(rset.getString("board_level"));
				b.setstatus(rset.getString("status"));
				b.setQna_status(rset.getString("qna_status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return b;
	}

//	작성자 조회 페이징 처리용 listCount메소드.
	public int getListCountWriter(Connection con, String writer) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCountWriter");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, writer);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

//	제목 조회 페이징 처리용 listCount메소드.
	public int getListCountTitle(Connection con, String title) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCountTitle");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

//	내용 조회 페이징처리용 listCount메소드.
	public int getListCountContent(Connection con, String content) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCountContent");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, content);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

//	내용 조회 전체조회(페이징처리)
	public ArrayList<Board> searchContent(Connection con, String content, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<Board> list = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("searchContent");
		
		try {
			pstmt = con.prepareStatement(query);
			
			list = new ArrayList<Board>();
			
			int startRow = (currentPage - 1) * limit * 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, content);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Board b = new Board();
				
				b.setBoard_No(rset.getInt("board_no"));
				b.setBoard_Type(rset.getString("board_type"));
				b.setBoard_Detail_No(rset.getInt("board_detail_no"));
				b.setBoard_Title(rset.getString("board_title"));
				b.setBoard_Content(rset.getString("board_content"));
				b.setMember_No(rset.getString("member_nick"));
				b.setWrite_Date(rset.getDate("write_date"));
				b.setBoard_Count(rset.getInt("board_count"));
				b.setBoard_Level(rset.getString("board_level"));
				b.setstatus(rset.getString("status"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int updateProduct(Connection con, Product pro) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProduct");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pro.getPro_content());
			pstmt.setInt(2, pro.getPro_Detail_No());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
		
	}

	public ProductList selectProgressStatus(Connection con, int num) {
		
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ProductList productStatus = null;
		
		String query = prop.getProperty("selectProgressStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			productStatus = new ProductList();
			
			if(rset.next()){
				
				productStatus.setRanks(rset.getInt("num"));
				productStatus.setPro_detail_no(rset.getInt("pro_detail_no"));
				productStatus.setProgress(rset.getString("progress"));
				
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return  productStatus;
	}

	

	public ArrayList<HashMap<String, Object>> selectProductpopRank(Connection con) {
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String query = prop.getProperty("selectpopRank");
		
		HashMap<String, Object> hmap = null;
		
		ArrayList<HashMap<String, Object>> popRank = null;
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			popRank = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				
				hmap = new HashMap<String, Object>();
				
				hmap.put("percent", rset.getInt("percent"));
				hmap.put("pnum", rset.getInt("pro_detail_no"));
				hmap.put("pro_name",rset.getString("pro_name"));
				
				
				
				popRank.add(hmap);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		
		return popRank;
	}

	public ArrayList<HashMap<String, Object>> selectNewProductList(Connection con) {
		
		
		Statement stmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("selectnewFundList");

		HashMap<String, Object> hmap = null;

		ArrayList<HashMap<String, Object>> newFundList = null;

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			newFundList = new ArrayList<HashMap<String, Object>>();

			while (rset.next()) {

				hmap = new HashMap<String, Object>();

				hmap.put("percent", rset.getInt("percent"));
				hmap.put("pnum", rset.getInt("pro_detail_no"));
				hmap.put("pro_name", rset.getString("pro_name"));

				newFundList.add(hmap);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return newFundList;
	}

	public ArrayList<HashMap<String, Object>> selectDeadlineProductList(Connection con) {
		
		
		Statement stmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("selectDeadlineFundList");

		HashMap<String, Object> hmap = null;

		ArrayList<HashMap<String, Object>> deadlineFundList = null;

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			deadlineFundList = new ArrayList<HashMap<String, Object>>();

			while (rset.next()) {

				hmap = new HashMap<String, Object>();

				hmap.put("percent", rset.getInt("percent"));
				hmap.put("pnum", rset.getInt("pro_detail_no"));
				hmap.put("pro_name", rset.getString("pro_name"));

				deadlineFundList.add(hmap);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return deadlineFundList;
	}

	public HashMap<String, Object> selectFoodProduct(Connection con, int num) {
		
		
		PreparedStatement pstmt = null;

		ResultSet rset = null;
		
		HashMap<String, Object> intro = null;
		
		

		String query = prop.getProperty("selectFoodProDt");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, num);

			rset = pstmt.executeQuery();

		
			
			intro = new HashMap<String, Object>();
			
			if (rset.next()) {
				
					
				intro.put("proDt", rset.getInt("pro_detail_no"));
				intro.put("board_content", rset.getString("board_content"));
				intro.put("member_name", rset.getString("member_name"));
				intro.put("ori_filename", rset.getString("ori_filename"));
				intro.put("pro_name", rset.getString("pro_name"));
				intro.put("pro_date", rset.getDate("pro_date"));
				intro.put("pro_deadline", rset.getDate("pro_deadline"));
				intro.put("pro_price", rset.getInt("pro_price"));
				intro.put("pro_count", rset.getInt("pro_count"));
				intro.put("pro_qty", rset.getInt("pro_qty"));
				intro.put("deadline", rset.getInt("deadline"));
				intro.put("member_Id", rset.getString("member_id"));
				intro.put("member_No", rset.getString("member_No"));
				
				

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return intro;
	}

	public ArrayList<HashMap<String, Object>> selectFoodProductpopRank(Connection con) {
		
		Statement stmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("selectFoodpopRank");

		HashMap<String, Object> hmap = null;

		ArrayList<HashMap<String, Object>> popRank = null;

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			popRank = new ArrayList<HashMap<String, Object>>();

			while (rset.next()) {

				hmap = new HashMap<String, Object>();

				hmap.put("percent", rset.getInt("percent"));
				hmap.put("pnum", rset.getInt("pro_detail_no"));
				hmap.put("pro_name", rset.getString("pro_name"));

				popRank.add(hmap);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return popRank;
	}

	public ArrayList<HashMap<String, Object>> selectNewFoodList(Connection con) {
		
		Statement stmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("selectnewFoodList");

		HashMap<String, Object> hmap = null;

		ArrayList<HashMap<String, Object>> newFundList = null;

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			newFundList = new ArrayList<HashMap<String, Object>>();

			while (rset.next()) {

				hmap = new HashMap<String, Object>();

				hmap.put("percent", rset.getInt("percent"));
				hmap.put("pnum", rset.getInt("pro_detail_no"));
				hmap.put("pro_name", rset.getString("pro_name"));

				newFundList.add(hmap);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return newFundList;
	}

	public ArrayList<HashMap<String, Object>> selectDeadlineFoodList(Connection con) {
		
		Statement stmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("selectDeadlineFoodList");

		HashMap<String, Object> hmap = null;

		ArrayList<HashMap<String, Object>> deadlineFundList = null;

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			deadlineFundList = new ArrayList<HashMap<String, Object>>();

			while (rset.next()) {

				hmap = new HashMap<String, Object>();

				hmap.put("percent", rset.getInt("percent"));
				hmap.put("pnum", rset.getInt("pro_detail_no"));
				hmap.put("pro_name", rset.getString("pro_name"));

				deadlineFundList.add(hmap);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return deadlineFundList;
	}

	public int updateBoardCount(Connection con, Board b) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateBoardCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getPro_Detail_No());
			pstmt.setString(2, b.getBoard_Type());
			pstmt.setString(3, b.getRef_Board());
			pstmt.setInt(4, b.getPro_Detail_No());
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
