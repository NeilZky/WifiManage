package com.wifi.dao;

import java.sql.SQLException;

import com.wifi.entity.SellerConfig;

public interface ISellerConfigDao {
	
	public int update(SellerConfig config);
	public SellerConfig getSellerConfigByUserId(int userid) throws ClassNotFoundException, SQLException;
	public int create(int userId) throws ClassNotFoundException, SQLException;
	public int createIfNotExist(int userId) throws  ClassNotFoundException, SQLException;
}
