package com.wifi.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.wifi.dao.ISellerPageCountDao;
import com.wifi.entity.PageCount;
import com.wifi.entity.SellerPageCount;
import com.wifi.utils.DateUtils;
import com.wifi.utils.db.ContentValue;
import com.wifi.utils.db.DBUtils;
import com.wifi.utils.db.DbHelper;

public class SellerPageCountDao implements ISellerPageCountDao {

	@Override
	public void createIfNotExist(int uid) {
		
		String date = DateUtils.getCurrentDate();
		createIfNotExist(uid,date);
	}
	
	@Override
	public void createIfNotExist(int uid, String date) {
		
		PageCount pc = getByDate(uid, date);
		if (pc == null) {
			ContentValue cv = new ContentValue();
			cv.put("recordDate", date);
			cv.put("uid", uid);
			try {
				DbHelper.insert(cv, "SellerPageCount");
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
	public void addCountByDate(int uid, int addPv, int addUip) {

		String date = DateUtils.getCurrentDate();
		Calendar c = Calendar.getInstance();
		int hourOfDay = c.get(Calendar.HOUR_OF_DAY);
		int block = hourOfDay/3;
		
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			StringBuffer sb = new StringBuffer();
			sb.append("UPDATE ")
				.append("  SellerPageCount")
				.append("  SET")
				.append("  uip = uip+ ?")
				.append("  , ")
				.append("  pv = pv+ ?")
				.append("  , ")
				.append("  pv"+block+" = pv"+block+"+ ?")
				.append("  , ")
				.append("  uip"+block+" = uip"+block+"+ ?")
				.append(" WHERE   ")
				.append("    uid = ? ")
				.append("    AND recordDate = ? ");
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, addUip);
			pstmt.setInt(2, addPv);
			pstmt.setInt(3, addPv);
			pstmt.setInt(4, addUip);
			pstmt.setInt(5, uid);
			pstmt.setString(6, date);
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
	public SellerPageCount getByDate(int uid, String date) {
		ContentValue where = new ContentValue();
		where.put("uid", uid);
		where.put("recordDate", date);
		List<SellerPageCount> pageCounts = null;
		try {
			pageCounts = DbHelper.select(SellerPageCount.class, "SellerPageCount",
					where, 0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (pageCounts != null && !pageCounts.isEmpty()) {
			return pageCounts.get(0);
		}
		return null;
	}
	
	@Override
	public List<PageCount> getByDate(int uid, String beginDate, String endDate, int limit) {
		
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
				.append(" 	SellerPageCount")
				.append(" WHERE")
				.append(" 	uid =?  ")
				.append(" 	AND recordDate >=?  ")
				.append(" AND recordDate <=?  ")
				.append(" 	    ORDER BY  recordDate DESC ")
				.append(" LIMIT ?  ");
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, uid);
			pstmt.setString(2, beginDate);
			pstmt.setString(3, endDate);
			pstmt.setInt(4, limit);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				SellerPageCount pc = new SellerPageCount();
				pc.setId(rs.getInt("id"));
				pc.setPv(rs.getInt("pv"));
				pc.setUip(rs.getInt("uip"));
				pc.setUid(uid);
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
