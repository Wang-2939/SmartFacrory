package com.xunteng.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xunteng.pojo.ElectricInfo;
import com.xunteng.pojo.GasAlarm;
import com.xunteng.pojo.PageBean;
import com.xunteng.pojo.Transformer;
import com.xunteng.pojo.UserInfo;
import com.xunteng.pojo.WaterPressure;
import com.xunteng.service.PowerService;

@Controller
@RequestMapping("/power")
public class PowerController {
	
	@Autowired
	PowerService powerService;
	
	@RequestMapping("/toWaterPressure")
	public String toWaterPressure() {
		return "waterPressure";
	}
	
	@RequestMapping("/getWaterPressure")
	@ResponseBody
	public WaterPressure getWaterPressure() {
		return powerService.getWaterPressure();
	}
	
	@RequestMapping("/toWaterChart")
	public String toWaterChart() {
		return "waterChart";
	}
	
	@RequestMapping("/getWaterChart")
	@ResponseBody
	public List<WaterPressure> getWaterChart(WaterPressure water) {
		return powerService.getWaterChart(water);
	}
	
	@RequestMapping("/toElectric")
	public String toElectric() {
		return "electric";
	}
	
	@RequestMapping("/getTransformer")
	@ResponseBody
	public List<Transformer> getTransformer() {
		return powerService.getTransformer();
	}
	
	@RequestMapping("/getElectric")
	@ResponseBody
	public List<ElectricInfo> getElectric(ElectricInfo electric){
		return powerService.getElectric(electric);
	}
	
	@RequestMapping("/toGasAlarm")
	public String toGasAlarm() {
		return "gasAlarm";
	}
	
	@RequestMapping("/getGasAlarm")
	@ResponseBody
	public List<GasAlarm> getGasAlarm(GasAlarm gas) {
		return powerService.getGasAlarm(gas);
	}
	
	@RequestMapping("/getGasList")
	@ResponseBody
	public PageBean<GasAlarm> getGasList(GasAlarm gas, int pageNum, int pageSize){
		return powerService.getGasList(gas, pageNum, pageSize);
	}
}
