package com.otz.bean;

public class OrderDetails {
 private int id;
 private String productName;
 private int fk_order_id;
 private int product_id;
 private double unit_price;
 private int qty ;
 private double total_price;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getFk_order_id() {
	return fk_order_id;
}
public String getProductName() {
	return productName;
}
public void setProductName(String productName) {
	this.productName = productName;
}
public void setFk_order_id(int fk_order_id) {
	this.fk_order_id = fk_order_id;
}
public int getProduct_id() {
	return product_id;
}
public void setProduct_id(int product_id) {
	this.product_id = product_id;
}
public double getUnit_price() {
	return unit_price;
}
public void setUnit_price(double unit_price) {
	this.unit_price = unit_price;
}
public int getQty() {
	return qty;
}
public void setQty(int qty) {
	this.qty = qty;
}
public double getTotal_price() {
	return total_price;
}
public void setTotal_price(double total_price) {
	this.total_price = total_price;
}
@Override
public String toString() {
	return "OrderDetails [id=" + id + ", fk_order_id=" + fk_order_id + ", product_id=" + product_id + ", unit_price="
			+ unit_price + ", qty=" + qty + ", total_price=" + total_price + "]";
}

}
 