package com.kh.Semi.board.model.vo;

public class PageInfo implements java.io.Serializable{
	
	private int currentPage;
	private int limit;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int listCount;
	
	public PageInfo(){}

	public PageInfo(int currentPage, int limit, int maxPage, int startPage, int endPage, int listCount) {
		super();
		this.currentPage = currentPage;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", limit=" + limit + ", maxPage=" + maxPage + ", startPage="
				+ startPage + ", endPage=" + endPage + ", listCount=" + listCount + "]";
	}
	
	
	
	

}
