package com.wifi.utils.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {

	 public static Connection getConnection() throws SQLException, 
     java.lang.ClassNotFoundException {
		 //第一步：加载MySQL的JDBC的驱动
		 Class.forName("com.mysql.jdbc.Driver");
//		 String url = "jdbc:mysql://localhost:3306/wifimanagement";        
//		 String username = "root";
//		 String password = "password";
		 String url = "jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_wifimanageaccess";        
		 String username = "mjxy4z0ono";
		 String password = "2xlmijz11k2kxh5lwj1klw0h1mxz555j30kwh133";
		 Connection con = DriverManager.getConnection(url, username, password);        
		 return con;        
	 }
	 
}
