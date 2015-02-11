package com.wifi.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.wifi.dao.IPageCountDao;
import com.wifi.entity.PageCount;
import com.wifi.utils.DateUtils;
import com.wifi.utils.db.ContentValue;
import com.wifi.utils.db.DBUtils;
import com.wifi.utils.db.DbHelper;

public class PageCountDao implements IPageCountDao{

	@Override
	public void createIfNotExist() {
		
		String date = DateUtils.getCurrentDate();
		createIfNotExist(date);
	}
	
	@Override
	public void createIfNotExist(String date) {
		
		PageCount pc = getByDate(date);
		if(pc == null) {
			ContentValue cv = new ContentValue();
			cv.put("recordDate", date);
			try {
				DbHelper.insert(cv, "PageCount");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void addCountByDate(int addPv, int addUip) {
	
		String date = DateUtils.getCurrentDate();
		Calendar c = Calendar.getInstance();
		int hourOfDay = c.get(Calendar.HOUR_OF_DAY);
		int block = hourOfDay/3;
		
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			StringBuffer sb = new StringBuffer();
			sb.append("UPDATE ")
				.append("  PageCount")
				.append("  SET")
				.append("  uip = uip+ ?")
				.append("  , ")
				.append("  pv = pv+ ?")
				.append("  , ")
				.append("  pv"+block+" = pv"+block+"+ ?")
				.append("  , ")
				.append("  uip"+block+" = uip"+block+"+ ?")
				.append(" WHERE   ")
				.append("    recordDate = ? ");
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, addUip);
			pstmt.setInt(2, addPv);
			pstmt.setInt(3, addPv);
			pstmt.setInt(4, addUip);
			pstmt.setString(5, date);
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

	@Override
	public PageCount getByDate(String date) {
		
		ContentValue where = new ContentValue();
		where.put("recordDate", date);
		List<PageCount> pageCounts  = null;
		try {
			 pageCounts = DbHelper.select(PageCount.class, "PageCount", where, 0, 0);
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

	@Override
	public List<PageCount> getByDate(String beginDate, String endDate, int limit) {
		
		List<PageCount>  pageCounts = new ArrayList<PageCount>();
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
				.append(" 	PageCount")
				.append(" WHERE")
				.append(" 	recordDate >=?  ")
				.append(" AND recordDate <=?  ")
				.append(" 	    ORDER BY  recordDate DESC ")
				.append(" LIMIT ?  ");
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, beginDate);
			pstmt.setString(2, endDate);
			pstmt.setInt(3, limit);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				PageCount pc = new PageCount();
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
	
	
	@Override
	public List<PageCount> getListByDate(int limit) {
		
		List<PageCount>  pageCounts = new ArrayList<PageCount>();
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT ")
				.append("  id,")
				.append("  pv,")
				.append("  uiv")
				.append("  recordDate,")
				.append(" FROM ")
				.append(" 	  PageCount   ")
				.append(" WHERE   ")
				.append(" LIMIT  ? ")
			.append(" 	    ORDER BY  recordDate DESC ");
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, limit);
			ResultSet rs = pstmt.executeQuery(sb.toString());
			while(rs.next()) {
				PageCount pc = new PageCount();
				pc.setId(rs.getInt("id"));
				pc.setPv(rs.getInt("pv"));
				pc.setUip(rs.getInt("uiv"));
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
