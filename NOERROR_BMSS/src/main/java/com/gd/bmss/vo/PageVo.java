package com.gd.bmss.vo;

public class PageVo {
	private int page; // 현재 페이지
	private int countList;// 한 페이지에 보여지는 게시글의 갯수
	private int totalCount; // 총 게시글의 갯수
	
	private int countPage; // 화면에 몇 개의 페이지 그룹을 보여줄지
	private int totalPage; // 게시글에서 연산된 보여줘야 할 총 page의 갯수
	
	private int startPage; // 현재 페이지의 시작 번호
	private int endPage; // 현재 페이지의 끝 번호
	
	public PageVo() {
		
	}

	@Override
	public String toString() {
		return "Paging [page=" + page + ", countList=" + countList + ", totalCount=" + totalCount + ", countPage="
				+ countPage + ", totalPage=" + totalPage + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page<1) {
			this.page = 1;
		} else if(page>totalPage) {
			this.page = totalPage;
		} else {
			this.page = page;			
		}
	}

	public int getCountList() {
		return countList;
	}

	public void setCountList(int countList) {
		this.countList = countList;
	}

	public int getCountPage() {
		return countPage;
	}

	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		int totalPageResult = totalCount/countList;
		this.totalPage = (totalCount%countList!=0)?totalPageResult+1:totalPageResult;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		int startPageResult = ((page-1)/countPage)*countPage+1;
		this.startPage = startPageResult;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		int endPageResult = startPage+countPage-1;
		this.endPage = endPageResult>totalPage?totalPage:endPageResult;
	}
}
