package com.xunteng.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xunteng.pojo.PageBean;
import com.xunteng.pojo.WasteAlarm;
import com.xunteng.pojo.WasteGas;
import com.xunteng.pojo.WasteWater;
import com.xunteng.service.WasteService;


@Controller
@RequestMapping("/waste")
public class WasteController {
	
	@Autowired
	WasteService wasteService;
	@RequestMapping("/toWasteGas")
	public String toWasteGas(){
		return "wasteGas";
	}
	
	@RequestMapping("/getWasteGas")
	@ResponseBody
	public WasteGas getWasteGas(){
		return wasteService.getWasteGas();
	}
	
	@RequestMapping("/toWasteChart")
	public String toWasteChart(){
		return "wasteChart";
	}
	
	@RequestMapping("/getWasteChart")
	@ResponseBody
	public List<WasteWater> getWasteChart(WasteWater water){
		return wasteService.getWasteChart(water);
	}
	
	@RequestMapping("/toWasteAlarm")
	public String toWasteAlarm() {
		return "wasteAlarm";
	}
	
	@RequestMapping("/getWasteAlarm")
	@ResponseBody
	public List<WasteAlarm> getWasteAlarm(WasteAlarm waste) {
		return wasteService.getWasteAlarm(waste);
	}
	
	@RequestMapping("/getWasteList")
	@ResponseBody
	public PageBean<WasteAlarm> getWasteList(WasteAlarm waste, int pageNum, int pageSize){
		return wasteService.getWasteList(waste, pageNum, pageSize);
	}
	
	@RequestMapping("/toFanAlarm")
	public String toFanAlarm() {
		return "fanAlarm";
	}
	
	@RequestMapping("/getFanAlarm")
	@ResponseBody
	public List<WasteAlarm> getFanAlarm(WasteAlarm waste) {
		return wasteService.getFanAlarm(waste);
	}
}

