package com.xunteng.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xunteng.dao.PowerMapper;
import com.xunteng.pojo.ElectricInfo;
import com.xunteng.pojo.GasAlarm;
import com.xunteng.pojo.PageBean;
import com.xunteng.pojo.Transformer;
import com.xunteng.pojo.WaterPressure;

@Service
public class PowerServiceImpl implements PowerService{

	@Autowired
	PowerMapper powerMapper;
	@Override
	public WaterPressure getWaterPressure() {
		// TODO 自动生成的方法存根
		return powerMapper.getWaterPressure();
	}
	
	@Override
	public List<WaterPressure> getWaterChart(WaterPressure water) {
		// TODO 自动生成的方法存根
		return powerMapper.getWaterChart(water);
	}

	@Override
	public List<Transformer> getTransformer() {
		// TODO 自动生成的方法存根
		return powerMapper.getTransformer();
	}

	@Override
	public List<ElectricInfo> getElectric(ElectricInfo electric) {
		// TODO 自动生成的方法存根
		return powerMapper.getElectric(electric);
	}

	@Override
	public List<GasAlarm> getGasAlarm(GasAlarm gas) {
		// TODO 自动生成的方法存根
		return powerMapper.getGasAlarm(gas);
	}

	@Override
	public PageBean<GasAlarm> getGasList(GasAlarm gas, int pageNum, int pageSize) {
		// TODO 自动生成的方法存根
		int total =powerMapper.getGasCount(gas);
		
		int totalPage = (int)Math.ceil((float)total/(float)pageSize);
		RowBounds row = new RowBounds((pageNum-1)*pageSize,pageSize);
		List<GasAlarm> list = powerMapper.getGasList(gas, row);
		PageBean<GasAlarm> pageBean = new PageBean<GasAlarm>();
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		return pageBean;
		
	}
	
}
