package com.xunteng.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class WaterPressure {
	
	
	
	private int waterPressureId;
	@DateTimeFormat(pattern="yyyy-MM-dd")//将数据从页面存入后台时使用
	@JsonFormat(pattern="HH:mm",timezone="GMT+8")//将后台的数据转为json时使用
	private Date insertTime;
	private float waterPressure1;
	private float waterPressure2;
	private float waterPressure3;
	private float waterPressure4;
	private float waterPressure5;
	private float waterPressure6;
	public int getWaterPressureId() {
		return waterPressureId;
	}
	public void setWaterPressureId(int waterPressureId) {
		this.waterPressureId = waterPressureId;
	}
	public Date getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	public float getWaterPressure1() {
		return waterPressure1;
	}
	public void setWaterPressure1(float waterPressure1) {
		this.waterPressure1 = waterPressure1;
	}
	public float getWaterPressure2() {
		return waterPressure2;
	}
	public void setWaterPressure2(float waterPressure2) {
		this.waterPressure2 = waterPressure2;
	}
	public float getWaterPressure3() {
		return waterPressure3;
	}
	public void setWaterPressure3(float waterPressure3) {
		this.waterPressure3 = waterPressure3;
	}
	public float getWaterPressure4() {
		return waterPressure4;
	}
	public void setWaterPressure4(float waterPressure4) {
		this.waterPressure4 = waterPressure4;
	}
	public float getWaterPressure5() {
		return waterPressure5;
	}
	public void setWaterPressure5(float waterPressure5) {
		this.waterPressure5 = waterPressure5;
	}
	public float getWaterPressure6() {
		return waterPressure6;
	}
	public void setWaterPressure6(float waterPressure6) {
		this.waterPressure6 = waterPressure6;
	}
}
