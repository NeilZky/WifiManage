package com.wifi.entity;

public class NavPage {

	private int id;
	private String name;
	private String photoUrl;
	private String linkUrl;
	private NavPageType navPageType;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public NavPageType getNavPageType() {
		return navPageType;
	}

	public void setNavPageType(NavPageType navPageType) {
		this.navPageType = navPageType;
	}
	
}
