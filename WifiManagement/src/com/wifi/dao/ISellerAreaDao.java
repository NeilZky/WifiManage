package com.wifi.dao;

import java.sql.SQLException;
import java.util.List;

import com.wifi.entity.SellerArea;

public interface ISellerAreaDao extends IBaseDao{
	
	public List<SellerArea> getSellerAreas(int userId) ;
	public int insert(SellerArea commonArea) throws ClassNotFoundException, SQLException ;
	public int update(SellerArea commonArea) throws ClassNotFoundException, SQLException ;
}
