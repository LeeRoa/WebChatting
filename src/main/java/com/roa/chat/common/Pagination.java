package com.roa.chat.common;

public class Pagination {
	
	private int size;
	private int currPage;
	private int firstPage;
	private int lastPage;
	
	public Pagination(int size, int currPage) {
		this.size = size;
	}
	
	public int getCurrpage() {
		return currPage;
	}
	public void setCurrpage(int currPage) {
		this.currPage = currPage;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getPageCount(int post_count) {
		return post_count % size != 0 ? post_count / size + 1 : post_count / size;
	}
}
