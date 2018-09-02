package com.kh.Semi.board.model.vo;

import java.sql.Date;

public class Attach implements java.io.Serializable{
	
	private int File_No;
	private String file_Type;
	private String ori_FileName;
	private String modi_FileName;
	private String file_Route;
	private Date upload_Date;
	private String status;
	private int pro_Detail_No;
	private int board_No;
	
	public Attach(){}

	public Attach(int file_No, String file_Type, String ori_FileName, String modi_FileName, String file_Route,
			Date upload_Date, String status, int pro_Detail_No, int board_No) {
		super();
		File_No = file_No;
		this.file_Type = file_Type;
		this.ori_FileName = ori_FileName;
		this.modi_FileName = modi_FileName;
		this.file_Route = file_Route;
		this.upload_Date = upload_Date;
		this.status = status;
		this.pro_Detail_No = pro_Detail_No;
		this.board_No = board_No;
	}

	public int getFile_No() {
		return File_No;
	}

	public void setFile_No(int file_No) {
		File_No = file_No;
	}

	public String getFile_Type() {
		return file_Type;
	}

	public void setFile_Type(String file_Type) {
		this.file_Type = file_Type;
	}

	public String getOri_FileName() {
		return ori_FileName;
	}

	public void setOri_FileName(String ori_FileName) {
		this.ori_FileName = ori_FileName;
	}

	public String getModi_FileName() {
		return modi_FileName;
	}

	public void setModi_FileName(String modi_FileName) {
		this.modi_FileName = modi_FileName;
	}

	public String getFile_Route() {
		return file_Route;
	}

	public void setFile_Route(String file_Route) {
		this.file_Route = file_Route;
	}

	public Date getUpload_Date() {
		return upload_Date;
	}

	public void setUpload_Date(Date upload_Date) {
		this.upload_Date = upload_Date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPro_Detail_No() {
		return pro_Detail_No;
	}

	public void setPro_Detail_No(int pro_Detail_No) {
		this.pro_Detail_No = pro_Detail_No;
	}

	public int getBoard_No() {
		return board_No;
	}

	public void setBoard_No(int board_No) {
		this.board_No = board_No;
	}

	@Override
	public String toString() {
		return "Attach [File_No=" + File_No + ", file_Type=" + file_Type + ", ori_FileName=" + ori_FileName
				+ ", modi_FileName=" + modi_FileName + ", file_Route=" + file_Route + ", upload_Date=" + upload_Date
				+ ", status=" + status + ", pro_Detail_No=" + pro_Detail_No + ", board_No=" + board_No + "]";
	}
	
	
	
	
	
	
	
	
	
	

}
