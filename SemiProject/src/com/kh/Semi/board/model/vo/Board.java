package com.kh.Semi.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{
	
	private int board_No;
	private String board_Title;
	private String board_Content;
	private String member_No;
	private Date write_Date;
	private String board_Level;
	private String board_Type;
	private int pro_Detail_No;
	private int ref_No;
	private String ref_Board;
	private String status;
	private int board_Detail_No;
	private int board_Count;
	private String qna_status;
	
	public Board(){}

	public Board(int board_No, String board_Title, String board_Content, String member_No, Date write_Date,
			String board_Level, String board_Type, int pro_Detail_No, int ref_No, String ref_Board, String status,
			int board_Detail_No, int board_Count, String qna_status) {
		super();
		this.board_No = board_No;
		this.board_Title = board_Title;
		this.board_Content = board_Content;
		this.member_No = member_No;
		this.write_Date = write_Date;
		this.board_Level = board_Level;
		this.board_Type = board_Type;
		this.pro_Detail_No = pro_Detail_No;
		this.ref_No = ref_No;
		this.ref_Board = ref_Board;
		this.status = status;
		this.board_Detail_No = board_Detail_No;
		this.board_Count = board_Count;
		this.qna_status = qna_status;
	}

	public int getBoard_No() {
		return board_No;
	}

	public void setBoard_No(int board_No) {
		this.board_No = board_No;
	}

	public String getBoard_Title() {
		return board_Title;
	}

	public void setBoard_Title(String board_Title) {
		this.board_Title = board_Title;
	}

	public String getBoard_Content() {
		return board_Content;
	}

	public void setBoard_Content(String board_Content) {
		this.board_Content = board_Content;
	}

	public String getMember_No() {
		return member_No;
	}

	public void setMember_No(String member_No) {
		this.member_No = member_No;
	}

	public Date getWrite_Date() {
		return write_Date;
	}

	public void setWrite_Date(Date write_Date) {
		this.write_Date = write_Date;
	}

	public String getBoard_Level() {
		return board_Level;
	}

	public void setBoard_Level(String board_Level) {
		this.board_Level = board_Level;
	}

	public String getBoard_Type() {
		return board_Type;
	}

	public void setBoard_Type(String board_Type) {
		this.board_Type = board_Type;
	}

	public int getPro_Detail_No() {
		return pro_Detail_No;
	}

	public void setPro_Detail_No(int pro_Detail_No) {
		this.pro_Detail_No = pro_Detail_No;
	}

	public int getRef_No() {
		return ref_No;
	}

	public void setRef_No(int ref_No) {
		this.ref_No = ref_No;
	}

	public String getRef_Board() {
		return ref_Board;
	}

	public void setRef_Board(String ref_Board) {
		this.ref_Board = ref_Board;
	}

	public String getstatus() {
		return status;
	}

	public void setstatus(String status) {
		this.status = status;
	}

	public int getBoard_Detail_No() {
		return board_Detail_No;
	}

	public void setBoard_Detail_No(int board_Detail_No) {
		this.board_Detail_No = board_Detail_No;
	}
	
	public int getBoard_Count(){
		return board_Count;
	}
	
	public void setBoard_Count(int board_Count){
		this.board_Count = board_Count;
	}
	
	public String getQna_Status(){
		return qna_status;
	}
	
	public void setQna_status(String qna_status){
		this.qna_status = qna_status;
	}

	@Override
	public String toString() {
		return "Board [board_No=" + board_No + ", board_Title=" + board_Title + ", board_Content=" + board_Content
				+ ", member_No=" + member_No + ", write_Date=" + write_Date + ", board_Level=" + board_Level
				+ ", board_Type=" + board_Type + ", pro_Detail_No=" + pro_Detail_No + ", ref_No=" + ref_No
				+ ", board_Count=" + board_Count + ", qna_status=" + status + "]";
	}
	

}
