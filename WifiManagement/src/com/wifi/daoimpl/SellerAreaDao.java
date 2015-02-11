package com.wifi.daoimpl;

import java.sql.SQLException;
import java.util.List;

import com.wifi.dao.ISellerAreaDao;
import com.wifi.entity.SellerArea;
import com.wifi.utils.db.ContentValue;
import com.wifi.utils.db.DbHelper;

public class SellerAreaDao extends BaseDao implements ISellerAreaDao {

	@Override
	public List<SellerArea> getSellerAreas(int userId) {
		
		try {
			ContentValue where = new ContentValue();
			where.put("UserId", userId);
			return DbHelper.select(SellerArea.class, "SellerArea", where, 0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int getCount(int uid) {

		int count = 0;
		try {
			ContentValue cv = new ContentValue();
			cv.put("userId", uid);
			count = DbHelper.getCount("sellerarea", cv);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public void copyFromReleaseTable(int uid) {

		DbHelper.execute("DELETE FROM sellerarea WHERE userId = " + uid);
		DbHelper.execute("INSERT INTO sellerarea SELECT * FROM sellerarearelease WHERE userId = "
				+ uid);
	}

	public void copyToReleaseTable(int uid) {

		DbHelper.execute("DELETE FROM sellerarearelease WHERE userId = " + uid);
		DbHelper.execute("INSERT INTO sellerarearelease SELECT * FROM sellerarea WHERE userId = "
				+ uid);
	}
	
	@Override
	public int insert(SellerArea ca) throws ClassNotFoundException, SQLException {
		ContentValue cv = new ContentValue();
		cv.put("amount", ca.getAmount());
		cv.put("title", ca.getTitle());
		cv.put("description", ca.getDescription());
		cv.put("photoUrl", ca.getPhotoUrl());
		cv.put("linkUrl", ca.getLinkUrl());
		cv.put("c1", ca.getC1());
		cv.put("c2", ca.getC2());
		cv.put("c3", ca.getC3());
		cv.put("c4", ca.getC4());
		cv.put("c5", ca.getC5());
		cv.put("c6", ca.getC6());
		cv.put("c7", ca.getC7());
		cv.put("c8", ca.getC8());
		cv.put("c9", ca.getC9());
		cv.put("c10", ca.getC10());
		cv.put("c11", ca.getC11());
		cv.put("c12", ca.getC12());
		cv.put("c13", ca.getC13());
		cv.put("c14", ca.getC14());
		cv.put("c15", ca.getC15());
		cv.put("c16", ca.getC16());
		cv.put("c17", ca.getC17());
		cv.put("c18", ca.getC18());
		cv.put("c19", ca.getC19());
		cv.put("c20", ca.getC20());
		cv.put("UserId", ca.getUserId());
		return DbHelper.insert(cv, "SellerArea");
	}

	@Override
	public int update(SellerArea ca) throws ClassNotFoundException,
			SQLException {
		ContentValue cv = new ContentValue();
		cv.put("amount", ca.getAmount());
		cv.put("title", ca.getTitle());
		cv.put("description", ca.getDescription());
		cv.put("photoUrl", ca.getPhotoUrl());
		cv.put("linkUrl", ca.getLinkUrl());
		cv.put("c1", ca.getC1());
		cv.put("c2", ca.getC2());
		cv.put("c3", ca.getC3());
		cv.put("c4", ca.getC4());
		cv.put("c5", ca.getC5());
		cv.put("c6", ca.getC6());
		cv.put("c7", ca.getC7());
		cv.put("c8", ca.getC8());
		cv.put("c9", ca.getC9());
		cv.put("c10", ca.getC10());
		cv.put("c11", ca.getC11());
		cv.put("c12", ca.getC12());
		cv.put("c13", ca.getC13());
		cv.put("c14", ca.getC14());
		cv.put("c15", ca.getC15());
		cv.put("c16", ca.getC16());
		cv.put("c17", ca.getC17());
		cv.put("c18", ca.getC18());
		cv.put("c19", ca.getC19());
		cv.put("c20", ca.getC20());
		ContentValue where = new ContentValue();
		where.put("id", ca.getId());
		return DbHelper.update("SellerArea", cv, where);
	}

	public SellerArea getByID(int id) {
		
		ContentValue where = new ContentValue();
		where.put("id", id); 
		List<SellerArea> res = null;
		try {
			res = DbHelper.select(SellerArea.class, "SellerAreaRelease", where, 0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res!=null && !res.isEmpty()) {
			return res.get(0);
		} 
		return null;	}


}
