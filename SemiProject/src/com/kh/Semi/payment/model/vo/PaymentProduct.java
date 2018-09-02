package com.kh.Semi.payment.model.vo;

import java.sql.Date;

public class PaymentProduct implements java.io.Serializable{

	private int pro_detail_no;
	private String pro_name;
	private Date pro_date;
	private Date pro_deadLine;
	private int pro_price;
	private String ori_fileName;
	private int pro_count;
	
	public int getPro_count() {
		return pro_count;
	}
	public void setPro_count(int pro_count) {
		this.pro_count = pro_count;
	}
	public PaymentProduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PaymentProduct(int pro_detail_no, String pro_name, Date pro_date, Date pro_deadLine, int pro_price,
			String ori_fileName) {
		super();
		this.pro_detail_no = pro_detail_no;
		this.pro_name = pro_name;
		this.pro_date = pro_date;
		this.pro_deadLine = pro_deadLine;
		this.pro_price = pro_price;
		this.ori_fileName = ori_fileName;
	}
	@Override
	public String toString() {
		return "PaymentProduct [pro_detail_no=" + pro_detail_no + ", pro_name=" + pro_name + ", pro_date=" + pro_date
				+ ", pro_deadLine=" + pro_deadLine + ", pro_price=" + pro_price + ", ori_fileName=" + ori_fileName
				+ "]";
	}
	public int getPro_detail_no() {
		return pro_detail_no;
	}
	public void setPro_detail_no(int pro_detail_no) {
		this.pro_detail_no = pro_detail_no;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public Date getPro_date() {
		return pro_date;
	}
	public void setPro_date(Date pro_date) {
		this.pro_date = pro_date;
	}
	public Date getPro_deadLine() {
		return pro_deadLine;
	}
	public void setPro_deadLine(Date pro_deadLine) {
		this.pro_deadLine = pro_deadLine;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getOri_fileName() {
		return ori_fileName;
	}
	public void setOri_fileName(String ori_fileName) {
		this.ori_fileName = ori_fileName;
	}
	
	
}
