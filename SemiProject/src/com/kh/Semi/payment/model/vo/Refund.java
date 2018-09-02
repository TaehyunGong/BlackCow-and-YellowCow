package com.kh.Semi.payment.model.vo;

public class Refund implements java.io.Serializable{

	private String imp ;			//결제번호
	private String productType; 	// 펀딩 아님 먹거리
	private int payNo;		//해당 구매 번호
	private String user_nick;	//환불할 유저의 닉네임
	private int amount;			//수량
	private String seller_Id; //판매자 아이디
	private int payment_Record_seq; //PAYMENT_RECORD의 시퀀스
	
	
	public int getPayment_Record_seq() {
		return payment_Record_seq;
	}
	public void setPayment_Record_seq(int payment_Record_seq) {
		this.payment_Record_seq = payment_Record_seq;
	}
	public String getSeller_Id() {
		return seller_Id;
	}
	public void setSeller_Id(String seller_Id) {
		this.seller_Id = seller_Id;
	}
	public Refund() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getImp() {
		return imp;
	}
	public void setImp(String imp) {
		this.imp = imp;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Refund [imp=" + imp + ", productType=" + productType + ", payNo=" + payNo + ", user_nick=" + user_nick
				+ ", amount=" + amount + ", refund_User=" + seller_Id + "]";
	}
	public Refund(String imp, String productType, int payNo, String user_nick, int amount) {
		super();
		this.imp = imp;
		this.productType = productType;
		this.payNo = payNo;
		this.user_nick = user_nick;
		this.amount = amount;
	}
	
	
}
