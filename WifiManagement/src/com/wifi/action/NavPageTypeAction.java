package com.wifi.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.wifi.bll.INavPageTypeBll;
import com.wifi.bllimpl.NavPageTypeBll;
import com.wifi.entity.NavPageType;
import com.wifi.utils.StringUtils;
import com.wifi.vo.BaseResult;

public class NavPageTypeAction extends ActionSupport {

	private static final long serialVersionUID = -1173948601274325325L;

	private INavPageTypeBll navPageTypeBll = new NavPageTypeBll();
	private List<NavPageType> navPageTypes;
	private String name;
	private BaseResult addNavPageTypeResult;
	private BaseResult updateNavPageTypeResult;
	private BaseResult deleteNavPageTypeResult;
	private NavPageType navPageType;
	private ArrayList<Integer> deleteIDs;
	
	public String navPageTypeManage() {

		try {
			navPageTypes = navPageTypeBll.getTypes();
			return SUCCESS;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;
	}

	public List<NavPageType> getNavPageTypes() {
		return navPageTypes;
	}

	public void setNavPageTypes(List<NavPageType> navPageTypes) {
		this.navPageTypes = navPageTypes;
	}

	public String addNavPageType() {

		addNavPageTypeResult = new BaseResult();
		if (!StringUtils.isNullOrEmpty(name)) {
			try {
				navPageTypeBll.add(name);
				addNavPageTypeResult.setCode(BaseResult.CODE_SUCCESS);
				addNavPageTypeResult.setUrl("navPageTypeManage.action");
				return SUCCESS;
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		addNavPageTypeResult.setCode(BaseResult.CODE_FAILURE);
		return SUCCESS;
	}
	
	public String updateNavPageType() {
		
		updateNavPageTypeResult = new BaseResult();
		if (navPageType !=null) {
			try {
				navPageTypeBll.update(navPageType);
				updateNavPageTypeResult.setCode(BaseResult.CODE_SUCCESS);
				updateNavPageTypeResult.setUrl("navPageTypeManage.action");
				return SUCCESS;
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		updateNavPageTypeResult.setCode(BaseResult.CODE_FAILURE);
		return SUCCESS;
	}
	
	public String deleteNavPageTypes() {
		
		deleteNavPageTypeResult = new BaseResult();
		if (deleteIDs != null) {
			try {
				if (navPageTypeBll.delete(deleteIDs)) {
					deleteNavPageTypeResult.setCode(BaseResult.CODE_SUCCESS);
					deleteNavPageTypeResult.setUrl("navPageTypeManage.action");
				} else {
					deleteNavPageTypeResult.setCode(BaseResult.CODE_FAILURE);
					deleteNavPageTypeResult.setInfo("修改用户失败");
				}
			} catch (Exception e) {
				e.printStackTrace();
				deleteNavPageTypeResult.setCode(BaseResult.CODE_FAILURE);
				deleteNavPageTypeResult.setInfo("修改用户失败");
			}
		}
		return SUCCESS;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BaseResult getAddNavPageTypeResult() {
		return addNavPageTypeResult;
	}

	public void setAddNavPageTypeResult(BaseResult addNavPageTypeResult) {
		this.addNavPageTypeResult = addNavPageTypeResult;
	}

	public BaseResult getUpdateNavPageTypeResult() {
		return updateNavPageTypeResult;
	}

	public void setUpdateNavPageTypeResult(BaseResult updateNavPageTypeResult) {
		this.updateNavPageTypeResult = updateNavPageTypeResult;
	}

	public NavPageType getNavPageType() {
		return navPageType;
	}

	public void setNavPageType(NavPageType navPageType) {
		this.navPageType = navPageType;
	}

	public BaseResult getDeleteNavPageTypeResult() {
		return deleteNavPageTypeResult;
	}

	public void setDeleteNavPageTypeResult(BaseResult deleteNavPageTypeResult) {
		this.deleteNavPageTypeResult = deleteNavPageTypeResult;
	}

	public ArrayList<Integer> getDeleteIDs() {
		return deleteIDs;
	}

	public void setDeleteIDs(ArrayList<Integer> deleteIDs) {
		this.deleteIDs = deleteIDs;
	}

}
