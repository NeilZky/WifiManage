package com.wifi.dao;

import java.sql.SQLException;
import java.util.List;

import com.wifi.entity.NavPage;


public interface INavPageDao extends IBaseDao{
	
	public List<NavPage> getNavPages();

	int add(NavPage navPage) throws ClassNotFoundException, SQLException;

	public boolean update(NavPage navPage)  throws ClassNotFoundException, SQLException;;
}
