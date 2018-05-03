package com.home.first.paging;

public class Paging {
	int maxPost;
	int firstPageNo;
	int prePageNo;
	int	startPageNo;
	int	currentPageNo;
	int	endPageNo;
	int	nextPageNo;
	int	finalPageNo;
	int	numberOfRecords;
	int	sizeOfPage;
	
	public Paging(int currentPageNo, int maxPost) {
		this.currentPageNo = currentPageNo;
		this.sizeOfPage = 5;
		this.maxPost = (maxPost != 0) ? maxPost : 10;
	}
	public int getMaxPost() {
		return maxPost;
	}
	public void setMaxPost(int maxPost) {
		this.maxPost = maxPost;
	}
	public int getFirstPageNo() {
		return firstPageNo;
	}
	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}
	public int getPrePageNo() {
		return prePageNo;
	}
	public void setPrePageNo(int prePageNo) {
		this.prePageNo = prePageNo;
	}
	public int getStartPageNo() {
		return startPageNo;
	}
	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}
	public int getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	public int getEndPageNo() {
		return endPageNo;
	}
	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}
	public int getNextPageNo() {
		return nextPageNo;
	}
	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}
	public int getFinalPageNo() {
		return finalPageNo;
	}
	public void setFinalPageNo(int finalPageNo) {
		this.finalPageNo = finalPageNo;
	}
	public int getNumberOfRecords() {
		return numberOfRecords;
	}
	public void setNumberOfRecords(int numberOfRecords) {
		this.numberOfRecords = numberOfRecords;
	}
	public int getSizeOfPage() {
		return sizeOfPage;
	}
	public void setSizeOfPage(int sizeOfPage) {
		this.sizeOfPage = sizeOfPage;
	}	
	public void makePaging() {
		if(numberOfRecords == 0)
			return;
		if(currentPageNo == 0)
			setCurrentPageNo(1);
		if(maxPost == 0)
			setMaxPost(10);
		int finalPage = (numberOfRecords + (maxPost -1)) / maxPost;
		
		if(currentPageNo > finalPage)
			setCurrentPageNo(finalPage);
		if(currentPageNo < 0)
			currentPageNo = 1;
		boolean isNowFirst = currentPageNo == 1 ? true : false;
		boolean isNowFinal = currentPageNo == finalPage ? true : false;
		
		int startPage = ((currentPageNo -1) / sizeOfPage) * sizeOfPage+1;
		int endPage = startPage + sizeOfPage -1;
		
		if(endPage > finalPage)
			endPage = finalPage;
		
		setFirstPageNo(1);
		
		if(!isNowFirst)
			setPrePageNo(((startPage-1) < 1 ? 1 : (startPage -1)));
		
		setStartPageNo(startPage);
		setEndPageNo(endPage);
		
		if(!isNowFinal)
			setNextPageNo(((endPage-1)<1?1:(startPage-1)));
		setFinalPageNo(finalPage);
	}
}
