package com.kh.Semi.board.model.vo;

import java.util.Date;

public class Attachment implements java.io.Serializable{

	private int file_no;			//파일번호
	private String file_type;		//파일구분
	private String ori_fileName;	//원본파일명
	private String modi_fileName;	//수정본파일명
	private String file_route;		//파일경로
	private Date upload_date;		//입로드일시
	private String delete_check;	//삭제여부
	private int pro_detail_no;		//상품등록번호
	private int board_no;			//글번호
	
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Attachment(int file_no, String file_type, String ori_fileName, String modi_fileName, String file_route,
			Date upload_date, String delete_check, int pro_detail_no, int board_no) {
		super();
		this.file_no = file_no;
		this.file_type = file_type;
		this.ori_fileName = ori_fileName;
		this.modi_fileName = modi_fileName;
		this.file_route = file_route;
		this.upload_date = upload_date;
		this.delete_check = delete_check;
		this.pro_detail_no = pro_detail_no;
		this.board_no = board_no;
	}
	@Override
	public String toString() {
		return "Attachment [file_no=" + file_no + ", file_type=" + file_type + ", ori_fileName=" + ori_fileName
				+ ", modi_fileName=" + modi_fileName + ", file_route=" + file_route + ", upload_date=" + upload_date
				+ ", delete_check=" + delete_check + ", pro_detail_no=" + pro_detail_no + ", board_no=" + board_no
				+ "]";
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getOri_fileName() {
		return ori_fileName;
	}
	public void setOri_fileName(String ori_fileName) {
		this.ori_fileName = ori_fileName;
	}
	public String getModi_fileName() {
		return modi_fileName;
	}
	public void setModi_fileName(String modi_fileName) {
		this.modi_fileName = modi_fileName;
	}
	public String getFile_route() {
		return file_route;
	}
	public void setFile_route(String file_route) {
		this.file_route = file_route;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	public String getDelete_check() {
		return delete_check;
	}
	public void setDelete_check(String delete_check) {
		this.delete_check = delete_check;
	}
	public int getPro_detail_no() {
		return pro_detail_no;
	}
	public void setPro_detail_no(int pro_detail_no) {
		this.pro_detail_no = pro_detail_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	
	
	
}
