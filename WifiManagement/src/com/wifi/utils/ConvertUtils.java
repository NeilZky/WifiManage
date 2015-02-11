package com.wifi.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class ConvertUtils {
	
	public static <T> List convert(Set<T> set) {
		
		List list = new ArrayList();
		list.addAll(set);
		return list;
	}
	
}
