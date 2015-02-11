package com.wifi.daoimpl;

import java.sql.SQLException;
import java.util.List;

import com.wifi.dao.ICommonAreaConfigDao;
import com.wifi.entity.CommonAreaConfig;
import com.wifi.utils.db.ContentValue;
import com.wifi.utils.db.DbHelper;

public class CommonAreaConfigDao implements ICommonAreaConfigDao{

	@Override
	public int update(CommonAreaConfig config) {
		
		ContentValue cv = new ContentValue();
		cv.put("columnState", config.getColumnState());
		cv.put("L1", config.getL1());
		cv.put("L2", config.getL2());
		cv.put("L3", config.getL3());
		cv.put("L4", config.getL4());
		cv.put("L5", config.getL5());
		cv.put("L6", config.getL6());
		cv.put("L7", config.getL7());
		cv.put("L8", config.getL8());
		cv.put("L9", config.getL9());
		cv.put("L10", config.getL10());
		cv.put("L11", config.getL11());
		cv.put("L12", config.getL12());
		cv.put("L13", config.getL13());
		cv.put("L14", config.getL14());
		cv.put("L15", config.getL15());
		cv.put("L16", config.getL16());
		cv.put("L17", config.getL17());
		cv.put("L18", config.getL18());
		cv.put("L19", config.getL19());
		cv.put("L20", config.getL20());
		ContentValue where = new ContentValue();
		where.put("id", config.getId());
		try {
			return DbHelper.update("CommonAreaConfig", cv, where);
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
	public CommonAreaConfig getCommonAreaConfig(int uid)
			throws ClassNotFoundException, SQLException {
		 ContentValue where = new ContentValue();
		 where.put("uid", uid);
		 List<CommonAreaConfig> configs = DbHelper.select(CommonAreaConfig.class, "CommonAreaConfig", where, 0, 0);
		 if(configs!=null && !configs.isEmpty()) {
			 return configs.get(0);
		 }
		 return null;
	}

	@Override
	public void saveOrUpdate(CommonAreaConfig config) {
		
		try {
			CommonAreaConfig cac = getCommonAreaConfig(config.getUid());
			if(cac == null) {
				save(config);
			} else {
				config.setId(cac.getId());
				update(config);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int save(CommonAreaConfig config) {
		
		ContentValue cv = new ContentValue();
		cv.put("columnState", config.getColumnState());
		cv.put("uid", config.getUid());
		cv.put("L1", config.getL1());
		cv.put("L2", config.getL2());
		cv.put("L3", config.getL3());
		cv.put("L4", config.getL4());
		cv.put("L5", config.getL5());
		cv.put("L6", config.getL6());
		cv.put("L7", config.getL7());
		cv.put("L8", config.getL8());
		cv.put("L9", config.getL9());
		cv.put("L10", config.getL10());
		cv.put("L11", config.getL11());
		cv.put("L12", config.getL12());
		cv.put("L13", config.getL13());
		cv.put("L14", config.getL14());
		cv.put("L15", config.getL15());
		cv.put("L16", config.getL16());
		cv.put("L17", config.getL17());
		cv.put("L18", config.getL18());
		cv.put("L19", config.getL19());
		cv.put("L20", config.getL20());
		try {
			return DbHelper.insert(cv, "CommonAreaConfig");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}
	
}
