package com.kh.Semi.payment.model.vo;

import java.util.Date;

public class Payment implements java.io.Serializable {
	
	private int pay_num;
	private int pay_detail_no;
	private Date pay_date;
	private int pay_no;
	private String pay_level;
	private String pay_type;
	private String accept_no;
	private String pay_prog;
	private String refund_prog;
	private String refund_no;
	private String complete_no;
	private String pro_name;
	private int pro_price;
	private String waybill;
	private String ori_fileName;
	private String progress;
	private int sellerNo;
	private String member_nick;
	
	public Payment()
	{
		
	}

	
	




	public Payment(int pay_num, int pay_detail_no, Date pay_date, int pay_no, String pay_level, String pay_type,
			String accept_no, String pay_prog, String refund_prog, String refund_no, String complete_no,
			String pro_name, int pro_price, String waybill, String ori_fileName, String progress, int sellerNo,
			String member_nick) {
		super();
		this.pay_num = pay_num;
		this.pay_detail_no = pay_detail_no;
		this.pay_date = pay_date;
		this.pay_no = pay_no;
		this.pay_level = pay_level;
		this.pay_type = pay_type;
		this.accept_no = accept_no;
		this.pay_prog = pay_prog;
		this.refund_prog = refund_prog;
		this.refund_no = refund_no;
		this.complete_no = complete_no;
		this.pro_name = pro_name;
		this.pro_price = pro_price;
		this.waybill = waybill;
		this.ori_fileName = ori_fileName;
		this.progress = progress;
		this.sellerNo = sellerNo;
		this.member_nick = member_nick;
	}







	public Payment(int pay_num, int pay_detail_no, Date pay_date, int pay_no, String pay_level, String pay_type,
			String accept_no, String pay_prog, String refund_prog, String refund_no, String complete_no,
			String pro_name, int pro_price, String waybill , String ori_fileName) {
		super();
		this.pay_num = pay_num;
		this.pay_detail_no = pay_detail_no;
		this.pay_date = pay_date;
		this.pay_no = pay_no;
		this.pay_level = pay_level;
		this.pay_type = pay_type;
		this.accept_no = accept_no;
		this.pay_prog = pay_prog;
		this.refund_prog = refund_prog;
		this.refund_no = refund_no;
		this.complete_no = complete_no;
		this.pro_name = pro_name;
		this.pro_price = pro_price;
		this.waybill = waybill;
		this.ori_fileName = ori_fileName;
	}

	
	public Payment(int pay_num, int pay_detail_no, Date pay_date, int pay_no, String pay_level, String pay_type,
			String accept_no, String pay_prog, String refund_prog, String refund_no, String complete_no,
			String pro_name, int pro_price, String waybill, String ori_fileName, String progress) {
		super();
		this.pay_num = pay_num;
		this.pay_detail_no = pay_detail_no;
		this.pay_date = pay_date;
		this.pay_no = pay_no;
		this.pay_level = pay_level;
		this.pay_type = pay_type;
		this.accept_no = accept_no;
		this.pay_prog = pay_prog;
		this.refund_prog = refund_prog;
		this.refund_no = refund_no;
		this.complete_no = complete_no;
		this.pro_name = pro_name;
		this.pro_price = pro_price;
		this.waybill = waybill;
		this.ori_fileName = ori_fileName;
		this.progress = progress;
	}




	public Payment(Date pay_date, String pay_type, String pro_name, int pro_price, String waybill) {
		super();
		this.pay_date = pay_date;
		this.pay_type = pay_type;
		this.pro_name = pro_name;
		this.pro_price = pro_price;
		this.waybill = waybill;
	}



	public Payment(int pay_detail_no, Date pay_date, int pay_no, String pay_level, String pay_type, String accept_no,
		String pay_prog, String refund_prog, String refund_no, String complete_no, String pro_name, int pro_price,
		String waybill) {
	super();
	this.pay_detail_no = pay_detail_no;
	this.pay_date = pay_date;
	this.pay_no = pay_no;
	this.pay_level = pay_level;
	this.pay_type = pay_type;
	this.accept_no = accept_no;
	this.pay_prog = pay_prog;
	this.refund_prog = refund_prog;
	this.refund_no = refund_no;
	this.complete_no = complete_no;
	this.pro_name = pro_name;
	this.pro_price = pro_price;
	this.waybill = waybill;
}
	
	
	
	
	public String getMember_nick() {
		return member_nick;
	}







	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}







	public int getPay_num() {
		return pay_num;
	}
	
	
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	
	public int getSellerNo() {
		return sellerNo;
	}



	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}



	public String getProgress() {
		return progress;
	}
	
	
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getOri_fileName()
	{
		return ori_fileName;
	}
	
	public void setOri_fileName(String ori_fileName)
	{
		this.ori_fileName = ori_fileName;
	}
	
	public int getPay_detail_no() {
		return pay_detail_no;
	}

	public void setPay_detail_no(int pay_detail_no) {
		this.pay_detail_no = pay_detail_no;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	public String getPay_level() {
		return pay_level;
	}

	public void setPay_level(String pay_level) {
		this.pay_level = pay_level;
	}

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public String getAccept_no() {
		return accept_no;
	}

	public void setAccept_no(String accept_no) {
		this.accept_no = accept_no;
	}

	public String getPay_prog() {
		return pay_prog;
	}

	public void setPay_prog(String pay_prog) {
		this.pay_prog = pay_prog;
	}

	public String getRefund_prog() {
		return refund_prog;
	}

	public void setRefund_prog(String refund_prog) {
		this.refund_prog = refund_prog;
	}

	public String getRefund_no() {
		return refund_no;
	}

	public void setRefund_no(String refund_no) {
		this.refund_no = refund_no;
	}

	public String getComplete_no() {
		return complete_no;
	}

	public void setComplete_no(String complete_no) {
		this.complete_no = complete_no;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public int getPro_price() {
		return pro_price;
	}

	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}

	public String getWaybill() {
		return waybill;
	}

	public void setWaybill(String waybill) {
		this.waybill = waybill;
	}







	@Override
	public String toString() {
		return "Payment [pay_num=" + pay_num + ", pay_detail_no=" + pay_detail_no + ", pay_date=" + pay_date
				+ ", pay_no=" + pay_no + ", pay_level=" + pay_level + ", pay_type=" + pay_type + ", accept_no="
				+ accept_no + ", pay_prog=" + pay_prog + ", refund_prog=" + refund_prog + ", refund_no=" + refund_no
				+ ", complete_no=" + complete_no + ", pro_name=" + pro_name + ", pro_price=" + pro_price + ", waybill="
				+ waybill + ", ori_fileName=" + ori_fileName + ", progress=" + progress + ", sellerNo=" + sellerNo
				+ ", member_nick=" + member_nick + "]";
	}







	
}
