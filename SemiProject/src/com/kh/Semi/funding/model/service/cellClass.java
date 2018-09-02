package com.kh.Semi.funding.model.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;

import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.kh.Semi.funding.model.dao.FundingDao;

import static com.kh.Semi.common.JDBCTemplate.close;
import static com.kh.Semi.common.JDBCTemplate.commit;
import static com.kh.Semi.common.JDBCTemplate.getConnection;
import static com.kh.Semi.common.JDBCTemplate.rollback;

public class cellClass {

	//셀 값 읽기 15x15
	public String[][] viewField(String name, String path) {

		XSSFCell cell;
		int type;
		String[][] num = new String[15][15]; 
		
		try {

			FileInputStream inputStream = new FileInputStream(path+"copy"+ name +".xlsx");
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

				for(int q= 0 ; q<15; q++){
					for(int i = 0 ; i<15; i++){
						
						cell = sheet.getRow(q).getCell(i);
						
						if(!(cell.getStringCellValue().equals(".")))
							num[q][i] = cell.getStringCellValue();
						else
							num[q][i] = ".";
						
					}
				}
				evaluator.evaluateAll();	//엑셀 계산식 자동 계산
				/*System.out.println("비어있는 면적 : "+sheet.getRow(0).getCell(17).getNumericCellValue());
				System.out.println("농부가 체크한 면적: "+sheet.getRow(1).getCell(17).getNumericCellValue());
				System.out.println("구매할수 있는 면적 : "+sheet.getRow(2).getCell(17).getNumericCellValue());
				System.out.println("구매된 면적 : "+sheet.getRow(3).getCell(17).getNumericCellValue());*/
				
				
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return num;
	}
	
	
	//테이블 생성
	public int createTeble(String[] arr, String name, String path, String farmSize){
		Connection conn = getConnection();
		int result = 0;
		FileInputStream inputStream = null;
		FileOutputStream outputStream = null;
		XSSFWorkbook workbook = null;
		try {
				inputStream = new FileInputStream(path+"BasicBox.xlsx");
				workbook = new XSSFWorkbook(inputStream);
				
				XSSFSheet sheet = workbook.getSheetAt(0);	//Class Data 시트
				
				for(String num : arr){
					int n =Integer.parseInt(num)-1;
					int row = n/15;
					int col = n%15;
					sheet.getRow(row).getCell(col).setCellValue("O");	//값 넣기
				}
				sheet.getRow(5).getCell(17).setCellValue(farmSize);		//밭 면적
				
				String fileName = "copy"+ name +".xlsx";
				outputStream = new FileOutputStream(path+fileName);	//만들기
				workbook.write(outputStream);
				outputStream.close();
				
				result = new FundingDao().checkAttachFarmArea(conn, fileName);
				if(result != 0){
				}else{
					result = new FundingDao().insertAttachFarmArea(conn, fileName);
					if(result != 0){
						commit(conn);
						result = new FundingDao().checkAttachFarmArea(conn, fileName);						
					}else{
						rollback(conn);
					}
				}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				inputStream.close();
				workbook.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return result;
	}
	
	
	//셀 삽입
	public int insertCell(String[] arr, String name, String seller, String path, int payNo){

		FileInputStream inputStream = null;
		FileOutputStream outputStream = null;
		XSSFWorkbook workbook = null;
		
		int result = 0;					//성공여부
		
		try {
				inputStream = new FileInputStream(path+"copy"+seller+".xlsx");
				workbook = new XSSFWorkbook(inputStream);
				
				XSSFSheet sheet = workbook.getSheetAt(0);	//Class Data 시트
				
				for(String num : arr){
					int n =Integer.parseInt(num)-1;
					int row = n/15;
					int col = n%15;
					sheet.getRow(row).getCell(col).setCellValue(name+payNo);	//값 넣기
				}
				outputStream = new FileOutputStream(path+"copy"+ seller +".xlsx");	//만들기
				workbook.write(outputStream);
				outputStream.close();
				
				result = 1;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				inputStream.close();
				workbook.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return result;
	}

	//농장 평당 사이즈
	public int viewFieldFarmSize(String name, String path) {

		XSSFCell cell;
		int farmSize = 0;
		String[][] num = new String[15][15]; 
		
		try {

			FileInputStream inputStream = new FileInputStream(path+"copy"+ name +".xlsx");
			XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
			FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
			
			//sheet수 취득
			int sheetCn = workbook.getNumberOfSheets();

				XSSFSheet sheet = workbook.getSheetAt(0);
				int rows = sheet.getPhysicalNumberOfRows();
				int cells = sheet.getRow(0).getPhysicalNumberOfCells(); 
				
				farmSize = Integer.parseInt(sheet.getRow(5).getCell(17).getStringCellValue());
				
				evaluator.evaluateAll();	//엑셀 계산식 자동 계산
				System.out.println("비어있는 면적 : "+sheet.getRow(0).getCell(17).getNumericCellValue());
				System.out.println("농부가 체크한 면적: "+sheet.getRow(1).getCell(17).getNumericCellValue());
				System.out.println("구매할수 있는 면적 : "+sheet.getRow(2).getCell(17).getNumericCellValue());
				System.out.println("구매된 면적 : "+sheet.getRow(3).getCell(17).getNumericCellValue());
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return farmSize;
	}
	
	//해당 유저 셀 초기화
	public int resetCell(String name, String seller, String path){

		FileInputStream inputStream = null;
		FileOutputStream outputStream = null;
		XSSFWorkbook workbook = null;
		XSSFCell cell;
		int result = 0;					//성공여부
		
		try {
				inputStream = new FileInputStream(path+"copy"+seller+".xlsx");
				workbook = new XSSFWorkbook(inputStream);
				
				XSSFSheet sheet = workbook.getSheetAt(0);	//Class Data 시트

				
				for(int q= 0 ; q<15; q++){
					for(int i = 0 ; i<15; i++){
						cell = sheet.getRow(q).getCell(i);
						if(cell.getStringCellValue().equals(name)){
							cell.setCellValue("O");
							result += 1;
						}
					}
				}
				
				outputStream = new FileOutputStream(path+"copy"+ seller +".xlsx");	// 덮어쓰기
				workbook.write(outputStream);
				outputStream.close();
				
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				inputStream.close();
				workbook.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return result;
	}
	
}

