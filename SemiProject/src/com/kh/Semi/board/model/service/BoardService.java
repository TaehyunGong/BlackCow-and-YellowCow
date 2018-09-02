package com.kh.Semi.board.model.service;

import static com.kh.Semi.common.JDBCTemplate.close;
import static com.kh.Semi.common.JDBCTemplate.commit;
import static com.kh.Semi.common.JDBCTemplate.getConnection;
import static com.kh.Semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.Semi.board.model.dao.BoardDao;
import com.kh.Semi.board.model.vo.Attach;
import com.kh.Semi.board.model.vo.Board;
import com.kh.Semi.funding.model.vo.ProductList;

public class BoardService {

	public ArrayList<Board> selectAllList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAllList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	
//	게시글 한개 등록.
	public int insertBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertBoard(con, b);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

//	게시글 한개 조회용 메소드.
	public Board selectOne(int num) {
		Connection con = getConnection();
		Board b = null;
		
		int result = new BoardDao().updateCount(con, num);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		b = new BoardDao().selectOne(con, num);
		
		close(con);
		
		return b;
	}

//	댓글 인서트.
	public ArrayList<Board> insertReply(Board b) {
		Connection con = getConnection();
		ArrayList<Board> replyList = null;
		
		int result = new BoardDao().insertReply(con,  b);
		if(result > 0){
			commit(con);
			System.out.println("커밋?");
		}else{
			rollback(con);
		}
		replyList = new BoardDao().selectReplyList(con, b.getBoard_No());
		System.out.println(replyList);
		close(con);
		
		return replyList;
	}

	public int deleteBoard(int boardNo) {
		Connection con = getConnection();
		
		int result = new BoardDao().deleteBoard(con, boardNo);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Board> selectAllReplyList(int num) {
		Connection con = getConnection();
		
		ArrayList<Board> replyList = new BoardDao().selectReplyList(con, num);
		
		close(con);
		
		return replyList;
	}

	public ArrayList<Board> deleteReply(Board b) {
		Connection con = getConnection();
		ArrayList<Board> replyList = null;
		
		int result = new BoardDao().deleteReply(con, b);
		
		if(result > 0){
			commit(con);
			replyList = new BoardDao().selectReplyList(con, b.getBoard_No());
		}else{
			rollback(con);
		}
		
		close(con);
		
		return replyList;
	}

//	게시글 작성자로 조회.
	public ArrayList<Board> searchWriter(String writer, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchWriter(con, writer, currentPage, limit);
		
		close(con);
		
		return list;
	}

//	게시글 제목으로 조회
	public ArrayList<Board> searchTitle(String title, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchTitle(con, title, currentPage, limit);
		
		close(con);
		
		return list;
	}

	//펀드 리플
		public ArrayList<Board> selectReply(int bnum, String type, String board) {

			Connection con = getConnection();

			ArrayList<Board> list = new BoardDao().selectReply(con, bnum, type, board);

			close(con);

			return list;
		}
		
		
		// 펀드 게시판

		public ArrayList<Board> selectFdBoard(int pnum, String type, String board) {
			
			Connection con = getConnection();

			ArrayList<Board> list = new BoardDao().selectFdBoard(con, pnum, type, board);

			close(con);

			return list;
		}

		public int insertFundBoard(int pNum, int mNum, String type, String board, String content) {
			
			Connection con = getConnection();
			
			int result = new BoardDao().insertFdBoard(con, pNum, mNum, type, board, content);
			
			
			if(result > 0){
				commit(con);
			}else{
				rollback(con);
			}
			
			close(con);
			
			return result;
		}

		public ArrayList<Board> insertFundReply(int bNum, String content, String type, String board, int pNum, int mNum) {

			Connection con = getConnection();

			ArrayList<Board> list = null;

			int result = new BoardDao().insertFundReply(con, bNum, type, board, content, pNum, mNum);

			if (result > 0) {
				commit(con);

				list = new BoardDao().selectReply(con, bNum, type, board);
			} else {
				rollback(con);
			}

			close(con);

			return list;
		}
		
		
		public HashMap<String, Object> selectProduct(int num) {

			Connection con = getConnection();

			//Board b = new BoardDao().selectProduct(con, num);

			HashMap<String, Object> intro = new BoardDao().selectProduct(con,  num);
			
			
			close(con);

			return intro;

		}


		
//	문의 등록.
	public int insertQna(Board b) {
		Connection con = getConnection();

		int result = new BoardDao().insertQna(con, b);

		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}

		close(con);

		return result;
	}

//	나의문의내역 페이징처리 관련 listCount.
	public int getListCountQna() {
		Connection con = getConnection();

		int listCount = new BoardDao().getListCountQna(con);

		close(con);

		return listCount;
	}

//	한 유저의 모든 문의내역 조회.
	public ArrayList<Board> selectAllQnaList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<Board> list = new BoardDao().selectAllQnaList(con, currentPage, limit);

