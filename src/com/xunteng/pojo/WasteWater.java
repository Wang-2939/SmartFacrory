package com.xunteng.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class WasteWater {
	private int wasteWaterId;
	@DateTimeFormat(pattern="yyyy-MM-dd")//将数据从页面存入后台时使用
	@JsonFormat(pattern="HH:mm",timezone="GMT+8")//将后台的数据转为json时使用
	private Date insertTime;
	private float backWaterPH;
	private float waterPH;
	private float backWaterTemperature;
	private float waterTemperature;
	private float fanFrequency;
	private float acValue;
	private float voltage;
	public int getWasteWaterId() {
		return wasteWaterId;
	}
	public void setWasteWaterId(int wasteWaterId) {
		this.wasteWaterId = wasteWaterId;
	}
	public Date getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	public float getBackWaterPH() {
		return backWaterPH;
	}
	public void setBackWaterPH(float backWaterPH) {
		this.backWaterPH = backWaterPH;
	}
	public float getWaterPH() {
		return waterPH;
	}
	public void setWaterPH(float waterPH) {
		this.waterPH = waterPH;
	}
	public float getBackWaterTemperature() {
		return backWaterTemperature;
	}
	public void setBackWaterTemperature(float backWaterTemperature) {
		this.backWaterTemperature = backWaterTemperature;
	}
	public float getWaterTemperature() {
		return waterTemperature;
	}
	public void setWaterTemperature(float waterTemperature) {
		this.waterTemperature = waterTemperature;
	}
	public float getFanFrequency() {
		return fanFrequency;
	}
	public void setFanFrequency(float fanFrequency) {
		this.fanFrequency = fanFrequency;
	}
	public float getAcValue() {
		return acValue;
	}
	public void setAcValue(float acValue) {
		this.acValue = acValue;
	}
	public float getVoltage() {
		return voltage;
	}
	public void setVoltage(float voltage) {
		this.voltage = voltage;
	}
}
