package com.wifi.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.wifi.dao.ICommonAreaConfigDao;
import com.wifi.dao.IPageCountDao;
import com.wifi.dao.ISellerAreaDao;
import com.wifi.dao.ISellerConfigDao;
import com.wifi.dao.ISellerPageCountDao;
import com.wifi.daoimpl.CommonAreaConfigDao;
import com.wifi.daoimpl.CommonAreaDao;
import com.wifi.daoimpl.DeviceStateDao;
import com.wifi.daoimpl.NavPageTypeDao;
import com.wifi.daoimpl.PageCountDao;
import com.wifi.daoimpl.ScrollAdDao;
import com.wifi.daoimpl.SellerAreaDao;
import com.wifi.daoimpl.SellerConfigDao;
import com.wifi.daoimpl.SellerPageCountDao;
import com.wifi.daoimpl.UserDao;
import com.wifi.entity.CommonArea;
import com.wifi.entity.CommonAreaConfig;
import com.wifi.entity.NavPageType;
import com.wifi.entity.ScrollAd;
import com.wifi.entity.SellerArea;
import com.wifi.entity.SellerConfig;
import com.wifi.entity.User;
import com.wifi.utils.DateUtils;
import com.wifi.vo.SucPageInfo;

/**
 * 
 * 设备与后台通信获取主页，登陆等
 */
public class ConnectAction extends BaseAction {

	private String action;
	private String client;
	private String location;
	private String deviceid;
	private String tokenID;
	private String seed;
	private String onlineusers;
	private UserDao userDao = new UserDao();
	private ScrollAdDao scrollAdDao = new ScrollAdDao();
	private NavPageTypeDao navPageTypeDao = new NavPageTypeDao();
	private CommonAreaDao commonAreaDao = new CommonAreaDao();
	private ICommonAreaConfigDao commonAreaConfigDao = new CommonAreaConfigDao();
	private SellerAreaDao sellerAreaDao = new SellerAreaDao();
	private ISellerConfigDao sellerConfigDao = new SellerConfigDao();
	private SucPageInfo sucPageInfo;
	private static List<String> ipcache = new ArrayList<String>();
	private static List<String> sellerIpcache = new ArrayList<String>();
	private IPageCountDao pageCountDao = new PageCountDao();
	private DeviceStateDao onlineUserCountDao = new DeviceStateDao();
	private ISellerPageCountDao sellerPageCountDao = new SellerPageCountDao();
	private int uid;
	private int browserType;
	private static final int BROWSER_TYPE_PC = 0;
	private static final int BROWSER_TYPE_MOBILE = 1;
	
	@Override
	public String execute() throws Exception {

		if (action == null) {
			return ERROR;
		}

		if ("getsucpage".equals(action)) {
			return getsucpage();
		} else if ("sync".equals(action)) {
			sync();
		} else if ("previewNavPage".equals(action)) {
			return previewNavPage();
		} else if ("previewScrollAd".equals(action)) {
			return previewScrollAd();
		} else if ("previewCommonArea".equals(action)) {
			return previewCommonArea();
		} else if("previewSellerArea".equals(action)) {
			return previewSellerArea();
		}
		return SUCCESS;
	}
	
	private String returnByBrowserType() {
		
		if(browserType == BROWSER_TYPE_MOBILE) {
			return "sucPageMobile";
		} else {
			return "sucPage";
		}
	}

	private String previewSellerArea() throws ClassNotFoundException,
					SQLException  {
		User u = userDao.getById(uid);
		if (u == null) {
			return ERROR;
		}
		sucPageInfo = new SucPageInfo();
		List<ScrollAd> scrollAds =scrollAdDao.getScrollAdReleases();
		Collection<NavPageType> navPageTypes = navPageTypeDao.getTypeReleases();
		List<CommonArea> commonAreas = commonAreaDao.getCommonAreaReleases(u.getCreatorId());
		CommonAreaConfig commonAreaConfig = commonAreaConfigDao
				.getCommonAreaConfig(u.getCreatorId());
		List<SellerArea> sellerAreas = sellerAreaDao.getSellerAreas(uid);
		SellerConfig sellerConfig = sellerConfigDao.getSellerConfigByUserId(uid);
		sucPageInfo.setScrollAds(scrollAds);
		sucPageInfo.setNavPageTypes(navPageTypes);
		sucPageInfo.setCommonAreaConfig(commonAreaConfig);
		sucPageInfo.setCommonAreas(commonAreas);	
		sucPageInfo.setSellerConfig(sellerConfig);
		sucPageInfo.setSellerAreas(sellerAreas);
		return returnByBrowserType();
	}

	private String previewCommonArea() throws ClassNotFoundException,
			SQLException {
		sucPageInfo = new SucPageInfo();
		List<ScrollAd> scrollAds =scrollAdDao.getScrollAdReleases();
		Collection<NavPageType> navPageTypes = navPageTypeDao.getTypeReleases();
		List<CommonArea> commonAreas = commonAreaDao.getCommonAreas(uid);
		CommonAreaConfig commonAreaConfig = commonAreaConfigDao
				.getCommonAreaConfig(uid);
		sucPageInfo.setScrollAds(scrollAds);
		sucPageInfo.setNavPageTypes(navPageTypes);
		sucPageInfo.setCommonAreaConfig(commonAreaConfig);
		sucPageInfo.setCommonAreas(commonAreas);
		return returnByBrowserType();
	}

