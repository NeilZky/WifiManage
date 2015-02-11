package com.wifi.dao;

import java.util.ArrayList;

public interface IBaseDao {
	
	public boolean delete(ArrayList<Integer> deleteIDs, String tableName);
	
}
