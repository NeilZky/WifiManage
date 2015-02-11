package com.wifi.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wifi.bll.IUserBll;
import com.wifi.bllimpl.UserBll;
import com.wifi.constance.LogicContance;
import com.wifi.dao.IUserDao;
import com.wifi.daoimpl.UserDao;
import com.wifi.entity.User;
import com.wifi.utils.StringUtils;
import com.wifi.vo.AddUserResult;
import com.wifi.vo.BaseResult;
import com.wifi.vo.LoginResult;
import com.wifi.vo.UpdateUserResult;
import com.wifi.vo.UserInfo;

public class UserAction extends BaseAction {

	private UserInfo userInfo;
	private User user;
	private List<User> users;
	private IUserBll userBll = new UserBll();
	private UserDao userDao = new UserDao();
	private String tag;
	private AddUserResult addUserResult;
	private UpdateUserResult updateUserResult;
	private int page;
	private LoginResult loginResult;
	private ArrayList<Integer> deleteUserIDs;
	private BaseResult deleteUsersResult;
	private BaseResult result;
	private String oldPwd;
	private String newPwd;

	public String login() {

		loginResult = new LoginResult();
		loginResult.setCode(BaseResult.CODE_FAILURE);
		if (userInfo == null
				|| StringUtils.isNullOrEmpty(userInfo.getUsername())
				|| StringUtils.isNullOrEmpty(userInfo.getPassword())) {
			loginResult.setInfo("请输入用户名或密码");
			return SUCCESS;
		}
		ActionContext ac = ActionContext.getContext();
		try {
			boolean exist = userBll.exist(userInfo.getUsername(),
					userInfo.getPassword());
			if (exist) {
				Map<String, Object> session = ac.getSession();
				if(session == null) {
					loginResult.setInfo("session is null");
					loginResult.setCode(BaseResult.CODE_FAILURE);
					return SUCCESS;
				}
				User user = userDao.get(userInfo.getUsername(),
						userInfo.getPassword());
				session.put(LogicContance.SESSION_USER, user);
				loginResult.setCode(BaseResult.CODE_SUCCESS);
				loginResult.setUrl("index.action");
				return SUCCESS;
			} else {
				loginResult.setCode(BaseResult.CODE_FAILURE);
				loginResult.setInfo("用户名或密码错误");
				return SUCCESS;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			loginResult.setInfo(e.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			loginResult.setInfo(e.toString());
		}
		return SUCCESS;
	}

	public String index() {

		User u = getSessionUser();
		if (u != null) {
			return SUCCESS;
		} else {
			return LOGIN;
		}
	}

	public String logout() {

		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		session.clear();
		return SUCCESS;
	}

	public String updatePwd() {

		result = new BaseResult();
		String username = getSessionUser().getUsername();
		try {
			if (!userDao.exist(username, oldPwd)) {
				result.setCode(BaseResult.CODE_FAILURE);
				result.setInfo("原密码错误");
				return SUCCESS;
			}
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			userDao.update(username, newPwd);
			result.setCode(BaseResult.CODE_SUCCESS);
			result.setInfo("修改成功");
			result.setUrl("login.html");
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

	public String userManage() {
		
		System.out.println("userManage");
		User u = getSessionUser();
		if (u == null) {
			return LOGIN;
		}
		users = userDao.getUsersByCreator(u.getId());
		return SUCCESS;
	}

	public String addUser() {

		addUserResult = new AddUserResult();
		if (user != null) {
			try {
				if (userBll.existUserName(user.getUsername())) {
					addUserResult.setCode(AddUserResult.CODE_FAILURE);
					addUserResult.setInfo("用户名已存在");
					return SUCCESS;
				}

				if (userBll.existName(user.getName())) {
					addUserResult.setCode(AddUserResult.CODE_FAILURE);
					addUserResult.setInfo("姓名已存在");
					return SUCCESS;
				}
				user.setPassword(user.getTelNumber());
				user.setCreatorId(getSessionUser().getId());
				int id = userBll.addUser(user);
				user.setPassword(null);
				user.setId(id);
				addUserResult.setCode(BaseResult.CODE_SUCCESS);
				addUserResult.setInfo("密码默认是手机号");
				addUserResult.setUrl("userManage.action");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}

	public String updateUser() {

		updateUserResult = new UpdateUserResult();
		if (user != null) {
			try {
				if (userBll.update(user)) {
					updateUserResult.setCode(BaseResult.CODE_SUCCESS);
					updateUserResult.setUrl("userManage.action");
				} else {
					updateUserResult.setCode(BaseResult.CODE_FAILURE);
					updateUserResult.setInfo("修改用户失败");
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return SUCCESS;
	}

	public String deleteUsers() {

		deleteUsersResult = new BaseResult();
		if (deleteUserIDs != null) {
			try {
				if (userBll.delete(deleteUserIDs)) {
					deleteUsersResult.setCode(BaseResult.CODE_SUCCESS);
					deleteUsersResult.setUrl("userManage.action");
				} else {
					deleteUsersResult.setCode(BaseResult.CODE_FAILURE);
					deleteUsersResult.setInfo("删除用户失败");
				}
			} catch (Exception e) {
				e.printStackTrace();
				deleteUsersResult.setCode(BaseResult.CODE_FAILURE);
				deleteUsersResult.setInfo("删除用户失败");
			}
		}
		return SUCCESS;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<User> getUsers() {
		return users;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public AddUserResult getAddUserResult() {
		return addUserResult;
	}

	public void setAddUserResult(AddUserResult addUserResult) {
		this.addUserResult = addUserResult;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public UpdateUserResult getUpdateUserResult() {
		return updateUserResult;
	}

	public void setUpdateUserResult(UpdateUserResult updateUserResult) {
		this.updateUserResult = updateUserResult;
	}

	public LoginResult getLoginResult() {
		return loginResult;
	}

	public void setLoginResult(LoginResult loginResult) {
		this.loginResult = loginResult;
	}

	public ArrayList<Integer> getDeleteUserIDs() {
		return deleteUserIDs;
	}

	public void setDeleteUserIDs(ArrayList<Integer> deleteUserIDs) {
		this.deleteUserIDs = deleteUserIDs;
	}

	public BaseResult getDeleteUsersResult() {
		return deleteUsersResult;
	}

	public void setDeleteUsersResult(BaseResult deleteUsersResult) {
		this.deleteUsersResult = deleteUsersResult;
	}

	public BaseResult getResult() {
		return result;
	}

	public void setResult(BaseResult result) {
		this.result = result;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

}
