package com.wifi.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.wifi.constance.LinkType;
import com.wifi.daoimpl.CommonAreaDao;
import com.wifi.daoimpl.LinkCountDao;
import com.wifi.daoimpl.NavPageDao;
import com.wifi.daoimpl.ScrollAdDao;
import com.wifi.daoimpl.SellerAreaDao;
import com.wifi.entity.CommonArea;
import com.wifi.entity.NavPage;
import com.wifi.entity.ScrollAd;
import com.wifi.entity.SellerArea;
import com.wifi.utils.DateUtils;

public class RedirectAction extends BaseAction{
	
	private int id;
	private int linkType;
	private int uid;
	private String redirectUrl;
	private NavPageDao navPageDao = new NavPageDao();
	private LinkCountDao linkCountDao = new LinkCountDao();
	private ScrollAdDao scrollAdDao = new ScrollAdDao();
	private CommonAreaDao commonAreaDao = new CommonAreaDao();
	private SellerAreaDao sellerDao = new SellerAreaDao();
	private static List<String> ipcache = new ArrayList<String>();
	
	
	@Override
	public String execute() throws Exception {
		
		switch (linkType) {
		case LinkType.NAV_PAGE:
			 handleNavPageLink();
			break;
		case LinkType.SCROLL_AD_PAGE:
			handleScrollAdLink();
			break;
		case LinkType.COMMON_AREA:
			handleCommonAreaLink();
			break;
		case LinkType.SELLER_AREA:
			handleSellerAreaLink();
			break;
		default:
			break;
		}
		savePageCount(redirectUrl);
		return SUCCESS;
	}

	private void handleSellerAreaLink() {
		
		SellerArea sa = sellerDao.getByID(id);
		if(sa!=null) {
			redirectUrl = sa.getLinkUrl();
		}
	}

	private void handleNavPageLink() {
	
		
		NavPage navPage = navPageDao.getById(id);
		if(navPage!=null) {
			redirectUrl = navPage.getLinkUrl();
		}
	}
	
	private void handleScrollAdLink() {
	
		
		ScrollAd scrollAd = scrollAdDao.getById(id);
		if(scrollAd!=null) {
			redirectUrl = scrollAd.getLinkUrl();
		}
	}
	
	private void handleCommonAreaLink() {
		
		CommonArea ca = commonAreaDao.getById(id);
		if(ca!=null) {
			redirectUrl = ca.getLinkUrl();
		}
	}
	
	private void savePageCount(String linkUrl) {

		String ip = ServletActionContext.getRequest().getRemoteAddr();
		
		String date = DateUtils.getCurrentDate();
		linkCountDao.createIfNotExist(linkType, uid, linkUrl,date);
		int addUip = 0;
		for (int i = ipcache.size() - 1; i >= 0; i--) {
			String temp = ipcache.get(i);
			if (!temp.startsWith(date)) {
				ipcache.remove(i);
			}
		}
		if (!ipcache.contains(date + ip+ linkType + id + uid)) {
			addUip = 1;
			ipcache.add(date + ip+ linkType + id + uid);
		}
		linkCountDao.addCountByDate(linkType, uid, linkUrl,1, addUip);
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLinkType() {
		return linkType;
	}

	public void setLinkType(int linkType) {
		this.linkType = linkType;
	}

	public String getRedirectUrl() {
		return redirectUrl;
	}

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
}
