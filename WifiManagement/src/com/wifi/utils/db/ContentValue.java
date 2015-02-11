package com.wifi.utils.db;

import java.util.HashMap;
import java.util.Set;

public class ContentValue {

	private HashMap<String, Object> data = new HashMap<String, Object>();

	public void put(String key, Object value) {
		
		if(key!=null) {
			data.put(key, value);
		}
	}

	public void put(String key, int value) {
		
		data.put(key, Integer.valueOf(value));
	}
	
	public void put(String key, double value) {
		
		data.put(key, Double.valueOf(value));
	}

	public void put(String key, float value) {
		
		data.put(key, Float.valueOf(value));
	}

	public void put(String key, boolean value) {
		
		data.put(key, Boolean.valueOf(value));
	}
	
	public String get(String key){
		
		Object res = data.get(key);
		if(res!=null) {
			return res.toString();
		}
		return null;
	}
	
	public boolean isEmpty() {
		
		return data.isEmpty();
	}
	
	public Set<String> getKeySet() {
		
		return data.keySet();
	}
	
	
	
	public int size() {
		
		return data.size();
	}
	
}
