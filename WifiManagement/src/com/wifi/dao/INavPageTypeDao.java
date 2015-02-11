package com.wifi.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.wifi.entity.NavPageType;

public interface INavPageTypeDao extends IBaseDao{
	
	public List<NavPageType> getTypes() throws ClassNotFoundException, SQLException;

	public int add(String name) throws ClassNotFoundException, SQLException;

	public boolean update(NavPageType navPageType)  throws ClassNotFoundException, SQLException;

	public boolean delete(ArrayList<Integer> deleteIDs)throws ClassNotFoundException, SQLException;

	public Collection<NavPageType> getNavPageTypes();
}
