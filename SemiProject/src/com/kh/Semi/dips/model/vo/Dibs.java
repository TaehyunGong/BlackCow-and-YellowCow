package com.kh.Semi.dips.model.vo;

import java.sql.Date;

public class Dibs implements java.io.Serializable{

	private int dibs_no;
	private int member_no;
	private int pro_detail_no;
	private int ranks;
	private String pro_name;
	private int pro_count;
	private int pro_qty;
	private Date pro_date;
	private int pro_price;
	private String ori_fileName;
	private String progress;
	private String pro_content;
	private String member_nick;
	private int product_no;
	
	
	public Dibs() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	



	public Dibs(int dibs_no, int member_no, int pro_detail_no, int ranks, String pro_name, int pro_count, int pro_qty,
			Date pro_date, int pro_price, String ori_fileName, String progress, String pro_content, String member_nick,
			int product_no) {
		super();
		this.dibs_no = dibs_no;
		this.member_no = member_no;
		this.pro_detail_no = pro_detail_no;
		this.ranks = ranks;
		this.pro_name = pro_name;
		this.pro_count = pro_count;
		this.pro_qty = pro_qty;
		this.pro_date = pro_date;
		this.pro_price = pro_price;
		this.ori_fileName = ori_fileName;
		this.progress = progress;
		this.pro_content = pro_content;
		this.member_nick = member_nick;
		this.product_no = product_no;
	}





	public Dibs(int dibs_no, int member_no, int pro_detail_no, int ranks, String pro_name, int pro_count, int pro_qty,
			Date pro_date, int pro_price, String ori_fileName, String progress, String pro_content) {
		super();
		this.dibs_no = dibs_no;
		this.member_no = member_no;
		this.pro_detail_no = pro_detail_no;
		this.ranks = ranks;
		this.pro_name = pro_name;
		this.pro_count = pro_count;
		this.pro_qty = pro_qty;
		this.pro_date = pro_date;
		this.pro_price = pro_price;
		this.ori_fileName = ori_fileName;
		this.progress = progress;
		this.pro_content = pro_content;
	}
	
	
	
	public int getProduct_no() {
		return product_no;
	}



	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}





	public String getMember_nick() {
		return member_nick;
	}


	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}


	public int getRanks() {
		return ranks;
	}

	public void setRanks(int ranks) {
		this.ranks = ranks;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public int getPro_count() {
		return pro_count;
	}

	public void setPro_count(int pro_count) {
		this.pro_count = pro_count;
	}

	public int getPro_qty() {
		return pro_qty;
	}

	public void setPro_qty(int pro_qty) {
		this.pro_qty = pro_qty;
	}

	public Date getPro_date() {
		return pro_date;
	}

	public void setPro_date(Date pro_date) {
		this.pro_date = pro_date;
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

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getPro_content() {
		return pro_content;
	}

	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}

	public int getDibs_no() {
		return dibs_no;
	}
	public void setDibs_no(int dibs_no) {
		this.dibs_no = dibs_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getPro_detail_no() {
		return pro_detail_no;
	}
	public void setPro_detail_no(int pro_detail_no) {
		this.pro_detail_no = pro_detail_no;
	}


	@Override
	public String toString() {
		return "Dibs [dibs_no=" + dibs_no + ", member_no=" + member_no + ", pro_detail_no=" + pro_detail_no + ", ranks="
				+ ranks + ", pro_name=" + pro_name + ", pro_count=" + pro_count + ", pro_qty=" + pro_qty + ", pro_date="
				+ pro_date + ", pro_price=" + pro_price + ", ori_fileName=" + ori_fileName + ", progress=" + progress
				+ ", pro_content=" + pro_content + ", member_nick=" + member_nick + "]";
	}



	
	
	
}
