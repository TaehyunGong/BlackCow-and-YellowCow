package com.kh.Semi.message.model.service;

import static com.kh.Semi.common.JDBCTemplate.close;
import static com.kh.Semi.common.JDBCTemplate.commit;
import static com.kh.Semi.common.JDBCTemplate.getConnection;
import static com.kh.Semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.Semi.message.exception.MessageException;
import com.kh.Semi.message.model.dao.MessageDao;
import com.kh.Semi.message.model.vo.Message;

public class MessageService {

	public int sendMessage(Message msg) throws MessageException {
		Connection con = getConnection();
		int result = new MessageDao().sendMessage(con, msg);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public ArrayList<Message> selectMyMessage(int list_no) {
		Connection con = getConnection();
		ArrayList<Message> list = new MessageDao().selectMyMessage(con, list_no);
		close(con);
		return list;
	}


}
