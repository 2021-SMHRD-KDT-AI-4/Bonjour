package com.model;

public class JoinDTO {
	private String car_num;
	private String brand;
	private String model;
	private String d_model;
	private String grade;
	private String goods_num;
	private String year;
	private String km;
	private String price;
	private String fuel;
	private String site;
	private String url;
	
	
	public JoinDTO(String car_num, String brand, String model, String d_model, String grade, String goods_num,
			String year, String km, String price, String fuel, String site, String url) {
		super();
		this.car_num = car_num;
		this.brand = brand;
		this.model = model;
		this.d_model = d_model;
		this.grade = grade;
		this.goods_num = goods_num;
		this.year = year;
		this.km = km;
		this.price = price;
		this.fuel = fuel;
		this.site = site;
		this.url = url;
	}
	
	public String getGoods_num() {
		return goods_num;
	}

	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}

	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getD_model() {
		return d_model;
	}
	public void setD_model(String d_model) {
		this.d_model = d_model;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
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
