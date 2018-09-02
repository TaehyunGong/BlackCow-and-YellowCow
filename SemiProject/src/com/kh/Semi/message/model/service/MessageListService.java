package com.kh.Semi.message.model.service;

import static com.kh.Semi.common.JDBCTemplate.close;
import static com.kh.Semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.Semi.message.exception.MessageException;
import com.kh.Semi.message.model.dao.MessageListDao;
import com.kh.Semi.message.model.vo.MessageList;

public class MessageListService {
	
	public MessageListService(){}
	
	// 내 대화목록 전체 검색 (내가 user1일때)
	public ArrayList<MessageList> selectMyList1(String user1){
		Connection con = getConnection();
		ArrayList<MessageList> list = new MessageListDao().selectMyList1(con, user1);
		close(con);
		return list;
	}
	// 내 대화목록 전체 검색 (내가 user2일때)
	public ArrayList<MessageList> selectMyList2(String user2){
		Connection con = getConnection();
		ArrayList<MessageList> list = new MessageListDao().selectMyList2(con, user2);
		close(con);
		return list;
	}
	
	// list_no로 user_id, sender 찾을때 user1, user2
	public MessageList selectOne (int list_no) throws MessageException {
		Connection con = getConnection();
		MessageList mList = new MessageListDao().selectOne(con, list_no);
		close(con);
		return mList;
	}
	
	// 대화번호 찾기
	public int selectList(String user_id, String sender){
		Connection con = getConnection();
		int list_no = new MessageListDao().selectList(con, user_id, sender);
		close(con);
		return list_no;
	}

	
	
	public String selectUserName(String user1, String user2) {
		Connection con = getConnection();
		String userName = new MessageListDao().selectUserName(con, user1, user2);
		close(con);
		return userName;
	}
	
	public String selectUserName2(String user2, String user1) {
		Connection con = getConnection();
		String userName = new MessageListDao().selectUserName2(con, user2, user1);
		close(con);
		return userName;
	}
}
