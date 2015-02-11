package com.wifi.dao;

import java.sql.SQLException;
import java.util.List;

import com.wifi.entity.CommonArea;

public interface ICommonAreaDao extends IBaseDao{
	
	public List<CommonArea> getCommonAreas(int uid) ;
	public int insert(CommonArea commonArea) throws ClassNotFoundException, SQLException ;
	public int update(CommonArea commonArea) throws ClassNotFoundException, SQLException ;
}
