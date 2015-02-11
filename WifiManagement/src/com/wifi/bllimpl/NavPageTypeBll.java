package com.wifi.bllimpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wifi.bll.INavPageTypeBll;
import com.wifi.dao.INavPageTypeDao;
import com.wifi.daoimpl.NavPageTypeDao;
import com.wifi.entity.NavPageType;

public class NavPageTypeBll implements INavPageTypeBll{

	private INavPageTypeDao navPageTypeDao = new NavPageTypeDao();
	
	@Override
	public List<NavPageType> getTypes() throws ClassNotFoundException,
			SQLException {
		
		return navPageTypeDao.getTypes();
	}

	@Override
	public int add(String name) throws ClassNotFoundException, SQLException {
		return navPageTypeDao.add(name);
	}

	@Override
	public boolean update(NavPageType navPageType)
			throws ClassNotFoundException, SQLException {
		return navPageTypeDao.update(navPageType);
	}

	@Override
	public boolean delete(ArrayList<Integer> deleteIDs)
			throws ClassNotFoundException, SQLException {
		return navPageTypeDao.delete(deleteIDs);
	}

}
