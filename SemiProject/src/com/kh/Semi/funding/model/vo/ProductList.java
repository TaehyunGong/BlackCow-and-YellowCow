package com.kh.Semi.funding.model.vo;

import java.sql.Date;

public class ProductList implements java.io.Serializable{

	private int pro_detail_no;
	private int ranks;
	private String pro_name;
	private int pro_count;
	private int pro_qty;
	private Date pro_date;
	private int pro_price;
	private String ori_fileName;
	private String progress;
	private String sellerName;
	
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	public ProductList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public int getPro_detail_no() {
		return pro_detail_no;
	}
	public void setPro_detail_no(int pro_detail_no) {
		this.pro_detail_no = pro_detail_no;
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
	@Override
	public String toString() {
		return "ProductList [pro_detail_no=" + pro_detail_no + ", ranks=" + ranks + ", pro_name=" + pro_name
				+ ", pro_count=" + pro_count + ", pro_qty=" + pro_qty + ", pro_date=" + pro_date + ", pro_price="
				+ pro_price + ", ori_fileName=" + ori_fileName + "]";
	}
	public ProductList(int pro_detail_no, int ranks, String pro_name, int pro_count, int pro_qty, Date pro_date,
			int pro_price, String ori_fileName) {
		super();
		this.pro_detail_no = pro_detail_no;
		this.ranks = ranks;
		this.pro_name = pro_name;
		this.pro_count = pro_count;
		this.pro_qty = pro_qty;
		this.pro_date = pro_date;
		this.pro_price = pro_price;
		this.ori_fileName = ori_fileName;
	}
	
	
	
}
