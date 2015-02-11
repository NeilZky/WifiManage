package com.wifi.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wifi.entity.DeviceState;
import com.wifi.entity.User;
import com.wifi.utils.db.ContentValue;
import com.wifi.utils.db.DBUtils;
import com.wifi.utils.db.DbHelper;

public class DeviceStateDao {

	public void createIfNotExist(String deviceId, int uid, int count) {

		ContentValue cv = new ContentValue();
		cv.put("deviceId", deviceId);
		cv.put("uid", uid);
		cv.put("count", count);
		try {
			DbHelper.insert(cv, "DeviceState");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean exist(String deviceId) {
		
		ContentValue where = new ContentValue();
		where.put("deviceId", deviceId);
		List<DeviceState> res  = null;
		try {
			 res = DbHelper.select(DeviceState.class, "DeviceState", where, 0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return(res!=null&& !res.isEmpty());
		
	}
	
	public List<DeviceState> getAllDeviceState() {
		
		List<DeviceState> res  = new ArrayList<DeviceState>();
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT ")
				.append(" DS.`id`,  ")
				.append(" DS.`deviceID`,  ")
				.append(" DS.`uid`,  ")
				.append(" DS.`count`,  ")
				.append(" DS.`lastSyncTime`,  ")
				.append(" DS.`lastSyncTime`,  ")
				.append(" U.`name`  ")
				.append(" FROM")
				.append(" 	devicestate DS")
				.append(" INNER JOIN user U ")
				.append(" ON DS.`uid` = U.`id`  ");
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				DeviceState ds = new DeviceState();
				ds.setId(rs.getInt("id"));
				ds.setDeviceId(rs.getString("deviceID"));
				ds.setCount(rs.getInt("count"));
				User user = new User();
				user.setId(rs.getInt("uid"));
				user.setName(rs.getString("name"));
				ds.setUser(user);
				ds.setLastSyncTime(rs.getString("lastSyncTime"));
				res.add(ds);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return res;
	}
	
	public List<DeviceState> getDeviceStateCreateBy(int creatorId) {
		
		List<DeviceState> res  = new ArrayList<DeviceState>();
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT ")
				.append(" DS.`id`,  ")
				.append(" DS.`deviceID`,  ")
				.append(" DS.`uid`,  ")
				.append(" DS.`count`,  ")
				.append(" DS.`lastSyncTime`,  ")
				.append(" DS.`lastSyncTime`,  ")
				.append(" U.`name`  ")
				.append(" FROM")
				.append(" 	devicestate DS")
				.append(" INNER JOIN user U ")
				.append(" ON DS.`uid` = U.`id`  ")
				.append(" WHERE creatorId = ? ")
				;
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, creatorId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				DeviceState ds = new DeviceState();
				ds.setId(rs.getInt("id"));
				ds.setDeviceId(rs.getString("deviceID"));
				ds.setCount(rs.getInt("count"));
				User user = new User();
				user.setId(rs.getInt("uid"));
				user.setName(rs.getString("name"));
				ds.setUser(user);
				ds.setLastSyncTime(rs.getString("lastSyncTime"));
				res.add(ds);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return res;
	}
	
	public List<DeviceState> getDeviceStateByUid(int uid) {
		
		List<DeviceState> res  = null;
		ContentValue where = new ContentValue();
		where.put("uid", uid);
		try {
			 res = DbHelper.select(DeviceState.class, "DeviceState", where, 0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public void update(String deviceId, int uid,int count) {
		
		ContentValue cv = new ContentValue();
		cv.put("count", count);
		cv.put("uid", uid);
		ContentValue where = new ContentValue();
		where.put("deviceId", deviceId);
		try {
			DbHelper.update("DeviceState", cv, where);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
