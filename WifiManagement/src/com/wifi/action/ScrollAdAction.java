package com.wifi.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wifi.daoimpl.ScrollAdDao;
import com.wifi.entity.ScrollAd;
import com.wifi.utils.StringUtils;
import com.wifi.vo.BaseResult;

public class ScrollAdAction extends BaseAction {

	private static final long serialVersionUID = -8046564250925377737L;
	private ScrollAdDao scrollAdDao = new ScrollAdDao();
	private List<ScrollAd> scrollAds;
	private ScrollAd scrollAd;
	private BaseResult result;
	private ArrayList<Integer> deleteIDs;

	public String scrollAd() {

		int count = scrollAdDao.getCount();
		if(count == 0) {
			scrollAdDao.copyFromReleaseTable();
		}
		try {
			scrollAds = scrollAdDao.getScrollAds();
			return SUCCESS;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;
	}

	public String saveScrollAdRelease() {
		
		scrollAdDao.copyToReleaseTable();
		return SUCCESS;
	}
	
	public String cancelScrollAdRelease() {
		
		scrollAdDao.copyFromReleaseTable();
		return SUCCESS;
	}
	
	public String addScrollAd() {

		if(scrollAd == null) {
			return INPUT;
		}
		String photoUrl = saveFile();
		if(!StringUtils.isNullOrEmpty(photoUrl)) {
			scrollAd.setPhotoUrl(photoUrl);
			try {
				scrollAdDao.insert(scrollAd);
				return SUCCESS;
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return INPUT;
	}


	public String updateScrollAd() {

		if(scrollAd == null) {
			return INPUT;
		}
		String photoUrl = saveFile();
		if(!StringUtils.isNullOrEmpty(photoUrl)) {
			scrollAd.setPhotoUrl(photoUrl);
			try {
				scrollAdDao.update(scrollAd);
				return SUCCESS;
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return INPUT;
	}

	public String deleteScrollAds() {

		result = new BaseResult();
		boolean success = scrollAdDao.delete(deleteIDs, "ScrollAd");
		if (success) {
			result.setCode(BaseResult.CODE_SUCCESS);
			result.setUrl("scrollAd.action");
		} else {
			result.setCode(BaseResult.CODE_FAILURE);
			result.setInfo("É¾³ýÊ§°Ü");
		}

		return SUCCESS;
	}

	public List<ScrollAd> getScrollAds() {
		return scrollAds;
	}

	public void setScrollAds(List<ScrollAd> scrollAds) {
		this.scrollAds = scrollAds;
	}

	public ScrollAd getScrollAd() {
		return scrollAd;
	}

	public void setScrollAd(ScrollAd scrollAd) {
		this.scrollAd = scrollAd;
	}

	public BaseResult getResult() {
		return result;
	}

	public void setResult(BaseResult result) {
		this.result = result;
	}

	public ArrayList<Integer> getDeleteIDs() {
		return deleteIDs;
	}

	public void setDeleteIDs(ArrayList<Integer> deleteIDs) {
		this.deleteIDs = deleteIDs;
	}


}
