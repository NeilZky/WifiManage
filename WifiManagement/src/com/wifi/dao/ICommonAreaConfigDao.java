package com.wifi.dao;

import java.sql.SQLException;

import com.wifi.entity.CommonAreaConfig;

public interface ICommonAreaConfigDao {
	
	public int update(CommonAreaConfig config);
	public CommonAreaConfig getCommonAreaConfig(int uid) throws ClassNotFoundException, SQLException;
	public void saveOrUpdate(CommonAreaConfig config);
}
