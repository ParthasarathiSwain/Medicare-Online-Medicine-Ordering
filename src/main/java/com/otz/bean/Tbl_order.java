package com.otz.bean;

public class Tbl_order {
	private int id ;
	private String order_id ;
	private int cust_id ;
	private String order_date  ;
	private int order_status ;
	private double order_amount ;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getCust_id() {
		return cust_id;
	}
	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	public double getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(double order_amount) {
		this.order_amount = order_amount;
	}
	@Override
	public String toString() {
		return "Tbl_order [id=" + id + ", order_id=" + order_id + ", cust_id=" + cust_id + ", order_date=" + order_date
				+ ", order_status=" + order_status + ", order_amount=" + order_amount + "]";
	}
	
}
