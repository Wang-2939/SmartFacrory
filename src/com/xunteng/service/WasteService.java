package com.xunteng.service;

import java.util.List;

import com.xunteng.pojo.PageBean;
import com.xunteng.pojo.WasteAlarm;
import com.xunteng.pojo.WasteGas;
import com.xunteng.pojo.WasteWater;

public interface WasteService {
	public WasteGas getWasteGas();

	public List<WasteWater> getWasteChart(WasteWater water);

	public List<WasteAlarm> getWasteAlarm(WasteAlarm waste);

	public PageBean<WasteAlarm> getWasteList(WasteAlarm waste, int pageNum, int pageSize);

	public List<WasteAlarm> getFanAlarm(WasteAlarm waste);

}
