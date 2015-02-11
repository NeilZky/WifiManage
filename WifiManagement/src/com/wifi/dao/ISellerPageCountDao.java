package com.wifi.dao;

import java.util.List;

import com.wifi.entity.PageCount;

public interface  ISellerPageCountDao{
	
	public void createIfNotExist(int uid);
	public void addCountByDate(int uid ,int addPv, int addUiv);
	public PageCount getByDate(int uid, String date);
	public List<PageCount> getByDate(int uid, String beginDate, String endDate,
			int limit);
	public void createIfNotExist(int uid, String date);
}
