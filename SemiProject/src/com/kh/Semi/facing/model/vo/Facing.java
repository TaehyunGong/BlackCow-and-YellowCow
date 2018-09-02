package com.kh.Semi.facing.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Facing implements Serializable {
	
	
	private int facing_No;
	private String facing_Title;
	private String Facing_Content;
	private String writer;
	private String receiver;
	private Date write_Date;
	private String status;
	private String reception_Check;
	

	public Facing(){}


	public Facing(int facing_No, String facing_Title, String facing_Content, String writer, String receiver,
			Date write_Date, String status, String reception_Check) {
		super();
		this.facing_No = facing_No;
		this.facing_Title = facing_Title;
		this.Facing_Content = facing_Content;
		this.writer = writer;
		this.receiver = receiver;
		this.write_Date = write_Date;
		this.status = status;
		this.reception_Check = reception_Check;
	}


	public int getFacing_No() {
		return facing_No;
	}


	public void setFacing_No(int facing_No) {
		this.facing_No = facing_No;
	}


	public String getFacing_Title() {
		return facing_Title;
	}


	public void setFacing_Title(String facing_Title) {
		this.facing_Title = facing_Title;
	}


	public String getFacing_Content() {
		return Facing_Content;
	}


	public void setFacing_Content(String facing_Content) {
		Facing_Content = facing_Content;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getReceiver() {
		return receiver;
	}


	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}


	public Date getWrite_Date() {
		return write_Date;
	}


	public void setWrite_Date(Date write_Date) {
		this.write_Date = write_Date;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getReception_Check() {
		return reception_Check;
	}


	public void setReception_Check(String reception_Check) {
		this.reception_Check = reception_Check;
	}


	@Override
	public String toString() {
		return "Facing [facing_No=" + facing_No + ", facing_Title=" + facing_Title + ", Facing_Content="
				+ Facing_Content + ", writer=" + writer + ", receiver=" + receiver + ", write_Date=" + write_Date
				+ ", status=" + status + ", reception_Check=" + reception_Check + "]";
	}
	
	
	
}
