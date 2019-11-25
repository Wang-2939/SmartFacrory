package com.xunteng.service;

import java.util.List;

import com.xunteng.pojo.ElectricInfo;
import com.xunteng.pojo.GasAlarm;
import com.xunteng.pojo.PageBean;
import com.xunteng.pojo.Transformer;
import com.xunteng.pojo.WaterPressure;

public interface PowerService {
	public WaterPressure getWaterPressure();
	
	public List<WaterPressure> getWaterChart(WaterPressure water);
	
	public List<Transformer> getTransformer();
	
	public List<ElectricInfo> getElectric(ElectricInfo electric);
	
	public List<GasAlarm> getGasAlarm (GasAlarm gas);
	
	public PageBean<GasAlarm> getGasList(GasAlarm gas,int pageNum,int pageSize);
}
