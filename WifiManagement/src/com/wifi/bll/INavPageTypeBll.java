package com.wifi.bll;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wifi.entity.NavPageType;
import com.wifi.entity.User;

public interface INavPageTypeBll {

	public List<NavPageType> getTypes() throws ClassNotFoundException, SQLException;
	public int add(String name) throws ClassNotFoundException, SQLException ;
	public boolean update(NavPageType navPageType) throws ClassNotFoundException, SQLException ;
	public boolean delete(ArrayList<Integer> deleteIDs) throws ClassNotFoundException, SQLException ;;

}
