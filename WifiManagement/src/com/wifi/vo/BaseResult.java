package com.wifi.vo;

public class BaseResult {
	
	public static final int CODE_SUCCESS = 1;
	public static final int CODE_FAILURE = 2;
	
	private String info;
	private int code;
	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
}
