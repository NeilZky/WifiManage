package com.wifi.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wifi.constance.LogicContance;
import com.wifi.constance.UserType;
import com.wifi.dao.ISellerAreaDao;
import com.wifi.dao.ISellerConfigDao;
import com.wifi.daoimpl.SellerAreaDao;
import com.wifi.daoimpl.SellerConfigDao;
import com.wifi.daoimpl.UserDao;
import com.wifi.entity.SellerArea;
import com.wifi.entity.SellerConfig;
import com.wifi.entity.User;
import com.wifi.vo.BaseResult;

public class SellerAreaAction extends BaseAction {

	private static final long serialVersionUID = -4107075431274308061L;
	private SellerConfig config;
	private List<SellerArea> datas;;
	private ISellerConfigDao commonAreaConfigDao = new SellerConfigDao();
	private SellerAreaDao dataDao = new SellerAreaDao();
	private boolean[] state;
	private ArrayList<Integer> deleteIDs;
	private List<User> users;
	private UserDao userDao = new UserDao();
	private int uid;
	
	public String sellerAreaList() {

		User u = getSessionUser();
		if (u.getType() == UserType.ADMIN) {
			users = userDao.getAllSellers();
			return "sellerAreaList";
		} else if (u.getType() == UserType.NOMARL_ADMIN) {
			users = userDao.getSellerCreateBy(u.getId());
			return "sellerAreaList";
		} else {
			// TODO 直接展示商家编辑
			return SUCCESS;
		}
	}

	public String sellerArea() {

		int count = dataDao.getCount(uid);
		if(count == 0) {
			dataDao.copyFromReleaseTable(uid);
		}
		int userId = uid;
		try {
			config = commonAreaConfigDao.getSellerConfigByUserId(userId);
			if (config != null && !config.getColumnState().isEmpty()) {
				char[] charState = config.getColumnState().toCharArray();
				state = new boolean[charState.length];
				for (int i = 0; i < charState.length; i++) {
					if (charState[i] == '1') {
						state[i] = true;
					} else {
						state[i] = false;
					}
				}
			}
			datas = dataDao.getSellerAreas(userId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String saveSellerAreaRelease() {
		
		dataDao.copyToReleaseTable(uid);
		return SUCCESS;
	}
	
	public String cancelSellerAreaRelease() {
		
		dataDao.copyFromReleaseTable(uid);
		return SUCCESS;
	}

	private BaseResult result;


	public String addSellerArea() {

		int userId = uid;
		String photoUrl = saveFile();
		ca.setUserId(userId);
		ca.setPhotoUrl(photoUrl);
		try {
			dataDao.insert(ca);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return INPUT;
		} catch (SQLException e) {
			e.printStackTrace();
			return INPUT;
		} catch(Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	public String updateSellerArea() {

		if (ca == null) {
			return INPUT;
		}
		String photoUrl = saveFile();
		try {
			ca.setPhotoUrl(photoUrl);
			ca.setUserId(uid);
			dataDao.update(ca);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return INPUT;
		} catch (SQLException e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	public String deleteSellerAreas() {

		result = new BaseResult();
		boolean success = dataDao.delete(deleteIDs, "SellerArea");
		if (success) {
			result.setCode(BaseResult.CODE_SUCCESS);
			result.setUrl("sellerArea.action");
		} else {
			result.setCode(BaseResult.CODE_FAILURE);
			result.setInfo("删除失败");
		}

		return SUCCESS;
	}

	public SellerConfig getConfig() {
		return config;
	}

	public void setConfig(SellerConfig config) {
		this.config = config;
	}

	public List<SellerArea> getDatas() {
		return datas;
	}

	public void setDatas(List<SellerArea> datas) {
		this.datas = datas;
	}

	public boolean[] getState() {
		return state;
	}

	public void setState(boolean[] state) {
		this.state = state;
	}

	private SellerArea ca;

	public SellerArea getCa() {
		return ca;
	}

	public void setCa(SellerArea ca) {
		this.ca = ca;
	}

	public ArrayList<Integer> getDeleteIDs() {
		return deleteIDs;
	}

	public void setDeleteIDs(ArrayList<Integer> deleteIDs) {
		this.deleteIDs = deleteIDs;
	}

	public BaseResult getResult() {
		return result;
	}

	public void setResult(BaseResult result) {
		this.result = result;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
}
