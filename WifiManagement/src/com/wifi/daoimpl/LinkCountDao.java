package com.wifi.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.wifi.entity.LinkCount;
import com.wifi.utils.DateUtils;
import com.wifi.utils.db.ContentValue;
import com.wifi.utils.db.DBUtils;
import com.wifi.utils.db.DbHelper;

public class LinkCountDao{

	
	public void createIfNotExist(int type, int uid, String linkUrl,String date) {
		
		LinkCount pc = getByDate(type, uid, linkUrl, date);
		if(pc == null) {
			ContentValue cv = new ContentValue();
			cv.put("recordDate", date);
			cv.put("type", type);
			cv.put("uid", uid);
			cv.put("linkUrl", linkUrl);
			try {
				DbHelper.insert(cv, "LinkCount");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void addCountByDate(int type, int uid, String linkUrl,int addPv, int addUip) {
	
		String date = DateUtils.getCurrentDate();
		Calendar c = Calendar.getInstance();
		int hourOfDay = c.get(Calendar.HOUR_OF_DAY);
		int block = hourOfDay/3;
		
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			StringBuffer sb = new StringBuffer();
			sb.append("UPDATE ")
				.append("  LinkCount")
				.append("  SET")
				.append("  uip = uip+ ?")
				.append("  , ")
				.append("  pv = pv+ ?")
				.append("  , ")
				.append("  pv"+block+" = pv"+block+"+ ?")
				.append("  , ")
				.append("  uip"+block+" = uip"+block+"+ ?")
				.append(" WHERE   ")
				.append("    recordDate = ? ")
				.append("    AND type = ? ")
				.append("    AND uid = ? ")
			.append("    AND linkUrl = ? ");
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, addUip);
			pstmt.setInt(2, addPv);
			pstmt.setInt(3, addPv);
			pstmt.setInt(4, addUip);
			pstmt.setString(5, date);
			pstmt.setInt(6, type);
			pstmt.setInt(7, uid);
			pstmt.setString(8, linkUrl);
			pstmt.executeUpdate();
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
		
	}

	public LinkCount getByDate(int type, int uid, String linkUrl, String date) {
		
		ContentValue where = new ContentValue();
		where.put("recordDate", date);
		where.put("type", type);
		where.put("uid", uid);
		where.put("linkUrl", linkUrl);
		List<LinkCount> pageCounts  = null;
		try {
			 pageCounts = DbHelper.select(LinkCount.class, "LinkCount", where, 0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(pageCounts!=null&& !pageCounts.isEmpty()) {
			return pageCounts.get(0);
		}
		return null;
	}

	public List<LinkCount> getByDate(int type, int uid, String linkUrl ,String beginDate, String endDate, int limit) {
		
		List<LinkCount>  pageCounts = new ArrayList<LinkCount>();
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT ")
				.append("  id,")
				.append("  pv,")
				.append("  uip,")
				.append("  recordDate")
				.append(" FROM")
				.append(" 	LinkCount")
				.append(" WHERE")
				.append(" 	recordDate >=?  ")
				.append(" AND recordDate <=?  ")
				.append(" AND type =?  ")
				.append(" AND uid =?  ")
				.append(" AND linkUrl =?  ")
				.append(" 	    ORDER BY  recordDate DESC ")
				.append(" LIMIT ?  ");
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, beginDate);
			pstmt.setString(2, endDate);
			pstmt.setInt(3, type);
			pstmt.setInt(4, uid);
			pstmt.setString(5, linkUrl);
			pstmt.setInt(6, limit);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				LinkCount pc = new LinkCount();
				pc.setId(rs.getInt("id"));
				pc.setPv(rs.getInt("pv"));
				pc.setUip(rs.getInt("uip"));
				pc.setRecordDate(rs.getString("recordDate"));
				pageCounts.add(pc);
			}
			return pageCounts;
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
		return null;
	}
	
}
