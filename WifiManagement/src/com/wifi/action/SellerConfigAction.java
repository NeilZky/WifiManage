package com.wifi.action;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wifi.constance.LogicContance;
import com.wifi.constance.UserType;
import com.wifi.dao.ISellerConfigDao;
import com.wifi.daoimpl.SellerConfigDao;
import com.wifi.daoimpl.UserDao;
import com.wifi.entity.SellerConfig;
import com.wifi.entity.User;
import com.wifi.vo.BaseResult;
import com.wifi.vo.SellerConfigInfo;
import com.wifi.vo.SellerConfigManageInfo;

public class SellerConfigAction extends BaseAction{

	private SellerConfigInfo input;
	private ISellerConfigDao sellerConfigDao = new SellerConfigDao();
	private BaseResult result ;
	private SellerConfigManageInfo configInfo;
	private List<User> users;
	private UserDao userDao = new UserDao();
	private static final long serialVersionUID = 7862880870707325444L;
	private int uid;
	
	
	public String sellerConfig() {
		
		int userId = uid;
		try {
			sellerConfigDao.createIfNotExist(userId);
			SellerConfig config = sellerConfigDao.getSellerConfigByUserId(userId);
			configInfo = new SellerConfigManageInfo();
			if(config!=null) {
				String state = config.getColumnState();
				if(state!=null) {
					for(int i = 0 ; i < state.length(); i ++) {
						Method getLabelMethod = config.getClass().getMethod("getL" + (i+1));
						Method setConfigLabelMethod = configInfo.getClass().getMethod("setL" + (i+1), String.class);
						Method setConfigEnableMethod = configInfo.getClass().getMethod("setEnableL" + (i + 1 ), boolean.class);
						char c = state.charAt(i);
						if(c == '1') {
							String label = (String) getLabelMethod.invoke(config);
							setConfigLabelMethod.invoke(configInfo, label);
							setConfigEnableMethod.invoke(configInfo, true);
						} 
					}
					return SUCCESS;
				}
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String sellerConfigList() {
		
		User u = getSessionUser();
		if(u.getType() == UserType.ADMIN) {
			users = userDao.getAllSellers();
			return "sellerConfigList";
		} else if(u.getType() == UserType.NOMARL_ADMIN) {
			users = userDao.getSellerCreateBy(u.getId());
			return "sellerConfigList";
		} else {
			//TODO 直接展示商家编辑
			return SUCCESS;
		}
	}
	
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public String updateSellerConfig() {
		
		result = new BaseResult();
		result.setCode(BaseResult.CODE_FAILURE);
		result.setInfo("修改失败");
		if(input!=null)  {
			try {
				SellerConfig config = new SellerConfig();
				StringBuffer sb = new StringBuffer();
				for(int i =1; i <=20 ; i++) {
					Method getEnableMethod = input.getClass().getMethod("getEnableL" + i);
					Method getLabelMethod = input.getClass().getMethod("getL" + i);
					Method setConfigMethod = config.getClass().getMethod("setL" + i, String.class);
					String enableLabel = (String) getEnableMethod.invoke(input);
					String labelValue = (String) getLabelMethod.invoke(input);

					if(enableLabel!=null&&(labelValue == null || labelValue.trim().isEmpty())) {
						result.setInfo("属性名称不能为空");
						return SUCCESS;
					}
					if("on".equals(enableLabel)) {
						setConfigMethod.invoke(config, labelValue);
						sb.append("1");
					} else {
						sb.append("0");
					}
				}
				config.setColumnState(sb.toString());
				int userId = uid;
				config.setUserId(userId);
				sellerConfigDao.update(config);
				result.setCode(BaseResult.CODE_SUCCESS);
				result.setUrl("sellerConfig.action?uid="+uid);
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}

	
	public SellerConfigInfo getInput() {
		return input;
	}

	public void setInput(SellerConfigInfo input) {
		this.input = input;
	}

	public SellerConfigManageInfo getConfigInfo() {
		return configInfo;
	}

	public void setConfigInfo(SellerConfigManageInfo configInfo) {
		this.configInfo = configInfo;
	}

	public BaseResult getResult() {
		return result;
	}

	public void setResult(BaseResult result) {
		this.result = result;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

}
