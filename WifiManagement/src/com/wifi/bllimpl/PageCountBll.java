package com.wifi.bllimpl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wifi.entity.PageCount;
import com.wifi.utils.DateUtils;
import com.wifi.utils.StringUtils;

public class PageCountBll {
	
	public PageCount queryFromList(Calendar calendar , List<? extends PageCount> pageCounts) {
		
		if(pageCounts==null) {
			return null;
		}
		String date = DateUtils.getDate(calendar);
		for(PageCount temp : pageCounts) {
			if(date!=null && date.equals(temp.getRecordDate())) {
				return temp;
			}
		}
		return null;
	}
	
	 public PageCount queryFromMonthList(Calendar calendar , List<PageCount> pageCounts) {
		
		if(pageCounts==null) {
			return null;
		}
		String date = DateUtils.getYearAndMonth(calendar);
		for(PageCount temp : pageCounts) {
			if(date!=null && date.equals(temp.getRecordDate())) {
				return temp;
			}
		}
		return null;
	}
	
	public List<PageCount> convertToMonthList(List<? extends PageCount> pageCounts) {
		
		if(pageCounts!=null) {
			Map<String, PageCount> map = new HashMap<String, PageCount>();
			for(PageCount temp : pageCounts) {
				if(!StringUtils.isNullOrEmpty(temp.getRecordDate())) {
					String ym = DateUtils.getYearAndMonth(temp.getRecordDate());
					PageCount pc = map.get(ym);
					if(pc!=null) {
						pc.setPv(pc.getPv()+ temp.getPv());
						pc.setUip(pc.getUip() + temp.getUip());
					} else {
						pc = new PageCount(temp.getPv(), temp.getUip(), ym);
						map.put(ym, pc);
					}
				}
			}
			List<PageCount> res = new ArrayList<PageCount>();
			res.addAll(map.values());
			return res;
		}
		return null;
	}
}
