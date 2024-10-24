package com.otz.bean;

public class Coupon {
	private int  couponId;
	private int productId;
	private String couponTitle;
	private String couponPrice;
	private String couponCode;
	private String limite;
	private String uses;
	public int getCouponId() {
		return couponId;
	}
	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getCouponTitle() {
		return couponTitle;
	}
	public void setCouponTitle(String couponTitle) {
		this.couponTitle = couponTitle;
	}
	public String getCouponPrice() {
		return couponPrice;
	}
	public void setCouponPrice(String couponPrice) {
		this.couponPrice = couponPrice;
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public String getLimite() {
		return limite;
	}
	public void setLimite(String limite) {
		this.limite = limite;
	}
	public String getUses() {
		return uses;
	}
	public void setUses(String uses) {
		this.uses = uses;
	}
	
	
	@Override
	public String toString() {
		return "Coupon [couponId=" + couponId + ", productId=" + productId + ", couponTitle=" + couponTitle
				+ ", couponPrice=" + couponPrice + ", couponCode=" + couponCode + ", limite=" + limite + ", uses="
				+ uses + "]";
	}

	
	
}
    