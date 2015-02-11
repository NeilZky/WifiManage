package com.wifi.dao;

import java.sql.SQLException;
import java.util.List;

import com.wifi.entity.ScrollAd;

public interface IScrollAdDao extends IBaseDao{
	
	public int insert(ScrollAd sa) throws ClassNotFoundException, SQLException;
	public int update(ScrollAd sa) throws ClassNotFoundException, SQLException;;
	public List<ScrollAd> getScrollAds() throws ClassNotFoundException, SQLException;
}
