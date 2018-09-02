package com.kh.Semi.payment.model.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WaybillDelete {
	public void waybillDel(String savePath, String fileName) throws ServletException, IOException {
		String name = fileName;
		String root = savePath;
		
		String del = root+name;
		File deleteFile = new File(del);
		deleteFile.delete();
		
		
	}
}
