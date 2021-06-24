package com.model;

public class GoodsDTO {
	private String good_num;
	private String car_num;
	private String year;
	private String km;
	private String price;
	private String fuel;
	private String site;
	private String url;
	public GoodsDTO(String good_num, String car_num, String year, String km, String price, String fuel, String site,
			String url) {
		super();
		this.good_num = good_num;
		this.car_num = car_num;
		this.year = year;
		this.km = km;
		this.price = price;
		this.fuel = fuel;
		this.site = site;
		this.url = url;
	}
	public String getGood_num() {
		return good_num;
	}
	public void setGood_num(String good_num) {
		this.good_num = good_num;
	}
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getKm() {
		return km;
	}
	public void setKm(String km) {
		this.km = km;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
