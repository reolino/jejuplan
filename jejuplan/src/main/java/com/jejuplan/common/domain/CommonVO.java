package com.jejuplan.common.domain;

public class CommonVO {
	private int page = 1;
	private String userfile[];
	private String key;
	private String url;

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
	
	public String[] getUserfile() {
		return userfile;
	}
	
	public void setUserfile(String[] userfile) {
		this.userfile = userfile;
	}
	
	public String getKey() {
		return key;
	}
	
	public void setKey(String key) {
		this.key = key;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
