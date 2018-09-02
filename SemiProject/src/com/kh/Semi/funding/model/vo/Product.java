package com.kh.Semi.funding.model.vo;

import java.sql.Date;

public class Product {
   private int product_No;
   private String product_Type;
   private String funding_Type;
   private String category;
   private int pro_Detail_No;
   private int member_No;
   private String pro_Name;
   private Date pro_Date;
   private Date deadline;
   private int pro_Price;
   private int pro_Count;
   private String progress;
   private String pro_content;
   
   public Product(){}

   public Product(int product_No, String product_Type, String funding_Type, String category, int pro_Detail_No,
		int member_No, String pro_Name, Date pro_Date, Date deadline, int pro_Price, int pro_Count, String progress,
		String pro_content) {
	super();
	this.product_No = product_No;
	this.product_Type = product_Type;
	this.funding_Type = funding_Type;
	this.category = category;
	this.pro_Detail_No = pro_Detail_No;
	this.member_No = member_No;
	this.pro_Name = pro_Name;
	this.pro_Date = pro_Date;
	this.deadline = deadline;
	this.pro_Price = pro_Price;
	this.pro_Count = pro_Count;
	this.progress = progress;
	this.pro_content = pro_content;
}

   

   @Override
	public String toString() {
		return "Product [product_No=" + product_No + ", product_Type=" + product_Type + ", funding_Type=" + funding_Type
				+ ", category=" + category + ", pro_Detail_No=" + pro_Detail_No + ", member_No=" + member_No + ", pro_Name="
				+ pro_Name + ", pro_Date=" + pro_Date + ", deadline=" + deadline + ", pro_Price=" + pro_Price
				+ ", pro_Count=" + pro_Count + ", progress=" + progress + ", pro_content=" + pro_content + "]";
	}
	
   
   
	public Date getDeadline() {
	return deadline;
	}
	
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getPro_content() {
      return pro_content;
   }

   public void setPro_content(String pro_content) {
      this.pro_content = pro_content;
   }

   public int getProduct_No() {
      return product_No;
   }

   public void setProduct_No(int product_No) {
      this.product_No = product_No;
   }

   public String getProduct_Type() {
      return product_Type;
   }

   public void setProduct_Type(String product_Type) {
      this.product_Type = product_Type;
   }

   public String getFunding_Type() {
      return funding_Type;
   }

   public void setFunding_Type(String funding_Type) {
      this.funding_Type = funding_Type;
   }

   public String getCategory() {
      return category;
   }

   public void setCategory(String category) {
      this.category = category;
   }

   public int getPro_Detail_No() {
      return pro_Detail_No;
   }

   public void setPro_Detail_No(int pro_Detail_No) {
      this.pro_Detail_No = pro_Detail_No;
   }

   public int getMember_No() {
      return member_No;
   }

   public void setMember_No(int member_No) {
      this.member_No = member_No;
   }

   public String getPro_Name() {
      return pro_Name;
   }

   public void setPro_Name(String pro_Name) {
      this.pro_Name = pro_Name;
   }

   public Date getPro_Date() {
      return pro_Date;
   }

   public void setPro_Date(Date pro_Date) {
      this.pro_Date = pro_Date;
   }

   public int getPro_Price() {
      return pro_Price;
   }

   public void setPro_Price(int pro_Price) {
      this.pro_Price = pro_Price;
   }

   public int getPro_Count() {
      return pro_Count;
   }

   public void setPro_Count(int pro_Count) {
      this.pro_Count = pro_Count;
   }

   public String getProgress() {
      return progress;
   }

   public void setProgress(String progress) {
      this.progress = progress;
   }

   
   
   
   
}