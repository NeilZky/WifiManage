package com.wifi.dao;

import java.util.List;

import com.wifi.entity.PageCount;

public interface  IPageCountDao{
	
	public void createIfNotExist();
	public void addCountByDate(int addPv, int addUiv);
	public PageCount getByDate(String date);
	public List<PageCount> getByDate(String beginDate, String endDate, int limit);
	List<PageCount> getListByDate(int limit);
	void createIfNotExist(String date);
}
