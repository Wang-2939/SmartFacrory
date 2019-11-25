package com.xunteng.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ElectricInfo {
	private int electricId;
	private int transformerId;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")//将数据从页面存入后台时使用
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")//将后台的数据转为json时使用
	private Date insertTime;
	private float value1;
	private float value2;
	private float value3;
	private float value4;
	
	private String transformerName;
	public String getTransformerName() {
		return transformerName;
	}
	public void setTransformerName(String transformerName) {
		this.transformerName = transformerName;
	}
	public int getElectricId() {
		return electricId;
	}
	public void setElectricId(int electricId) {
		this.electricId = electricId;
	}
	public int getTransformerId() {
		return transformerId;
	}
	public void setTransformerId(int transformerId) {
		this.transformerId = transformerId;
	}
	public Date getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	public float getValue1() {
		return value1;
	}
	public void setValue1(float value1) {
		this.value1 = value1;
	}
	public float getValue2() {
		return value2;
	}
	public void setValue2(float value2) {
		this.value2 = value2;
	}
	public float getValue3() {
		return value3;
	}
	public void setValue3(float value3) {
		this.value3 = value3;
	}
	public float getValue4() {
		return value4;
	}
	public void setValue4(float value4) {
		this.value4 = value4;
	}
}
