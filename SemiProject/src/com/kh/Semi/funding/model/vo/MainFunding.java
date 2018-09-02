package com.kh.Semi.funding.model.vo;

public class MainFunding implements java.io.Serializable{

	private int pro_detail_no;		//상품 번호
	private String pro_name;		//상품 제목
	private int pro_price;			//상품 가격
	private int pro_count;			//상품 갯수
	private int pro_qty;			//상품 잔역갯수
	private String pro_date;		//상품 등록일
	private String ori_fileName;	//상품 이미지 파일명
	private int percent_qty;		//상품 인기 퍼센테이지
	private String progress;		//진행수준
	
	public MainFunding() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public int getPercent_qty() {
		return percent_qty;
	}


	public void setPercent_qty(int percent_qty) {
		this.percent_qty = percent_qty;
	}

	public String getProgress() {
		return progress;
	}


	public void setProgress(String progress) {
		this.progress = progress;
	}


	public MainFunding(int pro_detail_no, String pro_name, int pro_price, int pro_count, int pro_qty, String pro_date,
			String ori_fileName) {
		super();
		this.pro_detail_no = pro_detail_no;
		this.pro_name = pro_name;
		this.pro_price = pro_price;
		this.pro_count = pro_count;
		this.pro_qty = pro_qty;
		this.pro_date = pro_date;
		this.ori_fileName = ori_fileName;
	}

	@Override
	public String toString() {
		return "MainFunding [pro_detail_no=" + pro_detail_no + ", pro_name=" + pro_name + ", pro_price=" + pro_price
				+ ", pro_count=" + pro_count + ", pro_qty=" + pro_qty + ", pro_date=" + pro_date + ", ori_fileName="
				+ ori_fileName + "] AND " + progress;
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
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
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
	public String getPro_date() {
		return pro_date;
	}
	public void setPro_date(String pro_date) {
		this.pro_date = pro_date;
	}
	public String getOri_fileName() {
		return ori_fileName;
	}
	public void setOri_fileName(String ori_fileName) {
		this.ori_fileName = ori_fileName;
	}
	
	
}
