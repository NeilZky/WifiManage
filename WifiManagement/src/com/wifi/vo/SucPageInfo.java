package com.wifi.vo;

import java.util.Collection;
import java.util.List;

import com.wifi.entity.CommonArea;
import com.wifi.entity.CommonAreaConfig;
import com.wifi.entity.NavPageType;
import com.wifi.entity.ScrollAd;
import com.wifi.entity.SellerArea;
import com.wifi.entity.SellerConfig;

public class SucPageInfo {
	
	private List<ScrollAd> scrollAds;
	private Collection<NavPageType> navPageTypes;
	private List<CommonArea> commonAreas;
	private CommonAreaConfig commonAreaConfig;
	private List<SellerArea> sellerAreas;
	private SellerConfig sellerConfig;
	private int uid;
	public List<ScrollAd> getScrollAds() {
		return scrollAds;
	}
	public void setScrollAds(List<ScrollAd> scrollAds) {
		this.scrollAds = scrollAds;
	}
	public Collection<NavPageType> getNavPageTypes() {
		return navPageTypes;
	}
	public void setNavPageTypes(Collection<NavPageType> navPageTypes) {
		this.navPageTypes = navPageTypes;
	}
	public List<CommonArea> getCommonAreas() {
		return commonAreas;
	}
	public void setCommonAreas(List<CommonArea> commonAreas) {
		this.commonAreas = commonAreas;
	}
	public CommonAreaConfig getCommonAreaConfig() {
		return commonAreaConfig;
	}
	public void setCommonAreaConfig(CommonAreaConfig commonAreaConfig) {
		this.commonAreaConfig = commonAreaConfig;
	}
	public List<SellerArea> getSellerAreas() {
		return sellerAreas;
	}
	public void setSellerAreas(List<SellerArea> sellerAreas) {
		this.sellerAreas = sellerAreas;
	}
	public SellerConfig getSellerConfig() {
		return sellerConfig;
	}
	public void setSellerConfig(SellerConfig sellerConfig) {
		this.sellerConfig = sellerConfig;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
}
