package com.wifi.daoimpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.wifi.dao.INavPageDao;
import com.wifi.entity.NavPage;
import com.wifi.entity.NavPageType;
import com.wifi.utils.db.ContentValue;
import com.wifi.utils.db.DBUtils;
import com.wifi.utils.db.DbHelper;

public class NavPageDao extends BaseDao implements INavPageDao {

	public int getCount() {
		
		int count = 0;
		try {
			count = DbHelper.getCount("navPage");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public void copyFromReleaseTable() {
		
		DbHelper.clear("navpage");
		DbHelper.execute("INSERT INTO navpage SELECT * FROM navpagerelease");
	}
	
	public void copyToReleaseTable() {
		
		DbHelper.clear("navpagerelease");
		DbHelper.execute("INSERT INTO navpagerelease  SELECT * FROM navpage");
	}
	
	public void clear() {
		
		DbHelper.clear("navpage");
	}
	
	@Override
	public List<NavPage> getNavPages() {

		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			Statement statement = conn.createStatement();
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT ").append("  NP.`id`,").append("  NP.`name`,")
					.append("  NP.`photourl`,").append("  NP.`linkurl`,")
					.append("  NPT.`id` AS NavPageTypeID,")
					.append("  NPT.`name` AS NavPageTypeName ")
					.append(" FROM ").append(" 	  navpagetype NPT  ")
					.append(" 	    INNER JOIN navpage NP   ")
					.append(" 	    ON NPT.`id` = NP.`navPageTypeID`  ")
					.append(" 	    ORDER BY  NavPageTypeID");
			ResultSet rs = statement.executeQuery(sb.toString());
			List<NavPage> res = new ArrayList<NavPage>();
			while (rs.next()) {
				NavPageType type = new NavPageType();
				int navPageTypeID = rs.getInt("NavPageTypeID");
				type.setId(navPageTypeID);
				type.setName(rs.getString("NavPageTypeName"));

				int npId = rs.getInt("id");
				String npName = rs.getString("name");
				String npPhotoUrl = rs.getString("photourl");
				String npLinkUrl = rs.getString("linkurl");

				NavPage navPage = new NavPage();
				navPage.setId(npId);
				navPage.setName(npName);
				navPage.setPhotoUrl(npPhotoUrl);
				navPage.setLinkUrl(npLinkUrl);
				navPage.setNavPageType(type);
				res.add(navPage);
			}
			if (!res.isEmpty()) {
				return res;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (conn != null) {
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
	
	public List<NavPage> getByType(int typeId) throws ClassNotFoundException, SQLException {
		
		ContentValue where = new ContentValue();
		where.put("navPageTypeId", typeId);
		return DbHelper.select(NavPage.class, "NavPage", where, 0, 0);
	}
	
	public List<NavPage> getReleaseByType(int typeId) throws ClassNotFoundException, SQLException {
		
		ContentValue where = new ContentValue();
		where.put("navPageTypeId", typeId);
		return DbHelper.select(NavPage.class, "NavPageRelease", where, 0, 0);
	}
	
	public NavPage getById(int id)  {
		
		ContentValue where = new ContentValue();
		where.put("id", id); 
		List<NavPage> navPages = null;
		try {
			navPages = DbHelper.select(NavPage.class, "NavPageRelease", where, 0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(navPages!=null && !navPages.isEmpty()) {
			return navPages.get(0);
		} 
		return null;
	}
	
	@Override
	public int add(NavPage navPage) throws ClassNotFoundException, SQLException {

		ContentValue cv = new ContentValue();
		cv.put("name", navPage.getName());
		cv.put("navPageTypeId", navPage.getNavPageType().getId());
		cv.put("linkUrl", navPage.getLinkUrl());
		cv.put("photoUrl", navPage.getPhotoUrl());
		return DbHelper.insert(cv, "NavPage");
	}

	@Override
	public boolean update(NavPage navPage) throws ClassNotFoundException,
			SQLException {
		
		ContentValue cv = new ContentValue();
		cv.put("name", navPage.getName());
		cv.put("navPageTypeID", navPage.getNavPageType().getId());
		cv.put("linkUrl", navPage.getLinkUrl());
		cv.put("photoUrl", navPage.getPhotoUrl());
		ContentValue where = new ContentValue();
		where.put("id", navPage.getId());
		return DbHelper.update("NavPage", cv, where) > 0;
	}

}
