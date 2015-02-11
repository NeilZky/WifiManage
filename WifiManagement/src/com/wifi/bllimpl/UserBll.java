package com.wifi.bllimpl;

import java.sql.SQLException;
import java.util.List;

import com.wifi.bll.IUserBll;
import com.wifi.dao.IUserDao;
import com.wifi.daoimpl.UserDao;
import com.wifi.entity.User;

public class UserBll implements IUserBll{

	private IUserDao userDao = new UserDao();
	
	@Override
	public boolean exist(String username, String password) throws ClassNotFoundException, SQLException {
		return userDao.exist(username, password);
	}
	
	@Override
	public int addUser(User u) throws ClassNotFoundException, SQLException {
		
		return userDao.addUser(u);
	}

	@Override
	public List<User> getUsers(int type ,int page) throws ClassNotFoundException, SQLException {
		
		return userDao.getUsers(type ,page);
	}

	@Override
	public boolean existUserName(String username)
			throws ClassNotFoundException, SQLException {
		
		return userDao.existUserName(username);
	}

	@Override
	public boolean existName(String name) throws ClassNotFoundException,
			SQLException {
		
		return userDao.existName(name);
	}

	@Override
	public boolean update(User u) throws ClassNotFoundException, SQLException {
		return userDao.update(u);
	}

	@Override
	public boolean delete(List<Integer> userIds) throws ClassNotFoundException,
			SQLException {
		// TODO Auto-generated method stub
		return userDao.delete(userIds);
	}

}
