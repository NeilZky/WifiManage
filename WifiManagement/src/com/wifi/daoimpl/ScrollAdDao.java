package com.wifi.daoimpl;

import java.sql.SQLException;
import java.util.List;

import com.wifi.dao.IScrollAdDao;
import com.wifi.entity.ScrollAd;
import com.wifi.utils.db.ContentValue;
import com.wifi.utils.db.DbHelper;

public class ScrollAdDao extends BaseDao implements IScrollAdDao{

	public int getCount() {
		
		try {
			return DbHelper.getCount("scrollad");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int insert(ScrollAd sa) throws ClassNotFoundException, SQLException {
		
		ContentValue cv = new ContentValue();
		cv.put("photoUrl", sa.getPhotoUrl());
		cv.put("linkUrl", sa.getLinkUrl());
		cv.put("content", sa.getContent());
		return DbHelper.insert(cv, "ScrollAd");
	}

	@Override
	public int update(ScrollAd sa) throws ClassNotFoundException, SQLException {
		
		ContentValue cv = new ContentValue();
		cv.put("photoUrl", sa.getPhotoUrl());
		cv.put("linkUrl", sa.getLinkUrl());
		cv.put("content", sa.getContent());
		ContentValue where = new  ContentValue();
		where.put("id", sa.getId());
		return DbHelper.update("ScrollAd", cv, where);
	}

	@Override
	public List<ScrollAd> getScrollAds() throws ClassNotFoundException, SQLException {

		return DbHelper.select(ScrollAd.class, "ScrollAd", null,0, 0);
	}
	
	public List<ScrollAd> getScrollAdReleases() throws ClassNotFoundException, SQLException {

		return DbHelper.select(ScrollAd.class, "ScrollAdRelease", null,0, 0);
	}

	public ScrollAd getById(int id) {

		ContentValue where = new ContentValue();
		where.put("id", id); 
		List<ScrollAd> scrollAds = null;
		try {
			scrollAds = DbHelper.select(ScrollAd.class, "ScrollAdRelease", where, 0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(scrollAds!=null && !scrollAds.isEmpty()) {
			return scrollAds.get(0);
		} 
		return null;
	}

	public void copyFromReleaseTable() {
		
		DbHelper.clear("scrollad");
		DbHelper.execute("INSERT INTO scrollad SELECT * FROM scrolladrelease");
	}
	
	public void copyToReleaseTable() {
		
		DbHelper.clear("scrolladrelease");
		DbHelper.execute("INSERT INTO scrolladrelease  SELECT * FROM scrollad");
	}
	
}
