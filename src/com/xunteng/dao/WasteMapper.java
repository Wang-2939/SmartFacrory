package com.xunteng.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.xunteng.pojo.WasteAlarm;
import com.xunteng.pojo.WasteGas;
import com.xunteng.pojo.WasteWater;

public interface WasteMapper {
	public WasteGas getWasteGas();

	public List<WasteWater> getWasteChart(WasteWater water);

	public List<WasteAlarm> getWasteAlarm(WasteAlarm waste);

	public List<WasteAlarm> getWasteList(WasteAlarm waste, RowBounds row);

	public int getWasteCount(WasteAlarm waste);

	public List<WasteAlarm> getFanAlarm(WasteAlarm waste);
}
