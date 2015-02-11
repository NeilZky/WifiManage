package com.wifi.entity;

import java.util.List;

public class NavPageType {

	private int id;
	private String name;
	private List<NavPage> navPages;
	
	
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

	public List<NavPage> getNavPages() {
		return navPages;
	}

	public void setNavPages(List<NavPage> navPages) {
		this.navPages = navPages;
	}

}
