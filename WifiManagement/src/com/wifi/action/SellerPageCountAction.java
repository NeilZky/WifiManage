package com.wifi.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.wifi.bllimpl.PageCountBll;
import com.wifi.constance.UnitType;
import com.wifi.constance.UserType;
import com.wifi.daoimpl.PageCountDao;
import com.wifi.daoimpl.SellerPageCountDao;
import com.wifi.daoimpl.UserDao;
import com.wifi.entity.PageCount;
import com.wifi.entity.User;
import com.wifi.utils.DateUtils;
import com.wifi.utils.StringUtils;
import com.wifi.vo.PageCountInfo;

public class SellerPageCountAction extends BaseAction {

	private PageCountInfo pcti;
	private PageCountInfo pcyi;
	private SellerPageCountDao pageCountDao = new SellerPageCountDao();
	private int unitType = 1;
	private int unit = 1;
	private List<PageCount> gridPcs;
	private static int PAGE_COUNT_SIZE = 10;
	private int pageSize = PAGE_COUNT_SIZE;
	private String date;
	private PageCountBll pageCountBll = new PageCountBll();
	private List<User> users; 
	private UserDao userDao = new UserDao();
	private int uid;
	
	private PageCountDao adminPageCountDao = new PageCountDao();

	
	public String sellerPageCount() {

		User user = getSessionUser();
		if(user.getType() == UserType.SELLER) {
			users = null;
		} else if(user.getType() == UserType.NOMARL_ADMIN) {
			users = userDao.getSellerCreateBy(user.getId());
		} else {
			users = userDao.getAllAgents();
			List<User> sellers = userDao.getAllSellers();
			users.addAll(sellers);
		}
		if(uid==0) {
			if(user.getType() == UserType.SELLER) {
				uid = user.getId();
			} else if(user.getType() == UserType.NOMARL_ADMIN) {
				if(users !=null && !users.isEmpty()) {
					uid = users.get(0).getId();
				}
			} else {
				return pageCount();
			}
		}
		
		pcti = new PageCountInfo();
		pcyi = new PageCountInfo();
		PageCount pc = pageCountDao.getByDate(uid, DateUtils.getCurrentDate());
		if (pc != null) {
			pcti.setPv(pc.getPv());
			pcti.setUip(pc.getUip());
		}
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_YEAR, -1);
		PageCount yestodayPc = pageCountDao
				.getByDate(uid, DateUtils.getDate(c));
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

