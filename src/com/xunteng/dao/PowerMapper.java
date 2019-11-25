package com.xunteng.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.xunteng.pojo.ElectricInfo;
import com.xunteng.pojo.GasAlarm;
import com.xunteng.pojo.Transformer;
import com.xunteng.pojo.WaterPressure;

public interface PowerMapper {
	public WaterPressure getWaterPressure();
	
	public List<WaterPressure> getWaterChart(WaterPressure water);
	
	public List<Transformer> getTransformer();
	
	public List<ElectricInfo> getElectric(ElectricInfo electric);
	
	public List<GasAlarm> getGasAlarm (GasAlarm gas);
	
	public List<GasAlarm> getGasList(GasAlarm gas, RowBounds row);

	public int getGasCount(GasAlarm gas);
	
}
