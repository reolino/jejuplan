package com.jejuplan.common.domain;

public class commonVO {
	private int page ;

	public int getPage() {
		return page;
	}
	public int getPre_no() {
		return (page-1) * 10;
	}

	public int getNext_no() {
		return page * 10;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
}
