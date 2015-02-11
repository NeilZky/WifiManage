package com.wifi.daoimpl;

import java.sql.SQLException;
import java.util.ArrayList;

import com.wifi.dao.IBaseDao;
import com.wifi.utils.db.DbHelper;

public class BaseDao implements IBaseDao {

	@Override
	public boolean delete(ArrayList<Integer> deleteIDs, String tableName) {
		
		if(deleteIDs == null || tableName == null || tableName.isEmpty()) {
			return false;
		}
		boolean result = true;
		try {
			for (Integer id : deleteIDs) {
				boolean tempRes = DbHelper.delete(tableName, id);
				if (tempRes == false) {
					result = false;
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			result = false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	
	
}
