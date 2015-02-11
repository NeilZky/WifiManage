package com.wifi.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wifi.bll.INavPageTypeBll;
import com.wifi.bllimpl.NavPageTypeBll;
import com.wifi.daoimpl.NavPageDao;
import com.wifi.entity.NavPage;
import com.wifi.entity.NavPageType;
import com.wifi.utils.StringUtils;
import com.wifi.vo.BaseResult;

public class NavPageAction extends BaseAction {

	private static final long serialVersionUID = -1173948601274325325L;
	private List<NavPage> navPages;
	private List<NavPageType> navPageTypes;
	private NavPageDao navPageDao = new NavPageDao();
	private INavPageTypeBll navPageTypeBll = new NavPageTypeBll();
	private BaseResult result;
	private NavPage navPage;
	private ArrayList<Integer> deleteIDs;

	public String navPageManage() {
		
		int count = navPageDao.getCount();
		if(count == 0) {
			navPageDao.copyFromReleaseTable();
		}
		try {
			navPages = navPageDao.getNavPages();
			navPageTypes = navPageTypeBll.getTypes();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String cancelNavPagePreview() {
		
		navPageDao.clear();
		return SUCCESS;
	}
	
	public String saveNavPageRelease() {
		
		navPageDao.copyToReleaseTable();
		return SUCCESS;
	}
	
	public String addNavPage() {
		
		if(navPage ==null) {
			return ERROR;
		}
		String photoUrl = saveFile();
		if(photoUrl!=null) {
			navPage.setPhotoUrl(photoUrl);
			try {
				navPageDao.add(navPage);
				return SUCCESS;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ERROR;
//		result = new BaseResult();
//		result.setCode(BaseResult.CODE_FAILURE);
//		result.setInfo("Ìí¼ÓÊ§°Ü");
//		try {
//			result.setCode(BaseResult.CODE_SUCCESS);
//			result.setUrl("navPageManage.action");
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return SUCCESS;
	}

	public String updateNavPage() {
		
		if(navPage == null) {
			return ERROR;
		}
		String photoUrl = saveFile();
		if(!StringUtils.isNullOrEmpty(photoUrl)) {
			navPage.setPhotoUrl(photoUrl);
			try {
				navPageDao.update(navPage);
				return SUCCESS;
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return INPUT;
		
//		result = new BaseResult();
//		result.setCode(BaseResult.CODE_FAILURE);
//		result.setInfo("ÐÞ¸ÄÊ§°Ü");
//		try {
//			navPageDao.update(navPage);
//			result.setCode(BaseResult.CODE_SUCCESS);
//			result.setUrl("navPageManage.action");
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return SUCCESS;
	}

	public String deleteNavPages() {

		result = new BaseResult();
		boolean success = navPageDao.delete(deleteIDs, "NavPage");
		if (success) {
			result.setCode(BaseResult.CODE_SUCCESS);
			result.setUrl("navPageManage.action");
		} else {
			result.setCode(BaseResult.CODE_FAILURE);
			result.setInfo("É¾³ýÊ§°Ü");
		}

		return SUCCESS;
	}

	public BaseResult getResult() {
		return result;
	}

	public void setResult(BaseResult result) {
		this.result = result;
	}

	public List<NavPage> getNavPages() {
		return navPages;
	}

	public void setNavPages(List<NavPage> navPages) {
		this.navPages = navPages;
	}

	public List<NavPageType> getNavPageTypes() {
		return navPageTypes;
	}

	public void setNavPageTypes(List<NavPageType> navPageTypes) {
		this.navPageTypes = navPageTypes;
	}

	public NavPage getNavPage() {
		return navPage;
	}

	public void setNavPage(NavPage navPage) {
		this.navPage = navPage;
	}

	public ArrayList<Integer> getDeleteIDs() {
		return deleteIDs;
	}

	public void setDeleteIDs(ArrayList<Integer> deleteIDs) {
		this.deleteIDs = deleteIDs;
	}

}
