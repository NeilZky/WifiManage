package com.wifi.dao;

import java.sql.SQLException;
import java.util.List;

import com.wifi.entity.User;

public interface IUserDao extends IBaseDao{

	public boolean existUserName(String username)
			throws ClassNotFoundException, SQLException;

	public boolean existName(String name) throws ClassNotFoundException,
			SQLException;

	public boolean exist(String username, String password)
			throws ClassNotFoundException, SQLException;

	public int addUser(User u) throws ClassNotFoundException, SQLException;

	public List<User> getUsers(int type, int page) throws ClassNotFoundException,
			SQLException;

	public boolean update(User u) throws ClassNotFoundException, SQLException;

	public boolean delete(List<Integer> userIds) throws ClassNotFoundException,
			SQLException;
	public User get(String username, String pwd);
	public User get(String name);
}