		return SUCCESS;
	}
	
	public String sellerPageCountList() {
		
		User u = getSessionUser();
		if (u.getType() == UserType.ADMIN) {
			users = userDao.getAllSellers();
			return "sellerPageCountList";
		} else if (u.getType() == UserType.NOMARL_ADMIN) {
			users = userDao.getSellerCreateBy(u.getId());
			return "sellerPageCountList";
		} else {
			// TODO 直接展示商家编辑
			return SUCCESS;
		}
		
	}
	
	private void handleMonthQuery() {

		if (!StringUtils.isNullOrEmpty(date)) {
			gridPcs = new ArrayList<PageCount>();
			String firstDayOfMonth = DateUtils.getFirstDayOfMonth(date);
			String lastDayOfMonth = DateUtils.getLastDayOfMonth(date);
			int num = DateUtils.getDayNumsOfMonth(date);
			List<PageCount> pageCounts = pageCountDao.getByDate(uid,
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
			List<PageCount> allPageCounts = pageCountDao.getByDate(uid,
					firstDate, lateDate, 366);
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

		User u = getSessionUser();
		int uid = u.getId();
		if (!StringUtils.isNullOrEmpty(date)) {
			gridPcs = new ArrayList<PageCount>();
			Calendar calendar = DateUtils.getCalendarFromString(date);
			calendar.add(Calendar.DAY_OF_YEAR, -unit);
			String firstDate = DateUtils.getDate(calendar);
			List<PageCount> pageCounts = pageCountDao.getByDate(uid, firstDate,
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
			List<PageCount> pageCounts = pageCountDao.getByDate(uid,
					firstDayOfWeek, lastDayOfWeek, 7);
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

		if (StringUtils.isNullOrEmpty(date)) {
			date = DateUtils.getCurrentDate();
		}
		pageCountDao.createIfNotExist(uid, date);
		PageCount tpc = pageCountDao.getByDate(uid, date);
		gridPcs = new ArrayList<PageCount>();
		gridPcs.add(new PageCount(tpc.getPv0(), tpc.getUip0(), "0:00~3:00"));
		gridPcs.add(new PageCount(tpc.getPv1(), tpc.getUip1(), "3:00~6:00"));
		gridPcs.add(new PageCount(tpc.getPv2(), tpc.getUip2(), "6:00~9:00"));
		gridPcs.add(new PageCount(tpc.getPv3(), tpc.getUip3(), "9:00~12:00"));
		gridPcs.add(new PageCount(tpc.getPv4(), tpc.getUip4(), "12:00~15:00"));
		gridPcs.add(new PageCount(tpc.getPv5(), tpc.getUip5(), "15:00~18:00"));
		gridPcs.add(new PageCount(tpc.getPv6(), tpc.getUip6(), "18:00~21:00"));
		gridPcs.add(new PageCount(tpc.getPv7(), tpc.getUip7(), "21:00~24:00"));
		tpc.setRecordDate(tpc.getRecordDate() + "  总计");
		gridPcs.add(tpc);
	}

	
	public String pageCount() {

		pcti = new PageCountInfo();
		pcyi = new PageCountInfo();
		PageCount pc = adminPageCountDao.getByDate(DateUtils.getCurrentDate());
		if (pc != null) {
			pcti.setPv(pc.getPv());
			pcti.setUip(pc.getUip());
		}
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_YEAR, -1);
		PageCount yestodayPc = adminPageCountDao.getByDate(DateUtils.getDate(c));
		if (yestodayPc != null) {
			pcyi.setPv(yestodayPc.getPv());
			pcyi.setUip(yestodayPc.getUip());
		}
		switch (unitType) {
		case UnitType.DAY:
			handleAdminDayQuery();
			break;
		case UnitType.WEEK:
			handleAdminWeekQuery();
			break;
		case UnitType.CUSTOM:
			handleAdminCustomQuery();
			break;
		case UnitType.MONTH:
			handleAdminMonthQuery();
			break;
		case UnitType.YEAR:
			handleAdminYearQuery();
			break;
		default:
			break;
		}

		return SUCCESS;
	}

	private void handleAdminMonthQuery() {

		if (!StringUtils.isNullOrEmpty(date)) {
			gridPcs = new ArrayList<PageCount>();
			String firstDayOfMonth = DateUtils.getFirstDayOfMonth(date);
			String lastDayOfMonth = DateUtils.getLastDayOfMonth(date);
			int num = DateUtils.getDayNumsOfMonth(date);
			List<PageCount> pageCounts = adminPageCountDao.getByDate(
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

	private void handleAdminYearQuery() {

		if (!StringUtils.isNullOrEmpty(date)) {
			gridPcs = new ArrayList<PageCount>();
			String firstDate = DateUtils.getFirstDayOfYear(date);
			String lateDate = DateUtils.getLastDayOfYear(date);
			// 一年最多366 天。limit366足够了
			List<PageCount> allPageCounts = adminPageCountDao.getByDate(firstDate,
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

	private void handleAdminCustomQuery() {

		if (!StringUtils.isNullOrEmpty(date)) {
			gridPcs = new ArrayList<PageCount>();
			Calendar calendar = DateUtils.getCalendarFromString(date);
			calendar.add(Calendar.DAY_OF_YEAR, -unit);
			String firstDate = DateUtils.getDate(calendar);
			List<PageCount> pageCounts = adminPageCountDao.getByDate(firstDate,
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

	private void handleAdminWeekQuery() {

		if (!StringUtils.isNullOrEmpty(date)) {
			gridPcs = new ArrayList<PageCount>();
			String firstDayOfWeek = DateUtils.getFirstDayOfWeek(date);
			String lastDayOfWeek = DateUtils.getLastDayOfWeek(date);
			List<PageCount> pageCounts = adminPageCountDao.getByDate(firstDayOfWeek,
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

	private void handleAdminDayQuery() {
		if (StringUtils.isNullOrEmpty(date)) {
			date = DateUtils.getCurrentDate();
		}
		adminPageCountDao.createIfNotExist(date);
		PageCount tpc = adminPageCountDao.getByDate(date);
		gridPcs = new ArrayList<PageCount>();
		gridPcs.add(new PageCount(tpc.getPv0(), tpc.getUip0(), "0:00~3:00"));
		gridPcs.add(new PageCount(tpc.getPv1(), tpc.getUip1(), "3:00~6:00"));
		gridPcs.add(new PageCount(tpc.getPv2(), tpc.getUip2(), "6:00~9:00"));
		gridPcs.add(new PageCount(tpc.getPv3(), tpc.getUip3(), "9:00~12:00"));
		gridPcs.add(new PageCount(tpc.getPv4(), tpc.getUip4(), "12:00~15:00"));
		gridPcs.add(new PageCount(tpc.getPv5(), tpc.getUip5(), "15:00~18:00"));
		gridPcs.add(new PageCount(tpc.getPv6(), tpc.getUip6(), "18:00~21:00"));
		gridPcs.add(new PageCount(tpc.getPv7(), tpc.getUip7(), "21:00~24:00"));
		tpc.setRecordDate(tpc.getRecordDate() + "  总计");
		gridPcs.add(tpc);
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

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
	

}
