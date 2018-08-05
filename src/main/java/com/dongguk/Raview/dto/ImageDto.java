package com.dongguk.Raview.dto;

public class ImageDto {
	private String key;
	private String time;
	private int countCar;
	private String base64;
	public ImageDto(){}
	public ImageDto(String key, String time, int countCar, String base64) {
		super();
		this.key = key;
		this.time = time;
		this.countCar = countCar;
		this.base64 = base64;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getCountCar() {
		return countCar;
	}
	public void setCountCar(int countCar) {
		this.countCar = countCar;
	}
	public String getBase64() {
		return base64;
	}
	public void setBase64(String base64) {
		this.base64 = base64;
	}
}
