package com.wifi.daoimpl;

import java.sql.SQLException;
import java.util.List;

import com.wifi.dao.ICommonAreaDao;
import com.wifi.entity.CommonArea;
import com.wifi.entity.ScrollAd;
import com.wifi.utils.db.ContentValue;
import com.wifi.utils.db.DbHelper;

public class CommonAreaDao extends BaseDao implements ICommonAreaDao {

	@Override
	public List<CommonArea> getCommonAreas(int uid) {

		try {
			ContentValue where = new ContentValue();
			where.put("uid", uid);
			return DbHelper.select(CommonArea.class, "CommonArea", where, 0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<CommonArea> getCommonAreaReleases(int uid) {

		try {
			ContentValue where = new ContentValue();
			where.put("uid", uid);
			return DbHelper.select(CommonArea.class, "CommonAreaRelease", where, 0, 0);
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
			cv.put("uid", uid);
			count = DbHelper.getCount("commonArea", cv);
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

		DbHelper.execute("DELETE FROM commonarea WHERE uid = " + uid);
		DbHelper.execute("INSERT INTO commonarea SELECT * FROM commonarearelease WHERE uid = "
				+ uid);
	}

	public void copyToReleaseTable(int uid) {

		DbHelper.execute("DELETE FROM commonarearelease WHERE uid = " + uid);
		DbHelper.execute("INSERT INTO commonarearelease SELECT * FROM commonarea WHERE uid = "
				+ uid);
	}

	@Override
	public int insert(CommonArea ca) throws ClassNotFoundException,
			SQLException {
		ContentValue cv = new ContentValue();
		cv.put("uid", ca.getUid());
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
		return DbHelper.insert(cv, "CommonArea");
	}

	@Override
	public int update(CommonArea ca) throws ClassNotFoundException,
			SQLException {
		ContentValue cv = new ContentValue();
		cv.put("uid", ca.getUid());
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
		return DbHelper.update("CommonArea", cv, where);
	}

	public CommonArea getById(int id) {

		ContentValue where = new ContentValue();
		where.put("id", id);
		List<CommonArea> commonAreas = null;
		try {
			commonAreas = DbHelper.select(CommonArea.class, "CommonAreaRelease",
					where, 0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (commonAreas != null && !commonAreas.isEmpty()) {
			return commonAreas.get(0);
		}
		return null;

	}

}
