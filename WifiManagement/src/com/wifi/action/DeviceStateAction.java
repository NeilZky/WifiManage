package com.wifi.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.wifi.constance.UserType;
import com.wifi.daoimpl.DeviceStateDao;
import com.wifi.daoimpl.UserDao;
import com.wifi.entity.DeviceState;
import com.wifi.entity.User;
import com.wifi.utils.DateUtils;
import com.wifi.vo.DeviceStateInfo;

public class DeviceStateAction extends BaseAction{
	
	private DeviceStateDao deviceStateDao = new DeviceStateDao();
	private List<DeviceStateInfo> deviceStateInfos;
	private List<User> users;
	private UserDao userDao = new UserDao();
	
	@Override
	public String execute() throws Exception {
		
		User user = getSessionUser();
		List<DeviceState> deviceStates = null;
		if(user!=null) {
			if(user.getType() == UserType.ADMIN) {
				deviceStates = deviceStateDao.getAllDeviceState();
			} else if(user.getType() == UserType.NOMARL_ADMIN){
				deviceStates = deviceStateDao.getDeviceStateCreateBy(user.getId());
			} else {
				deviceStates = deviceStateDao.getDeviceStateByUid(user.getId());
				if(deviceStates!=null) {
					for(DeviceState ds : deviceStates) {
						ds.setUser(user);
					}
				}
			}
			if(deviceStates!=null && !deviceStates.isEmpty()) {
				deviceStateInfos = new ArrayList<DeviceStateInfo>();
				for(DeviceState temp : deviceStates) {
					DeviceStateInfo deviceStateInfo = new DeviceStateInfo();
					deviceStateInfo.setDeviceState(temp);
					Calendar lastSyncTime = DateUtils.convertToCalendar(temp.getLastSyncTime());
					//同步时间是五分钟，请求数据需要一定时间，算上失败重发，如果上次同步时间距离当前大于6分钟，认为服务器离线
					Calendar now = Calendar.getInstance();
					lastSyncTime.add(Calendar.MINUTE, 6);
					if(lastSyncTime.before(now)) {
						deviceStateInfo.setOffline(true);
					} else {
						deviceStateInfo.setOffline(false);
					}
					deviceStateInfos.add(deviceStateInfo);
				}
			}
		}
		return SUCCESS;
	}

	public String deviceStateList() {
		
		User u = getSessionUser();
		if (u.getType() == UserType.ADMIN) {
			users = userDao.getAllSellers();
			return "deviceStateList";
		} else if (u.getType() == UserType.NOMARL_ADMIN) {
			users = userDao.getSellerCreateBy(u.getId());
			return "deviceStateList";
		} else {
			return SUCCESS;
		}
	}
	
	public List<DeviceStateInfo> getDeviceStateInfos() {
		return deviceStateInfos;
	}

	public void setDeviceStateInfos(List<DeviceStateInfo> deviceStateInfos) {
		this.deviceStateInfos = deviceStateInfos;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
	
}
