package com.wifi.vo;

import com.wifi.entity.User;

public class AddUserResult extends BaseResult {

	private User user;
	private String url;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
