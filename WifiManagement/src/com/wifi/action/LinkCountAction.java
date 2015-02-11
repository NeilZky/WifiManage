package com.wifi.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.wifi.bllimpl.PageCountBll;
import com.wifi.constance.UnitType;
import com.wifi.daoimpl.LinkCountDao;
import com.wifi.entity.LinkCount;
import com.wifi.entity.PageCount;
import com.wifi.utils.DateUtils;
import com.wifi.utils.StringUtils;
import com.wifi.vo.FatherPage;
import com.wifi.vo.PageCountInfo;

public class LinkCountAction extends BaseAction {

	private PageCountInfo pcti;
	private PageCountInfo pcyi;
	private LinkCountDao pageCountDao = new LinkCountDao();
	private int unitType = 1;
	private int unit = 1;
	private List<PageCount> gridPcs;
	private static int PAGE_COUNT_SIZE = 10;
	private int pageSize = PAGE_COUNT_SIZE;
	private String date = DateUtils.getCurrentDate();
	private PageCountBll pageCountBll = new PageCountBll();
	private int linkType;
	private int uid;
	private String redirectPage;
	private String name;
	private String typeName;
	private String photoUrl;
	private String linkUrl;
	private String content;
	private FatherPage fatherPage;
	
	@Override
	public String execute() {

		pcti = new PageCountInfo();
		pcyi = new PageCountInfo();
		LinkCount pc = pageCountDao.getByDate(linkType, uid, linkUrl,date);
		if (pc != null) {
			pcti.setPv(pc.getPv());
			pcti.setUip(pc.getUip());
		}
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_YEAR, -1);
		LinkCount yestodayPc = pageCountDao.getByDate(linkType, uid, linkUrl,DateUtils.getDate(c));
		if (yestodayPc != null) { 
			pcyi.setPv(yestodayPc.getPv());
			pcyi.setUip(yestodayPc.getUip());
		}
		switch (unitType) {
		case UnitType.DAY:
			handleDayQuery();
			break;
		case UnitType.WEEK:
			handleWeekQuery();
			break;
		case UnitType.CUSTOM:
			handleCustomQuery();
			break;
		case UnitType.MONTH:
			handleMonthQuery();
			break;
		case UnitType.YEAR:
			handleYearQuery();
			break;
		default:
			break;
		}
		redirectPage = "linkCount.jsp";
		return SUCCESS;
	}

	private void handleMonthQuery() {

		if (!StringUtils.isNullOrEmpty(date)) {
			gridPcs = new ArrayList<PageCount>();
			String firstDayOfMonth = DateUtils.getFirstDayOfMonth(date);
			String lastDayOfMonth = DateUtils.getLastDayOfMonth(date);
			int num = DateUtils.getDayNumsOfMonth(date);
			List<LinkCount> pageCounts = pageCountDao.getByDate(linkType,uid, linkUrl,
					firstDayOfMonth, lastDayOfMonth, num);
			Calendar calendar = DateUtils
					.getCalendarFromString(firstDayOfMonth);
			PageCount allCount = new PageCount();
			allCount.setRecordDate("总计");
			for (int i = 0; i < num; i++, calendar
					.add(Calendar.DAY_OF_MONTH, 1)) {
				PageCount pc = pageCountBll.queryFromList(calendar, pageCounts);
				if (pc == null) {
					pc = new PageCount(0, 0, DateUtils.getDate(calendar));
				}
				allCount.setPv(allCount.getPv() + pc.getPv());
				allCount.setUip(allCount.getUip() + pc.getUip());
				gridPcs.add(pc);
			}
			gridPcs.add(allCount);
		}
	}

	private void handleYearQuery() {

		if (!StringUtils.isNullOrEmpty(date)) {
			gridPcs = new ArrayList<PageCount>();
			String firstDate = DateUtils.getFirstDayOfYear(date);
			String lateDate = DateUtils.getLastDayOfYear(date);
			// 一年最多366 天。limit366足够了
			List<LinkCount> allPageCounts = pageCountDao.getByDate(linkType,uid, linkUrl,firstDate,
					lateDate, 366);
			List<PageCount> pageCounts = pageCountBll
					.convertToMonthList(allPageCounts);
			PageCount allCount = new PageCount();
			allCount.setRecordDate("总计");
			Calendar calendar = DateUtils.getCalendarFromString(firstDate);
			for (int i = 0; i < 12; i++, calendar.add(Calendar.MONTH, 1)) {
				PageCount pc = pageCountBll.queryFromMonthList(calendar,
						pageCounts);
				if (pc == null) {
					pc = new PageCount(0, 0,
							DateUtils.getYearAndMonth(calendar));
				} else {
					pc.setRecordDate(DateUtils.getYearAndMonth(calendar));
				}
				allCount.setPv(allCount.getPv() + pc.getPv());
				allCount.setUip(allCount.getUip() + pc.getUip());
				gridPcs.add(pc);
			}
			gridPcs.add(allCount);
		}

	}

	private void handleCustomQuery() {

		if (!StringUtils.isNullOrEmpty(date)) {
			gridPcs = new ArrayList<PageCount>();
			Calendar calendar = DateUtils.getCalendarFromString(date);
			calendar.add(Calendar.DAY_OF_YEAR, -unit);
			String firstDate = DateUtils.getDate(calendar);
			List<LinkCount> pageCounts = pageCountDao.getByDate(linkType,uid,linkUrl,firstDate,
					date, unit);
			// week 有7天
			PageCount allCount = new PageCount();
			allCount.setRecordDate("总计");
			for (int i = 0; i <= unit; i++, calendar.add(Calendar.DAY_OF_YEAR,
					1)) {
				PageCount pc = pageCountBll.queryFromList(calendar, pageCounts);
				if (pc == null) {
					pc = new PageCount(0, 0, DateUtils.getDate(calendar));
				} else {
					pc.setRecordDate(DateUtils.getDate(calendar));
				}
				allCount.setPv(allCount.getPv() + pc.getPv());
				allCount.setUip(allCount.getUip() + pc.getUip());
				gridPcs.add(pc);
			}
			gridPcs.add(allCount);
		}
	}

	private void handleWeekQuery() {

		if (!StringUtils.isNullOrEmpty(date)) {
			gridPcs = new ArrayList<PageCount>();
			String firstDayOfWeek = DateUtils.getFirstDayOfWeek(date);
			String lastDayOfWeek = DateUtils.getLastDayOfWeek(date);
			List<LinkCount> pageCounts = pageCountDao.getByDate(linkType, uid,linkUrl,firstDayOfWeek,
					lastDayOfWeek, 7);
			Calendar calendar = DateUtils.getCalendarFromString(firstDayOfWeek);
			// week 有7天
			PageCount allCount = new PageCount();
			allCount.setRecordDate("总计");
			for (int i = 0; i < 7; i++, calendar.add(Calendar.DAY_OF_WEEK, 1)) {
				PageCount pc = pageCountBll.queryFromList(calendar, pageCounts);
				if (pc == null) {
					pc = new PageCount(0, 0,
							DateUtils.getWeekOfCalendar(calendar));
				} else {
					pc.setRecordDate(DateUtils.getWeekOfCalendar(calendar));
				}
				allCount.setPv(allCount.getPv() + pc.getPv());
				allCount.setUip(allCount.getUip() + pc.getUip());
				gridPcs.add(pc);
			}
			gridPcs.add(allCount);
		}
	}

	private void handleDayQuery() {
		if (!StringUtils.isNullOrEmpty(date)) {
			pageCountDao.createIfNotExist(linkType,uid,linkUrl,date);
			PageCount tpc = pageCountDao.getByDate(linkType,uid,linkUrl,date);
			gridPcs = new ArrayList<PageCount>();
			gridPcs.add(new PageCount(tpc.getPv0(), tpc.getUip0(), "0:00~3:00"));
			gridPcs.add(new PageCount(tpc.getPv1(), tpc.getUip1(), "3:00~6:00"));
			gridPcs.add(new PageCount(tpc.getPv2(), tpc.getUip2(), "6:00~9:00"));
			gridPcs.add(new PageCount(tpc.getPv3(), tpc.getUip3(), "9:00~12:00"));
			gridPcs.add(new PageCount(tpc.getPv4(), tpc.getUip4(),
					"12:00~15:00"));
			gridPcs.add(new PageCount(tpc.getPv5(), tpc.getUip5(),
					"15:00~18:00"));
			gridPcs.add(new PageCount(tpc.getPv6(), tpc.getUip6(),
					"18:00~21:00"));
			gridPcs.add(new PageCount(tpc.getPv7(), tpc.getUip7(),
					"21:00~24:00"));
			tpc.setRecordDate(tpc.getRecordDate() + "  总计");
			gridPcs.add(tpc);
		}
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public PageCountInfo getPcti() {
		return pcti;
	}

	public void setPcti(PageCountInfo pcti) {
		this.pcti = pcti;
	}

	public PageCountInfo getPcyi() {
		return pcyi;
	}

	public void setPcyi(PageCountInfo pcyi) {
		this.pcyi = pcyi;
	}

	public int getUnitType() {
		return unitType;
	}

	public void setUnitType(int unitType) {
		this.unitType = unitType;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<PageCount> getGridPcs() {
		return gridPcs;
	}

	public void setGridPcs(List<PageCount> gridPcs) {
		this.gridPcs = gridPcs;
	}

	public int getUnit() {
		return unit;
	}

	public void setUnit(int unit) {
		this.unit = unit;
	}

	public int getLinkType() {
		return linkType;
	}

	public void setLinkType(int linkType) {
		this.linkType = linkType;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getRedirectPage() {
		return redirectPage;
	}

	public void setRedirectPage(String redirectPage) {
		this.redirectPage = redirectPage;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public FatherPage getFatherPage() {
		return fatherPage;
	}

	public void setFatherPage(FatherPage fatherPage) {
		this.fatherPage = fatherPage;
	}
	
}
