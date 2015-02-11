package com.wifi.daoimpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wifi.dao.INavPageTypeDao;
import com.wifi.entity.NavPage;
import com.wifi.entity.NavPageType;
import com.wifi.utils.db.ContentValue;
import com.wifi.utils.db.DBUtils;
import com.wifi.utils.db.DbHelper;

public class NavPageTypeDao extends BaseDao implements INavPageTypeDao{
	
	
	
	@Override
	public List<NavPageType> getTypes() throws ClassNotFoundException, SQLException {
		
		List<NavPageType> navPageTypes = DbHelper.select(NavPageType.class, "NavPageType", null,0, 0);
		NavPageDao navPageDao = new NavPageDao();
		for(NavPageType temp : navPageTypes) {
			temp.setNavPages(navPageDao.getByType(temp.getId()));
		}
		return navPageTypes;
	}
	
	public List<NavPageType> getTypeReleases() throws ClassNotFoundException, SQLException {
		
		List<NavPageType> navPageTypes = DbHelper.select(NavPageType.class, "NavPageType", null,0, 0);
		NavPageDao navPageDao = new NavPageDao();
		for(NavPageType temp : navPageTypes) {
			temp.setNavPages(navPageDao.getReleaseByType(temp.getId()));
		}
		return navPageTypes;
	}

	@Override
	public int add(String name) throws ClassNotFoundException, SQLException {
		ContentValue cv = new ContentValue();
		cv.put("name", name);
		return DbHelper.insert(cv, "NavPageType");
	}

	@Override
	public boolean update(NavPageType navPageType)
			throws ClassNotFoundException, SQLException {
		ContentValue cv = new ContentValue();
		cv.put("name", navPageType.getName());
		ContentValue where = new ContentValue();
		where.put("id", navPageType.getId());
		return DbHelper.update("NavPageType", cv, where) > 0;
	}

	@Override
	public boolean delete(ArrayList<Integer> deleteIDs)
			throws ClassNotFoundException, SQLException {
		boolean result = true;
		for(Integer id : deleteIDs) {
			 boolean tempRes = DbHelper.delete("NavPageType", id);
			 if(tempRes == false) {
				 result = false;
			 }
		}
		return result;
	}
	
	@Override
	public Collection<NavPageType> getNavPageTypes() {

		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			Statement statement = conn.createStatement();
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT ")
				.append("  NP.`id`,")
				.append("  NP.`name`,")
				.append("  NP.`photourl`,")
				.append("  NP.`linkurl`,")
				.append("  NPT.`id` AS NavPageTypeID,")
				.append("  NPT.`name` AS NavPageTypeName ")
				.append(" FROM ")
				.append(" 	  navpagetype NPT  ")
				.append(" 	    LEFT JOIN navpage NP   ")
				.append(" 	    ON NPT.`id` = NP.`navPageTypeID`  ")
			.append(" 	    ORDER BY  NavPageTypeID ");
			ResultSet rs = statement.executeQuery(sb.toString());
			Map<Integer, NavPageType> navPageTypeMap = new HashMap<Integer, NavPageType>(); 
			while(rs.next()) {
				int navPageTypeID = rs.getInt("NavPageTypeID");
				NavPageType type = navPageTypeMap.get(navPageTypeID);
				if(type==null) {
					type = new NavPageType();
					type.setId(navPageTypeID);
					type.setName(rs.getString("NavPageTypeName"));
					type.setNavPages(new ArrayList<NavPage>());
				}
				int npId = rs.getInt("id");
				String npName = rs.getString("name");
				String npPhotoUrl = rs.getString("photourl");
				String npLinkUrl = rs.getString("linkurl");
				NavPage navPage = new NavPage();
				navPage.setId(npId);
				navPage.setName(npName);
				navPage.setPhotoUrl(npPhotoUrl);
				navPage.setLinkUrl(npLinkUrl);
				type.getNavPages().add(navPage);
			}
			return navPageTypeMap.values();
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
