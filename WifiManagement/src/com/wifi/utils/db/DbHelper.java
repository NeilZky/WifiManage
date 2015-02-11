package com.wifi.utils.db;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import com.wifi.utils.ConvertUtils;
import com.wifi.utils.StringUtils;

public class DbHelper {

	public static int insert(ContentValue cv, String tableName)
			throws ClassNotFoundException, SQLException {
		
		if (cv == null || cv.size() == 0 || tableName == null
				|| tableName.isEmpty()) {
			return 0;
		}
		tableName = tableName.toLowerCase();
		Connection conn = DBUtils.getConnection();
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO " + tableName + "( ");
		Set<String> keys = cv.getKeySet();
		Object keyStrs[] = keys.toArray();
		List<String> keyList = new ArrayList<String>();
		for (Object obj : keyStrs) {
			keyList.add((String) obj);
		}
		boolean isFirst = true;
		for (String temp : keyList) {
			if (isFirst) {
				sb.append(temp);
				isFirst = false;
			} else {
				sb.append(", " + temp);
			}
		}
		sb.append(") VALUES (");
		isFirst = true;
		for (int i = 0; i < cv.size(); i++) {
			if (isFirst) {
				sb.append("?");
				isFirst = false;
			} else {
				sb.append(", ?");
			}
		}
		sb.append(" )");
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());
		for (int i = 0; i < keyList.size(); i++) {
			pstmt.setString(i + 1, cv.get(keyList.get(i)));
		}
		pstmt.executeUpdate();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select LAST_INSERT_ID() AS ID");
		int res = 0;
		while(rs.next()) {
			res = rs.getInt("ID");
		}
		conn.close();
		return res;
	}

	public static boolean exist(String tableName, ContentValue cv)
			throws ClassNotFoundException, SQLException {

		if (cv == null || cv.size() == 0 || tableName == null
				|| tableName.isEmpty()) {
			return false;
		}
		tableName = tableName.toLowerCase();

		Connection conn = DBUtils.getConnection();
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT id FROM " + tableName + " WHERE ");
		Set<String> keys = cv.getKeySet();
		Object keyStrs[] = keys.toArray();
		List<String> keyList = new ArrayList<String>();
		for (Object obj : keyStrs) {
			keyList.add((String) obj);
		}
		boolean isFirst = true;
		for (String temp : keyList) {
			if (isFirst) {
				sb.append(temp + " = ? ");
				isFirst = false;
			} else {
				sb.append(" AND " + temp + " = ? ");
			}
		}
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());
		for (int i = 0; i < keyList.size(); i++) {
			pstmt.setString(i + 1, cv.get(keyList.get(i)));
		}
		ResultSet rs = pstmt.executeQuery();
		boolean res = rs.next();
		rs.close();
		pstmt.close();
		conn.close();
		return res;
	}

	public static int getCount(String tableName) throws ClassNotFoundException, SQLException {
		
		if (tableName == null || tableName.isEmpty() ) {
			return 0;
		}
		tableName = tableName.toLowerCase();
		Connection conn = DBUtils.getConnection();
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT COUNT(*) AS itemCount FROM " + tableName  );
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sb.toString());
		int res = 0;
		if(rs.next()) {
			res = rs.getInt("itemCount");
		}
		rs.close();
		stmt.close();
		conn.close();
		return res;
	}
	
