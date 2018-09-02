package com.kh.Semi.funding.model.service;

import static com.kh.Semi.common.JDBCTemplate.close;
import static com.kh.Semi.common.JDBCTemplate.commit;
import static com.kh.Semi.common.JDBCTemplate.getConnection;
import static com.kh.Semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.Semi.board.model.dao.BoardDao;
import com.kh.Semi.board.model.vo.Board;
import com.kh.Semi.facing.model.dao.FacingDao;
import com.kh.Semi.funding.model.dao.FundingDao;
import com.kh.Semi.funding.model.vo.MainFunding;
import com.kh.Semi.funding.model.vo.Product;
import com.kh.Semi.funding.model.vo.ProductList;

public class FundingService {

   public int insertProduct(Product pro, int attachNo, String fileName) {
      Connection con = getConnection();
      int result = 0;
      int productResult = new FundingDao().insertProduct(con, pro);
      if(productResult > 0){
         int product_No = new FundingDao().getProductNo(con);
         pro.setProduct_No(product_No);
      }
      
      
      
      
      int pro_Detail_No = 0;
      int detailResult = new FundingDao().insertProductDetail(con, pro);
      int update_AttachNo = 0;
      int insert_thumbnail = 0;
      if(detailResult > 0){
         pro_Detail_No = new FundingDao().getProDetailNo(con);
         if(attachNo != 0){		//펀딩일 경우 엑셀 파일 시퀀스번호 입력
        	 update_AttachNo = new FundingDao().updateAttachFarmNo(con, pro_Detail_No, attachNo);
         }else{					// 먹거리 일경우 미필요
        	 update_AttachNo = 1;
         }
         insert_thumbnail = new FundingDao().insertThumbnail(con, pro_Detail_No, fileName);
      }
      
      pro.setPro_Detail_No(pro_Detail_No);
      int recordResult = new FundingDao().insertProductRecord(con, pro);
      
      Board b = new Board();
      b.setPro_Detail_No(pro_Detail_No);
      b.setBoard_Content(pro.getPro_content());
      b.setMember_No(pro.getMember_No()+"");
      if(pro.getProduct_Type() != null){
         b.setBoard_Type("B5");
      }else{
         b.setBoard_Type("B4");
      }
      int boardResult = new BoardDao().insertProContent(con, b, pro);
      
      int facingResult = new FacingDao().insertAlertToAdmin(con, pro.getMember_No(), "새 상품 신청이 있습니다.");
      if(boardResult > 0 && recordResult > 0 && detailResult > 0 && productResult > 0 && update_AttachNo > 0 && insert_thumbnail > 0 && facingResult > 0){
         commit(con);
         result = 1;
      }else{
         rollback(con);
      }
      
      return result;
   }
   
   //메인 펀딩
	public HashMap<String, ArrayList<MainFunding>> mainSelect() {
		Connection conn = getConnection();
		HashMap<String, ArrayList<MainFunding>> map = new HashMap<String, ArrayList<MainFunding>>();
		
		map.put("fund1", new FundingDao().mainSelect(conn));
		map.put("food", new FundingDao().mainSelectFood(conn));
		map.put("fund2", new FundingDao().mainSelectTwo(conn));
		
		close(conn);
		return map;
	}

	//펀딩 전체 리스트 
	public ArrayList<ProductList> selectFundingListAll(String progress) {
		Connection conn = getConnection();
		ArrayList<ProductList> list = new FundingDao().selectFundingListAll(conn, progress);
		
		close(conn);
		return list;
	}

	public ArrayList<ProductList> selectFundFourListAll(int num, String progress) {
		Connection conn = getConnection();
		ArrayList<ProductList> list = new FundingDao().selectFundFourListAll(conn, num, progress);
		
		close(conn);
		return list;
	}

	public ArrayList<ProductList> selectFundingListOne(String catagory ,String progress) {
		Connection conn = getConnection();
		ArrayList<ProductList> list = new FundingDao().selectFundingListOne(conn, catagory, progress);
		
		close(conn);
		return list;
	}

