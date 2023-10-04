package com.gd.bmss.vo;

//TODO 18_02 페이징 처리를 위한 VO
public class Paging_Vo {
	
	private int page;
	private int countList;
	
	private int totalCount;
	
	private int countPage;
	private int totalPage;
	private int startPage;
	private int endPage;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(totalPage < page) {
			page = totalPage;
		}
		this.page = page;
	}
	public int getCountList() {
		return countList;
	}
	public void setCountList(int countList) {
		this.countList = countList;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCountPage() {
		return countPage;
	}
	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		int totalPageResult = totalCount/countList;
		if(totalCount%countList >0) {
			totalPageResult++;
		}
		this.totalPage = totalPageResult;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int stagePage) {
		int stagePageResult = ((page-1)/countPage)*countPage+1;
		this.startPage = stagePageResult;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		
		int endPageResult = startPage+countPage-1;
		if(endPageResult > totalPage) {
			endPageResult = totalPage;
		}
		
		this.endPage = endPageResult;
	}
	
	@Override
	public String toString() {
		return "Paging_Vo [page=" + page + ", countList=" + countList + ", totalCount=" + totalCount + ", countPage="
				+ countPage + ", totalPage=" + totalPage + ", stagePage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
}