		close(con);

		return list;
	}

//	QNA 게시글 한개 조회
	public Board selectOneQna(int num) {
		Connection con = getConnection();

		Board b = new BoardDao().selectOneQna(con, num);

		close(con);

		return b;
	}

//	QNA 관리자 답변등록.
	public int insertQnaAnswer(Board b) {
		Connection con = getConnection();
		
		int result = 0;
		
		int result1 = new BoardDao().updateQnaStatus(con, b);
		System.out.println("QNA상태변환 : " + b);
		
		if(result1 > 0){System.out.println("리져트1 : " + result1);
			commit(con);
			result = new BoardDao().insertQnaAnswer(con, b);
			if(result > 0){System.out.println("리져트:"+result);
				commit(con);
			}
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	public ArrayList<Board> selectFundStory(int num) {
		
		Connection con = getConnection();
		
		ArrayList<Board> story = new BoardDao().selectFundStory(con, num);
		
		close(con);
		
		return story;
	}		

	public Board updateInfoBoard(int num) {
		Connection con = getConnection();
		
		Board b = new BoardDao().updateInfoBoard(con, num);
		
		close(con);
		
		return b;
	}

	public int updateOneBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().updateOneBoard(con, b);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Board updateQnaInfo(int num) {
		Connection con = getConnection();
		
		Board b = new BoardDao().updateQnaInfo(con, num);
		
		close(con);
		
		return b;
	}

//	게시글 작성자 검색 시 listCount메소드.
	public int getListCountWriter(String writer) {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCountWriter(con, writer);
		
		close(con);
		
		return listCount;
	}

//	게시글 제목 검색 시 listCount메소드.
	public int getListCountTitle(String title) {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCountTitle(con, title);
		
		close(con);
		
		return listCount;
	}

//	게시글 내용 검색 시 listCount메소드.
	public int getListCountContent(String content) {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCountContent(con, content);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> searchContent(String content, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchContent(con, content, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public ProductList selectProgressStatus(int num) {
		
		Connection con = getConnection();
		
		ProductList productStatus = new BoardDao().selectProgressStatus(con, num);
		
		close(con);
		
		
		return productStatus;
	}


	public ArrayList<HashMap<String, Object>> selectProductpopRank() {
		
		Connection con = getConnection();
		
		
		ArrayList<HashMap<String, Object>> popRank = new BoardDao().selectProductpopRank(con);
		
		
		close(con);
		
		return popRank;
	}

	public ArrayList<HashMap<String, Object>> selectNewProductList() {
		
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> newFundlist = new BoardDao().selectNewProductList(con);

		close(con);

		return newFundlist;
	}

	public ArrayList<HashMap<String, Object>> selectDeadlineProductList() {
		
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> deadlineFundlist = new BoardDao().selectDeadlineProductList(con);

		close(con);

		return deadlineFundlist;
	}

	public HashMap<String, Object> selectFoodProduct(int num) {
		
		
		Connection con = getConnection();

		

		HashMap<String, Object> intro = new BoardDao().selectFoodProduct(con,  num);
		
		
		close(con);

		return intro;
	}

	public ArrayList<HashMap<String, Object>> selectFoodProductpopRank() {
		
		Connection con = getConnection();
		
		
		ArrayList<HashMap<String, Object>> popRank = new BoardDao().selectFoodProductpopRank(con);
		
		
		close(con);
		
		return popRank;
	}

	public ArrayList<HashMap<String, Object>> selectNewFoodList() {
		
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> newFundlist = new BoardDao().selectNewFoodList(con);

		close(con);

		return newFundlist;
	}

	public ArrayList<HashMap<String, Object>> selectDeadlineFoodList() {
		
		Connection con = getConnection();

		ArrayList<HashMap<String, Object>> deadlineFundlist = new BoardDao().selectDeadlineFoodList(con);

		close(con);

		return deadlineFundlist;
	}

	public int updateBoardCount(Board b) {
		
		Connection con = getConnection();
		
		int result = new BoardDao().updateBoardCount(con, b);
		
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		
		close(con);
		
		
		return result;
	}

	
		
		
		
		
		
}