	public ArrayList<ProductList> selectFundFourListOne(int num, String progress, String catagory) {
		Connection conn = getConnection();
		ArrayList<ProductList> list = new FundingDao().selectFundFourListOne(conn, num, progress, catagory);
		
		close(conn);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectAllFunding(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new FundingDao().selectAllFunding(con, memberNo);
		
		close(con);
		
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectAllProduct(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new FundingDao().selectAllProduct(con, memberNo);
		
		close(con);
		
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> refundApprove(int memberNo) {
	      Connection con = getConnection();
	      
	      ArrayList<HashMap<String, Object>> list = new FundingDao().refundApprove(con, memberNo);
	      
	      close(con);
	      
	      
	      return list;
	   }

	public int insertStory(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertStory(con, b);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	public int recordCheck(int memberNo) {
		Connection con = getConnection();
		
		int recordDate = new FundingDao().recordCheck(con, memberNo);
		
		close(con);
		
		return recordDate;
	}

	public HashMap<String, Object> modifyProduct(int detailNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = new FundingDao().modifyProduct(con, detailNo);
		
		close(con);
		
		return hmap;
	}

	public int qtyCheck(int memberNo, int proDetailNo) {
		Connection con = getConnection();
		
		int result = new FundingDao().qtyCheck(con, memberNo, proDetailNo);
		
		close(con);
		
		return result;
	}

	public int updateProduct(Product pro, String fileName) {
		Connection con = getConnection();
		int result = 0;
		int resultThumb = new FundingDao().updateThumbnail(con, pro, fileName);
		
		int resultProduct = new FundingDao().updateProduct(con, pro);
		
		int resultProDetail = new FundingDao().updateProDetail(con, pro);
		
		int resultBoard = new BoardDao().updateProduct(con, pro);
		
		int facingResult = new FacingDao().insertAlertToAdmin(con, pro.getMember_No(), "상품 수정신청이 있습니다.");
		if(resultThumb > 0 && resultProduct > 0 && resultProDetail > 0 && resultBoard > 0 && facingResult > 0){
			result = 1;
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteProduct(int productNo, int member_no) {
		Connection con = getConnection();
		int result = new FundingDao().deleteProduct(con, productNo);
		int facingResult = new FacingDao().insertAlertToAdmin(con, member_no, "상품 삭제 신청이 있습니다.");
		if(result > 0 && facingResult > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int getProductNo(int proDetailNo) {
		Connection con = getConnection();
		int productNo = new FundingDao().getAppProductNo(con, proDetailNo);
		
		close(con);
		
		return productNo;
	}

	public int progChange(String prog, int detailNo) {
		Connection con = getConnection();
		
		int result = new FundingDao().progChange(con, prog, detailNo);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<ProductList> selectFoodingListAll() {
		Connection conn = getConnection();
		ArrayList<ProductList> list = new FundingDao().selectFoodingListAll(conn);
		close(conn);
		return list;
	}

	public ArrayList<ProductList> selectFoodFourListAll(int num) {
		Connection conn = getConnection();
		ArrayList<ProductList> list = new FundingDao().selectFoodFourListAll(conn, num);
		
		close(conn);
		return list;
	}

	public ArrayList<HashMap<String, Object>> getFundingApprove() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new FundingDao().getFundingApprove(con);
		
		close(con);
		return list;
	}

	public int productApprove(int product_no, int pro_detail_no) {
		Connection con = getConnection();
		int result = 0;
		int proResult = new FundingDao().productApprove(con, product_no);
		
		int recordResult = new FundingDao().proRecordUpdate(con, pro_detail_no);
		
		int member_no = new FundingDao().getMemberNo(con, pro_detail_no);
		int resultFacing = new FacingDao().insertAlertToSeller(con, member_no, "신청 상품이 승인되었습니다.");
		
		if(proResult > 0 && recordResult > 0 && resultFacing > 0){
			result = 1;
			commit(con);
		}else{
			rollback(con);
		}
		
		return result;
	}

	public int productReject(int product_no, int pro_detail_no) {
		Connection con = getConnection();
		int result = new FundingDao().productReject(con, product_no);
		int member_no = new FundingDao().getMemberNo(con, pro_detail_no);
		int resultFacing = new FacingDao().insertAlertToSeller(con, member_no, "신청 상품이 승인되지 않았습니다.");
		
		if(result > 0 && resultFacing > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> getProductApprove() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new FundingDao().getProductApprove(con);
		
		close(con);
    return list;
	}
	public ArrayList<ProductList> selectFoodFourListOne(int num, String catagory) {
		Connection conn = getConnection();
		ArrayList<ProductList> list = new FundingDao().selectFoodFourListOne(conn, num, catagory);
		
		close(conn);
		return list;
	}

	public ArrayList<ProductList> selectFoodListOne(String catagory) {
		Connection conn = getConnection();
		ArrayList<ProductList> list = new FundingDao().selectFoodListOne(conn, catagory);
		
		close(conn);
		return list;
	}

	public HashMap<String, Object> getCategoryChart(int memberNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> h = new FundingDao().getCategoryChart(con, memberNo);
		
		close(con);
		
  	return h;
}

	public int sellerFundingUsedCheck(int no) {
		Connection conn = getConnection();
		int result = new FundingDao().sellerFundingUsedCheck(conn, no);
		
		close(conn);
		return result;

	}

	public HashMap<String, Object> getMonthTotal(int memberNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> h = new FundingDao().getMonthTotal(con, memberNo);
		
		close(con);
		
		return h;
	}

	public HashMap<String, Object> getYearTotal(int memberNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> h = new FundingDao().getYearTotal(con, memberNo);
		
		close(con);
		
		return h;
	}

	public ArrayList<HashMap<String, Object>> getCompareMonth(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new FundingDao().getCompareMonth(con, memberNo);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> getAdminCategoryChart() {
		Connection con = getConnection();
		
		HashMap<String, Object> h = new FundingDao().getAdminCategoryChart(con);
		
		close(con);
		
		return h;
	}

	public HashMap<String, Object> getAdminMonthTotal() {
		Connection con = getConnection();
		
		HashMap<String, Object> h = new FundingDao().getAdminMonthTotal(con);
		
		close(con);
		
		return h;
	}

	public HashMap<String, Object> getAdminYearTotal() {
		Connection con = getConnection();
		
		HashMap<String, Object> h = new FundingDao().getAdminYearTotal(con);
		
		close(con);
		
		return h;
	}
}