package com.xunteng.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xunteng.dao.WasteMapper;
import com.xunteng.pojo.PageBean;
import com.xunteng.pojo.WasteAlarm;
import com.xunteng.pojo.WasteGas;
import com.xunteng.pojo.WasteWater;

@Service
public class WasteServiceImpl implements WasteService{

	@Autowired
	WasteMapper wasteMapper;
	
	@Override
	public WasteGas getWasteGas() {
		// TODO �Զ����ɵķ������
		return wasteMapper.getWasteGas();
	}

	@Override
	public List<WasteWater> getWasteChart(WasteWater water) {
		// TODO �Զ����ɵķ������
		return wasteMapper.getWasteChart(water);
	}

	@Override
	public List<WasteAlarm> getWasteAlarm(WasteAlarm waste) {
		// TODO �Զ����ɵķ������
		return wasteMapper.getWasteAlarm(waste);
	}

	
	@Override
	public PageBean<WasteAlarm> getWasteList(WasteAlarm waste, int pageNum, int pageSize) {
		// TODO �Զ����ɵķ������
		int total =wasteMapper.getWasteCount(waste);
		
		int totalPage = (int)Math.ceil((float)total/(float)pageSize);
		RowBounds row = new RowBounds((pageNum-1)*pageSize,pageSize);
		List<WasteAlarm> list = wasteMapper.getWasteList(waste, row);
		PageBean<WasteAlarm> pageBean = new PageBean<WasteAlarm>();
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);;
		return pageBean;
		
	}

	@Override
	public List<WasteAlarm> getFanAlarm(WasteAlarm waste) {
		// TODO �Զ����ɵķ������
		return wasteMapper.getFanAlarm(waste);
	}

	
}
