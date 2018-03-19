package com.example.spring.attendance.entity;

public class WeekRoster {
	String startFirstDay;
	String startLastDay;
	String endFirstDay;
	String endLastDay;
	
	public String getStartFirstDay() {
		return startFirstDay;
	}
	public void setStartFirstDay(String startFirstDay) {
		this.startFirstDay = startFirstDay;
	}
	public String getStartLastDay() {
		return startLastDay;
	}
	public void setStartLastDay(String startLastDay) {
		this.startLastDay = startLastDay;
	}
	public String getEndFirstDay() {
		return endFirstDay;
	}
	public void setEndFirstDay(String endFirstDay) {
		this.endFirstDay = endFirstDay;
	}
	public String getEndLastDay() {
		return endLastDay;
	}
	public void setEndLastDay(String endLastDay) {
		this.endLastDay = endLastDay;
	}
}
