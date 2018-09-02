package com.kh.Semi.basket.model.vo;

public class Basket implements java.io.Serializable {

   private int bas_num;
   private int cart_no;
   private int pro_detail_no;
   private String progress;
   private int price;
   private String pro_title;
   private int product_count;
   private String ori_filename;
   private int member_no;
   private int product_sum;
   private int product_no;
   
   public Basket()
   {
      
   }



   public Basket(int bas_num, int cart_no, int pro_detail_no, String progress, int price, String pro_title,
		int product_count, String ori_filename, int member_no, int product_sum, int product_no) {
	super();
	this.bas_num = bas_num;
	this.cart_no = cart_no;
	this.pro_detail_no = pro_detail_no;
	this.progress = progress;
	this.price = price;
	this.pro_title = pro_title;
	this.product_count = product_count;
	this.ori_filename = ori_filename;
	this.member_no = member_no;
	this.product_sum = product_sum;
	this.product_no = product_no;
}



public int getProduct_no() {
	return product_no;
}



public void setProduct_no(int product_no) {
	this.product_no = product_no;
}



public String getPro_title() {
      return pro_title;
   }



   public void setPro_title(String pro_title) {
      this.pro_title = pro_title;
   }



   public int getProduct_sum() {
      return product_sum;
   }


   public void setProduct_sum(int product_sum) {
      this.product_sum = product_sum;
   }






   public int getMember_no() {
      return member_no;
   }


   public void setMember_no(int member_no) {
      this.member_no = member_no;
   }



   public int getBas_num() {
      return bas_num;
   }


   public void setBas_num(int bas_num) {
      this.bas_num = bas_num;
   }

   public int getCart_no() {
      return cart_no;
   }


   public void setCart_no(int cart_no) {
      this.cart_no = cart_no;
   }


   public int getProduct_count() {
      return product_count;
   }


   public void setProduct_count(int product_count) {
      this.product_count = product_count;
   }


   public String getOri_filename() {
      return ori_filename;
   }


   public void setOri_filename(String ori_filename) {
      this.ori_filename = ori_filename;
   }






   public int getPro_detail_no() {
      return pro_detail_no;
   }


   public void setPro_detail_no(int pro_detail_no) {
      this.pro_detail_no = pro_detail_no;
   }


   public String getProgress() {
      return progress;
   }


   public void setProgress(String progress) {
      this.progress = progress;
   }




   public int getPrice() {
      return price;
   }




   public void setPrice(int price) {
      this.price = price;
   }

@Override
public String toString() {
	return "Basket [bas_num=" + bas_num + ", cart_no=" + cart_no + ", pro_detail_no=" + pro_detail_no + ", progress="
			+ progress + ", price=" + price + ", pro_title=" + pro_title + ", product_count=" + product_count
			+ ", ori_filename=" + ori_filename + ", member_no=" + member_no + ", product_sum=" + product_sum + "]";
}










   


}