package com.kh.Semi.payment.model.service;
 
import java.util.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
 
public class WaybillExcel {
 
	public ArrayList<HashMap<String, Object>> getExcelfile(String name, String path) {
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> h = null;
		XSSFCell cell = null;
		String root = name + path;
		try {

			FileInputStream inputStream = new FileInputStream(root);
			XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
			FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
			
			//sheet수 취득
			int sheetCn = workbook.getNumberOfSheets();

			//0번째 sheet 정보 취득
			XSSFSheet sheet = workbook.getSheetAt(0);

			//취득된 sheet에서 rows수 취득
			int rows = sheet.getPhysicalNumberOfRows();

			//취득된 row에서 취득대상 cell수 취득
			int cells = sheet.getRow(0).getPhysicalNumberOfCells(); 
			if(cells > 0){
				list = new ArrayList<HashMap<String, Object>>();
				for(int i = 1; i < rows; i++){
					
					h = new HashMap<String, Object>();
					h.put("delivery_no", sheet.getRow(i).getCell(0).getNumericCellValue()+"");
					h.put("waybill", sheet.getRow(i).getCell(7).getNumericCellValue());
					
					list.add(h);
				}
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public String WaybillCreate(ArrayList<HashMap<String, Object>> list, String root) {
		//임의의 VO가 되주는 MAP 객체
		Map<String,Object>map=null;
		//가상 DB조회후 목록을 담을 LIST객체
		ArrayList<String> columnList=new ArrayList<String>();
		
		//MAP의 KEY값을 담기위함
		if(list !=null &&list.size() >0){
		    //LIST의 첫번째 데이터의 KEY값만 알면 되므로
		    Map<String,Object>m=list.get(0);
		    //MAP의 KEY값을 columnList객체에 ADD
		    for(String k : m.keySet()){
		        columnList.add(k);
		    }
		}
		ArrayList<String> sortList=new ArrayList<String>();
		sortList.add(columnList.get(6));
		sortList.add(columnList.get(7));
		sortList.add(columnList.get(3));
		sortList.add(columnList.get(1));
		sortList.add(columnList.get(0));
		sortList.add(columnList.get(4));
		sortList.add(columnList.get(5));
		sortList.add(columnList.get(2));
		//1차로 workbook을 생성
		XSSFWorkbook workbook=new XSSFWorkbook();
		//2차는 sheet생성
		XSSFSheet sheet=workbook.createSheet("시트명");
		//엑셀의 행
		XSSFRow row=null;
		//엑셀의 셀
		XSSFCell cell=null;
		//보호를 위한 셀 잠금
		CellStyle unlockedCellStyle = workbook.createCellStyle();
		unlockedCellStyle.setLocked(false);
		XSSFCellStyle cs = workbook.createCellStyle();
		XSSFDataFormat df = (XSSFDataFormat) workbook.createDataFormat();
	    cs.setDataFormat(df.getFormat("0"));
		sheet.protectSheet("password");
		
		//임의의 DB데이터 조회
		if(list !=null &&list.size() >0){
				row = sheet.createRow(0);
				cell = row.createCell(0);
				cell.setCellValue("배송번호");
				cell = row.createCell(1);
				cell.setCellValue("상품이름");
				cell = row.createCell(2);
				cell.setCellValue("구매수량");
				cell = row.createCell(3);
				cell.setCellValue("구매일자");
				cell = row.createCell(4);
				cell.setCellValue("구매자 ID");
				cell = row.createCell(5);
				cell.setCellValue("구매자 이름");
				cell = row.createCell(6);
				cell.setCellValue("배송지");
				cell = row.createCell(7);
				cell.setCellValue("운송장번호");
		    int i=1;
		    for(Map<String,Object>mapobject : list){
		        // 시트에 하나의 행을 생성한다(i 값이 0이면 첫번째 줄에 해당)
		        row=sheet.createRow((short)i);
		        i++;
		        if(sortList !=null &&sortList.size() >0){
		            for(int j=0;j<sortList.size();j++){
		                //생성된 row에 컬럼을 생성한다
		                cell=row.createCell(j);
		                //map에 담긴 데이터를 가져와 cell에 add한다
		                switch(j){
		                case 0 : cell.setCellValue(Integer.parseInt(mapobject.get(sortList.get(j)).toString())); break;
		                case 7 : cell.setCellStyle(unlockedCellStyle); break;
		                default : cell.setCellValue(String.valueOf(mapobject.get(sortList.get(j)))); break;
		                }
		            }
		        }
		    }
		}
		String fileName = "waybillForm.xlsx";
		String filePath = root + fileName;
		//파일을 쓴다
		try(FileOutputStream fileoutputstream=new FileOutputStream(filePath)) {
			workbook.write(fileoutputstream);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		//필수로 닫아주어야함
		System.out.println("엑셀파일생성성공");

		return fileName;
	}
}