	private String previewScrollAd() throws ClassNotFoundException,
			SQLException {

		sucPageInfo = new SucPageInfo();
		List<ScrollAd> scrollAds = scrollAdDao.getScrollAds();
		Collection<NavPageType> navPageTypes = navPageTypeDao.getTypeReleases();
		sucPageInfo.setScrollAds(scrollAds);
		sucPageInfo.setNavPageTypes(navPageTypes);
		return returnByBrowserType();
	}

	private String previewNavPage() throws ClassNotFoundException, SQLException {

		sucPageInfo = new SucPageInfo();
		List<ScrollAd> scrollAds = scrollAdDao.getScrollAdReleases();
		Collection<NavPageType> navPageTypes = navPageTypeDao.getTypes();
		sucPageInfo.setScrollAds(scrollAds);
		sucPageInfo.setNavPageTypes(navPageTypes);
		return returnByBrowserType();
	}

	private String getsucpage() throws ClassNotFoundException, SQLException {

		User u = userDao.get(client);
		if (u == null) {
			return ERROR;
		}
		sucPageInfo = new SucPageInfo();
		List<ScrollAd> scrollAds = scrollAdDao.getScrollAdReleases();
		Collection<NavPageType> navPageTypes = navPageTypeDao.getTypeReleases();
		List<CommonArea> commonAreas = commonAreaDao.getCommonAreaReleases(u
				.getCreatorId());
		CommonAreaConfig commonAreaConfig = commonAreaConfigDao
				.getCommonAreaConfig(u.getCreatorId());
		List<SellerArea> sellerAreas = sellerAreaDao.getSellerAreas(u.getId());
		SellerConfig sellerConfig = sellerConfigDao.getSellerConfigByUserId(u
				.getId());
		sucPageInfo.setScrollAds(scrollAds);
		sucPageInfo.setNavPageTypes(navPageTypes);
		sucPageInfo.setCommonAreaConfig(commonAreaConfig);
		sucPageInfo.setCommonAreas(commonAreas);
		sucPageInfo.setSellerConfig(sellerConfig);
		sucPageInfo.setSellerAreas(sellerAreas);
		sucPageInfo.setUid(u.getId());
		String ip = ServletActionContext.getRequest().getRemoteAddr();
		savePageCount(ip);
		saveSellerPageCount(ip, u.getCreatorId());
		saveSellerPageCount(ip, u.getId());
		return returnByBrowserType();
	}

	

	private String sync() throws ClassNotFoundException, SQLException {
		User u = userDao.get(client);
		if (u == null) {
			return ERROR;
		}
		onlineUserCountDao.createIfNotExist(deviceid, u.getId(),
				Integer.parseInt(onlineusers));
		onlineUserCountDao.update(deviceid, u.getId(),
				Integer.parseInt(onlineusers));
		return SUCCESS;
	}

	private void savePageCount(String ip) {

		pageCountDao.createIfNotExist();
		int addUiv = 0;
		String date = DateUtils.getCurrentDate();
		for (int i = ipcache.size() - 1; i >= 0; i--) {
			String temp = ipcache.get(i);
			if (!temp.startsWith(date)) {
				ipcache.remove(i);
			}
		}
		if (!ipcache.contains(date + ip)) {
			addUiv = 1;
			ipcache.add(date + ip);
		}
		pageCountDao.addCountByDate(1, addUiv);
	}

	private void saveSellerPageCount(String ip, int uid) {

		sellerPageCountDao.createIfNotExist(uid);
		int addUiv = 0;
		String date = DateUtils.getCurrentDate();
		for (int i = sellerIpcache.size() - 1; i >= 0; i--) {
			String temp = sellerIpcache.get(i);
			if (!temp.startsWith(date)) {
				sellerIpcache.remove(i);
			}
		}
		if (!sellerIpcache.contains(date + ip)) {
			addUiv = 1;
			sellerIpcache.add(date + ip);
		}
		sellerPageCountDao.addCountByDate(uid, 1, addUiv);
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDeviceid() {
		return deviceid;
	}

	public void setDeviceid(String deviceid) {
		this.deviceid = deviceid;
	}

	public String getTokenID() {
		return tokenID;
	}

	public void setTokenID(String tokenID) {
		this.tokenID = tokenID;
	}

	public String getSeed() {
		return seed;
	}

	public void setSeed(String seed) {
		this.seed = seed;
	}

	public SucPageInfo getSucPageInfo() {
		return sucPageInfo;
	}

	public void setSucPageInfo(SucPageInfo sucPageInfo) {
		this.sucPageInfo = sucPageInfo;
	}

	public String getOnlineusers() {
		return onlineusers;
	}

	public void setOnlineusers(String onlineusers) {
		this.onlineusers = onlineusers;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getBrowserType() {
		return browserType;
	}

	public void setBrowserType(int browserType) {
		this.browserType = browserType;
	}
	
}
