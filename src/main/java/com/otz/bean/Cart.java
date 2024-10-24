package com.otz.bean;

public class Cart {
	private int cartId;
	private int productId;
	private  String productName;
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	private double cartPrice;
	private int cartQty;
	private double cartAmount;
	private String cartColour;
	private String cartWarranty;
	private int cusId;
	
	//Setter & Getter 
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public double getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(double cartPrice) {
		this.cartPrice = cartPrice;
	}
	public int getCartQty() {
		return cartQty;
	}
	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}
	public double getCartAmount() {
		return cartAmount;
	}
	public void setCartAmount(double cartAmount) {
		this.cartAmount = cartAmount;
	}
	public String getCartColour() {
		return cartColour;
	}
	public void setCartColour(String cartColour) {
		this.cartColour = cartColour;
	}
	public String getCartWarranty() {
		return cartWarranty;
	}
	public void setCartWarranty(String cartWarranty) {
		this.cartWarranty = cartWarranty;
	}
	public int getCusId() {
		return cusId;
	}
	public void setCusId(int cusId) {
		this.cusId = cusId;
	}
	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", productId=" + productId + ", cartPrice=" + cartPrice + ", cartQty="
				+ cartQty + ", cartAmount=" + cartAmount + ", cartColour=" + cartColour + ", cartWarranty="
				+ cartWarranty + ", cusId=" + cusId + "]";
	}
	
	
	

	
	
	
	
}
