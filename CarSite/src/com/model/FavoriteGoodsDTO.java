package com.model;

public class FavoriteGoodsDTO {
	private String id;
	private int goods_num;
	public FavoriteGoodsDTO(String id, int goods_num) {
		super();
		this.id = id;
		this.goods_num = goods_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
}
