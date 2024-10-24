package com.otz.bean;

public class Orders {
	private int orderId;
	private int cusId;
	private int productId;
	private String orderAmount ;
	private String  invoiceNumber;
	private int qty;
	private String colour;
	private String warranty;
	private String date;
	private String status;
	private String cusName;
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getCusId() {
		return cusId;
	}
	public void setCusId(int cusId) {
		this.cusId = cusId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}
	public String getInvoiceNumber() {
		return invoiceNumber;
	}
	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getColour() {
		return colour;
	}
	public void setColour(String colour) {
		this.colour = colour;
	}
	public String getWarranty() {
		return warranty;
	}
	public void setWarranty(String warranty) {
		this.warranty = warranty;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", cusId=" + cusId + ", productId=" + productId + ", orderAmount="
				+ orderAmount + ", invoiceNumber=" + invoiceNumber + ", qty=" + qty + ", colour=" + colour
				+ ", warranty=" + warranty + ", date=" + date + ", status=" + status + ", cusName=" + cusName + "]";
	}
	
	
}
  