package com.wifi.vo;

import com.wifi.entity.DeviceState;

public class DeviceStateInfo {

	private DeviceState deviceState;
	private boolean offline;


	public DeviceState getDeviceState() {
		return deviceState;
	}

	public void setDeviceState(DeviceState deviceState) {
		this.deviceState = deviceState;
	}

	public boolean isOffline() {
		return offline;
	}

	public void setOffline(boolean offline) {
		this.offline = offline;
	}

}
