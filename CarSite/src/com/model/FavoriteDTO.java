package com.model;

public class FavoriteDTO {
	private String id;
	private String car_num;
	
	public FavoriteDTO(String id, String car_num) {
		super();
		this.id = id;
		this.car_num = car_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCar_num() {
		return car_num;
	}

	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	
	
}
