package com.wifi.daoimpl;

import java.sql.SQLException;
import java.util.List;

import com.wifi.constance.LogicContance;
import com.wifi.dao.IUserDao;
import com.wifi.entity.User;
import com.wifi.utils.DateUtils;
import com.wifi.utils.db.ContentValue;
import com.wifi.utils.db.DbHelper;

public class UserDao extends BaseDao implements IUserDao {

	@Override
	public boolean exist(String username, String password)
			throws ClassNotFoundException, SQLException {
		ContentValue cv = new ContentValue();
		cv.put("username", username);
		cv.put("password", password);
		return DbHelper.exist("user", cv);
	}

	// TODO Ìí¼Ómd5
	@Override
	public int addUser(User u) throws ClassNotFoundException, SQLException {

		ContentValue cv = new ContentValue();
		cv.put("username", u.getUsername());
		cv.put("password", u.getPassword());
		cv.put("name", u.getName());
		cv.put("type", u.getType());
		cv.put("telNumber", u.getTelNumber());
		cv.put("remark", u.getRemark());
		cv.put("createDateTime", DateUtils.getCurrentDateTime());
		cv.put("creatorId", u.getCreatorId());
		return DbHelper.insert(cv, "user");
	}

	@Override
	public List<User> getUsers(int type, int page) throws ClassNotFoundException, SQLException {
		
		if(type == 1) {
			return DbHelper.select(User.class, "user", null,LogicContance.PAGE_SIZE, page);
		} else if(type == 2) {
			ContentValue where = new ContentValue();
			ContentValue sjWhere = new ContentValue();
			where.put("type", 2);
			sjWhere.put("type", 3);
			List<User> manageUsers =  DbHelper.select(User.class, "user", where,LogicContance.PAGE_SIZE, page);
			List<User> shangjiaUsers =  DbHelper.select(User.class, "user", sjWhere,LogicContance.PAGE_SIZE, page);
			manageUsers.addAll(shangjiaUsers);
			return manageUsers;
		} else {
			return null;
		}
	}
	
	public List<User> getAllSellers(){
		
		ContentValue where = new ContentValue();
		where.put("type", 3);
		try {
			return DbHelper.select(User.class, "user", where, "creatorId",0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<User> getAllAgents(){
		
		ContentValue where = new ContentValue();
		where.put("type", 2);
		try {
			return DbHelper.select(User.class, "user", where, "id",0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	public List<User> getSellerCreateBy(int uid) {
		
		ContentValue where = new ContentValue();
		where.put("type", 3);
		where.put("creatorId", uid);
		try {
			return DbHelper.select(User.class, "user", where,0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<User> getUsersByCreator(int creatorId) {
		
		ContentValue where = new ContentValue();
		where.put("creatorId", creatorId);
		try {
			return  DbHelper.select(User.class, "user", where,0, 0);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	

	@Override
	public boolean existUserName(String username)
			throws ClassNotFoundException, SQLException {
		
		ContentValue cv = new ContentValue();
		cv.put("username", username);
		return DbHelper.exist("user", cv);
	}

	@Override
	public boolean existName(String name) throws ClassNotFoundException,
			SQLException {
		ContentValue cv = new ContentValue();
		cv.put("name", name);
		return DbHelper.exist("user", cv);

	}

	@Override
	public boolean update(User u) throws ClassNotFoundException, SQLException {
		
		ContentValue cv = new ContentValue();
		cv.put("name", u.getName());
		cv.put("type", u.getType());
		cv.put("telNumber", u.getTelNumber());
		cv.put("remark", u.getRemark());
		ContentValue where = new ContentValue();
		where.put("id", u.getId());
		return DbHelper.update("user", cv, where) > 0;
	}
	
	public boolean update(String username, String pwd) throws ClassNotFoundException, SQLException {
		
		ContentValue cv = new ContentValue();
		cv.put("password", pwd);
		ContentValue where = new ContentValue();
		where.put("username", username);
		return DbHelper.update("User", cv, where) > 0;
	}
	

	@Override
	public boolean delete(List<Integer> userIds) throws ClassNotFoundException,
			SQLException {
		boolean result = true;
		for(Integer id : userIds) {
			 boolean tempRes = DbHelper.delete("user", id);
			 if(tempRes == false) {
				 result = false;
			 }
		}
		return result;
	}

	@Override
	public User get(String username, String pwd) {
		ContentValue where = new ContentValue();
		where.put("username", username);
		where.put("password", pwd);
		 try {
			List<User> users = DbHelper.select(User.class, "user", where,LogicContance.PAGE_SIZE, 0);
			if(users!=null && !users.isEmpty()) {
				return users.get(0);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return null;
	}

	@Override
	public User get(String name) {
		ContentValue where = new ContentValue();
		where.put("name", name);
		 try {
			List<User> users = DbHelper.select(User.class, "user", where,0, 0);
			if(users!=null && !users.isEmpty()) {
				return users.get(0);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public User getById(int uid) {

		ContentValue where = new ContentValue();
		where.put("id", uid);
		 try {
			List<User> users = DbHelper.select(User.class, "user", where,0, 0);
			if(users!=null && !users.isEmpty()) {
				return users.get(0);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