public static int getCount(String tableName, ContentValue cv) throws ClassNotFoundException, SQLException {
		
		if (tableName == null || tableName.isEmpty() ) {
			return 0;
		}
		tableName = tableName.toLowerCase();
		Connection conn = DBUtils.getConnection();
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT COUNT(*) AS itemCount FROM " + tableName  + " WHERE "  );
		Set<String> keys = cv.getKeySet();
		Object keyStrs[] = keys.toArray();
		List<String> keyList = new ArrayList<String>();
		for (Object obj : keyStrs) {
			keyList.add((String) obj);
		}
		boolean isFirst = true;
		for (String temp : keyList) {
			if (isFirst) {
				sb.append(temp + " = '" +cv.get(temp) +"'");
				isFirst = false;
			} else {
				sb.append(", " +  temp + " = '" +cv.get(temp) +"'");
			}
		}
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sb.toString());
		int res = 0;
		if(rs.next()) {
			res = rs.getInt("itemCount");
		}
		rs.close();
		stmt.close();
		conn.close();
		return res;
	}
	
	public static boolean delete(String tableName, int id)
			throws ClassNotFoundException, SQLException {

		if (tableName == null || tableName.isEmpty() || id == 0) {
			return false;
		}
		tableName = tableName.toLowerCase();

		Connection conn = DBUtils.getConnection();
		StringBuffer sb = new StringBuffer();
		sb.append("DELETE FROM " + tableName + " WHERE ID = ?");
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());
		pstmt.setInt(1, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return true;
	}

	public static boolean delete(String tableName, String column, String value)
			throws ClassNotFoundException, SQLException {

		if (StringUtils.isNullOrEmpty(tableName)
				|| StringUtils.isNullOrEmpty(column)
				|| StringUtils.isNullOrEmpty(value)) {
			return false;
		}
		tableName = tableName.toLowerCase();

		Connection conn = DBUtils.getConnection();
		StringBuffer sb = new StringBuffer();
		sb.append("DELETE FROM " + tableName + " WHERE " + column + " = ? ");
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());
		pstmt.setString(1, value);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return true;
	}

	public static int update(String tableName, ContentValue cv,
			ContentValue where) throws ClassNotFoundException, SQLException {

		if (StringUtils.isNullOrEmpty(tableName) || cv == null || cv.isEmpty()) {
			return 0;
		}
		tableName = tableName.toLowerCase();

		Connection conn = DBUtils.getConnection();
		StringBuffer sb = new StringBuffer();
		sb.append("UPDATE " + tableName + " SET ");
		Set<String> keys = cv.getKeySet();
		Object keyStrs[] = keys.toArray();
		List<String> keyList = new ArrayList<String>();
		for (Object obj : keyStrs) {
			keyList.add((String) obj);
		}
		boolean isFirst = true;
		for (String temp : keyList) {
			if (isFirst) {
				sb.append(temp + " = ? ");
				isFirst = false;
			} else {
				sb.append(", " + temp + " = ? ");
			}
		}
		sb.append(" WHERE ");
		isFirst = true;
		List<String> whereKeyList = new ArrayList<String>();
		Object whereKeyStrs[] = where.getKeySet().toArray();
		for (Object obj : whereKeyStrs) {
			whereKeyList.add((String) obj);
		}
		for (String temp : whereKeyList) {
			if (isFirst) {
				sb.append(temp + " = ? ");
				isFirst = false;
			} else {
				sb.append(" AND " + temp + " = ? ");
			}
		}
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());
		int index = 1;
		for (String temp : keyList) {
			pstmt.setString(index, cv.get(temp));
			index++;
		}
		for (String temp : whereKeyList) {
			pstmt.setString(index, where.get(temp));
			index++;
		}
		int res = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return res;
	}

	/**
	 * 本方法要求cls 实体与数据库名称列名一致, 并且class 要实现get set方法
	 * 
	 * @param cls
	 * @param tableName
	 * @param where
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public static <T> List<T> select(Class<T> cls, String tableName,
			ContentValue where, int pageSize, int page) throws ClassNotFoundException, SQLException {

		if (cls == null || StringUtils.isNullOrEmpty(tableName)) {
			return null;
		}
		tableName = tableName.toLowerCase();

		Connection conn = DBUtils.getConnection();
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT * FROM " + tableName);
		List<String> whereList = null;
		if (where != null && !where.isEmpty()) {
			Set<String> set = where.getKeySet();
			whereList = ConvertUtils.convert(set);
			sb.append(" WHERE ");
			boolean isFirst = true;
			for (String temp : whereList) {
				if (isFirst) {
					sb.append(temp + " = ? ");
					isFirst = false;
				} else {
					sb.append("AND " + temp + " = ? ");
				}
			}
		}
		if(page >0 && pageSize >0) {
			sb.append(" LIMIT " + pageSize + " OFFSET " + (page-1) * pageSize);
		}
		
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());
		if (whereList!=null) {
			int index = 1;
			for (String temp : whereList) {
				pstmt.setString(index, where.get(temp));
				index++;
			}
		}
		ResultSet rs = pstmt.executeQuery();
		List<T> res = new ArrayList<T>();
		while (rs.next()) {
			try {
				T t = cls.newInstance();
				Field fields[] = cls.getDeclaredFields();
				Class fatherCls = cls.getSuperclass();
				if(fatherCls !=null && !fatherCls.getName().equals(Object.class.getName())) {
					Field[] fahterFeilds = fatherCls.getDeclaredFields();
					ArrayList<Field> fieldList = new ArrayList<Field>();
					for(Field f : fields) {
						fieldList.add(f);
					}
					for(Field f : fahterFeilds) {
						fieldList.add(f);
					}		
					fields = (Field[]) fieldList.toArray(new Field[fieldList.size()]);
				}
				for (Field tempField : fields) {
					if(tempField.getName() == "serialVersionUID") {
						continue;
					}
					Class type = tempField.getType();
					if (type == int.class || type == Integer.class) {
						Method method = cls.getMethod("set"
								+ tempField.getName().substring(0, 1)
										.toUpperCase()
								+ tempField.getName().substring(1), int.class);
						method.invoke(t, rs.getInt(tempField.getName()));
					} else if (type == long.class || type == Long.class) {
						Method method = cls.getMethod("set"
								+ tempField.getName().substring(0, 1)
										.toUpperCase()
								+ tempField.getName().substring(1), long.class);
						method.invoke(t, rs.getLong(tempField.getName()));
					} else if (type == boolean.class || type == Boolean.class) {
						Method method = cls.getMethod("set"
								+ tempField.getName().substring(0, 1)
										.toUpperCase()
								+ tempField.getName().substring(1),
								boolean.class);
						method.invoke(t, rs.getBoolean(tempField.getName()));
					} else if (type == double.class || type == Double.class) {
						Method method = cls.getMethod("set"
								+ tempField.getName().substring(0, 1)
										.toUpperCase()
								+ tempField.getName().substring(1),
								double.class);
						method.invoke(t, rs.getDouble(tempField.getName()));
					} else if (type == float.class || type == Float.class) {
						Method method = cls
								.getMethod("set"
										+ tempField.getName().substring(0, 1)
												.toUpperCase()
										+ tempField.getName().substring(1),
										float.class);
						method.invoke(t, rs.getFloat(tempField.getName()));
					} else if(type == String.class) {
						Method method = cls
								.getMethod("set"
										+ tempField.getName().substring(0, 1)
												.toUpperCase()
										+ tempField.getName().substring(1),
										String.class);
						method.invoke(t, rs.getString(tempField.getName()));
					}
				}
				res.add(t);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		conn.close();
		return res;
	}
	
	public static <T> List<T> select(Class<T> cls, String tableName,
			ContentValue where, String oderyBy, int pageSize, int page) throws ClassNotFoundException, SQLException {

		if (cls == null || StringUtils.isNullOrEmpty(tableName)) {
			return null;
		}
		tableName = tableName.toLowerCase();

		Connection conn = DBUtils.getConnection();
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT * FROM " + tableName);
		List<String> whereList = null;
		if (where != null && !where.isEmpty()) {
			Set<String> set = where.getKeySet();
			whereList = ConvertUtils.convert(set);
			sb.append(" WHERE ");
			boolean isFirst = true;
			for (String temp : whereList) {
				if (isFirst) {
					sb.append(temp + " = ? ");
					isFirst = false;
				} else {
					sb.append("AND " + temp + " = ? ");
				}
			}
		}
		if(!StringUtils.isNullOrEmpty(oderyBy)) {
			sb.append(" ORDER BY  " + oderyBy +" ");
		}
		if(page >0 && pageSize >0) {
			sb.append(" LIMIT " + pageSize + " OFFSET " + (page-1) * pageSize);
		}
		
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());
		if (whereList!=null) {
			int index = 1;
			for (String temp : whereList) {
				pstmt.setString(index, where.get(temp));
				index++;
			}
		}
		ResultSet rs = pstmt.executeQuery();
		List<T> res = new ArrayList<T>();
		while (rs.next()) {
			try {
				T t = cls.newInstance();
				Field fields[] = cls.getDeclaredFields();
				Class fatherCls = cls.getSuperclass();
				if(fatherCls !=null && !fatherCls.getName().equals(Object.class.getName())) {
					Field[] fahterFeilds = fatherCls.getDeclaredFields();
					ArrayList<Field> fieldList = new ArrayList<Field>();
					for(Field f : fields) {
						fieldList.add(f);
					}
					for(Field f : fahterFeilds) {
						fieldList.add(f);
					}		
					fields = (Field[]) fieldList.toArray(new Field[fieldList.size()]);
				}
				for (Field tempField : fields) {
					if(tempField.getName() == "serialVersionUID") {
						continue;
					}
					Class type = tempField.getType();
					if (type == int.class || type == Integer.class) {
						Method method = cls.getMethod("set"
								+ tempField.getName().substring(0, 1)
										.toUpperCase()
								+ tempField.getName().substring(1), int.class);
						method.invoke(t, rs.getInt(tempField.getName()));
					} else if (type == long.class || type == Long.class) {
						Method method = cls.getMethod("set"
								+ tempField.getName().substring(0, 1)
										.toUpperCase()
								+ tempField.getName().substring(1), long.class);
						method.invoke(t, rs.getLong(tempField.getName()));
					} else if (type == boolean.class || type == Boolean.class) {
						Method method = cls.getMethod("set"
								+ tempField.getName().substring(0, 1)
										.toUpperCase()
								+ tempField.getName().substring(1),
								boolean.class);
						method.invoke(t, rs.getBoolean(tempField.getName()));
					} else if (type == double.class || type == Double.class) {
						Method method = cls.getMethod("set"
								+ tempField.getName().substring(0, 1)
										.toUpperCase()
								+ tempField.getName().substring(1),
								double.class);
						method.invoke(t, rs.getDouble(tempField.getName()));
					} else if (type == float.class || type == Float.class) {
						Method method = cls
								.getMethod("set"
										+ tempField.getName().substring(0, 1)
												.toUpperCase()
										+ tempField.getName().substring(1),
										float.class);
						method.invoke(t, rs.getFloat(tempField.getName()));
					} else if(type == String.class) {
						Method method = cls
								.getMethod("set"
										+ tempField.getName().substring(0, 1)
												.toUpperCase()
										+ tempField.getName().substring(1),
										String.class);
						method.invoke(t, rs.getString(tempField.getName()));
					}
				}
				res.add(t);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		conn.close();
		return res;
	}
	
	public static void clear(String tableName) {
		
		execute("delete from " + tableName);
	}
	
	public static void execute(String sql) {
		
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			Statement stmt = conn.createStatement();
			stmt.execute(sql);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
