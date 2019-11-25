package com.xunteng.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
public class WasteAlarm {
	private int wasteAlarmId;
	@DateTimeFormat(pattern="yyyy-MM-dd")//将数据从页面存入后台时使用
	@JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone="GMT+8")//将后台的数据转为json时使用
	private Date insertTime;
	private String alarmName;
	private String alarmType;
	private float alarmValue;
	private float limitValue;
	private int alarmCount;
	public int getAlarmCount() {
		return alarmCount;
	}
	public void setAlarmCount(int alarmCount) {
		this.alarmCount = alarmCount;
	}
	
	public int getWasteAlarmId() {
		return wasteAlarmId;
	}
	public void setWasteAlarmId(int wasteAlarmId) {
		this.wasteAlarmId = wasteAlarmId;
	}
	public Date getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	public String getAlarmName() {
		return alarmName;
	}
	public void setAlarmName(String alarmName) {
		this.alarmName = alarmName;
	}
	public String getAlarmType() {
		return alarmType;
	}
	public void setAlarmType(String alarmType) {
		this.alarmType = alarmType;
	}
	public float getAlarmValue() {
		return alarmValue;
	}
	public void setAlarmValue(float alarmValue) {
		this.alarmValue = alarmValue;
	}
	public float getLimitValue() {
		return limitValue;
	}
	public void setLimitValue(float limitValue) {
		this.limitValue = limitValue;
	}
}
