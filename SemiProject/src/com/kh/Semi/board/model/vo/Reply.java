package com.kh.Semi.board.model.vo;

import java.sql.Date;

public class Reply implements java.io.Serializable{
	
	private int reply_No;
	private int rep_Board_No;
	private String rep_Writer;
	private String rep_Content;
	private int rep_Level;
	private int rep_No;
	private Date rep_Write_Date;
	private Date rep_Modify_Date;
	private String rep_Status;
	
	public Reply(){}

	public Reply(int reply_No, int rep_Board_No, String rep_Writer, String rep_Content, int rep_Level, int rep_No,
			Date rep_Write_Date, Date rep_Modify_Date, String rep_Status) {
		super();
		this.reply_No = reply_No;
		this.rep_Board_No = rep_Board_No;
		this.rep_Writer = rep_Writer;
		this.rep_Content = rep_Content;
		this.rep_Level = rep_Level;
		this.rep_No = rep_No;
		this.rep_Write_Date = rep_Write_Date;
		this.rep_Modify_Date = rep_Modify_Date;
		this.rep_Status = rep_Status;
	}

	public int getReply_No() {
		return reply_No;
	}

	public void setReply_No(int reply_No) {
		this.reply_No = reply_No;
	}

	public int getRep_Board_No() {
		return rep_Board_No;
	}

	public void setRep_Board_No(int rep_Board_No) {
		this.rep_Board_No = rep_Board_No;
	}

	public String getRep_Writer() {
		return rep_Writer;
	}

	public void setRep_Writer(String rep_Writer) {
		this.rep_Writer = rep_Writer;
	}

	public String getRep_Content() {
		return rep_Content;
	}

	public void setRep_Content(String rep_Content) {
		this.rep_Content = rep_Content;
	}

	public int getRep_Level() {
		return rep_Level;
	}

	public void setRep_Level(int rep_Level) {
		this.rep_Level = rep_Level;
	}

	public int getRep_No() {
		return rep_No;
	}

	public void setRep_No(int rep_No) {
		this.rep_No = rep_No;
	}

	public Date getRep_Write_Date() {
		return rep_Write_Date;
	}

	public void setRep_Write_Date(Date rep_Write_Date) {
		this.rep_Write_Date = rep_Write_Date;
	}

	public Date getRep_Modify_Date() {
		return rep_Modify_Date;
	}

	public void setRep_Modify_Date(Date rep_Modify_Date) {
		this.rep_Modify_Date = rep_Modify_Date;
	}

	public String getRep_Status() {
		return rep_Status;
	}

	public void setRep_Status(String rep_Status) {
		this.rep_Status = rep_Status;
	}

	@Override
	public String toString() {
		return "Reply [reply_No=" + reply_No + ", rep_Board_No=" + rep_Board_No + ", rep_Writer=" + rep_Writer
				+ ", rep_Content=" + rep_Content + ", rep_Level=" + rep_Level + ", rep_No=" + rep_No
				+ ", rep_Write_Date=" + rep_Write_Date + ", rep_Modify_Date=" + rep_Modify_Date + ", rep_Status="
				+ rep_Status + "]";
	}
	
	
	
	

}
