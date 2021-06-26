package com.model;

public class GoodsInfoDTO {
	
	private String goods_num;
	private String id;
	private String car_id;
	private String smartkey;
	private String sunroof;
	private String navi;
	private String insurance;
	
	public GoodsInfoDTO(String goods_num, String id, String car_id, String smartkey, String sunroof, String navi,
			String insurance) {
		super();
		this.goods_num = goods_num;
		this.id = id;
		this.car_id = car_id;
		this.smartkey = smartkey;
		this.sunroof = sunroof;
		this.navi = navi;
		this.insurance = insurance;
	}
	

	public GoodsInfoDTO(String id, String car_id, String smartkey, String sunroof, String navi, String insurance) {
		super();
		this.id = id;
		this.car_id = car_id;
		this.smartkey = smartkey;
		this.sunroof = sunroof;
		this.navi = navi;
		this.insurance = insurance;
	}

	public String getGoods_num() {
		return goods_num;
	}

	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCar_id() {
		return car_id;
	}

	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}

	public String getSmartkey() {
		return smartkey;
	}

	public void setSmartkey(String smartkey) {
		this.smartkey = smartkey;
	}

	public String getSunroof() {
		return sunroof;
	}

	public void setSumroof(String sumroof) {
		this.sunroof = sunroof;
	}

	public String getNavi() {
		return navi;
	}

	public void setNavi(String navi) {
		this.navi = navi;
	}

	public String getInsurance() {
		return insurance;
	}

	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	
	
	
	
	
	
}
