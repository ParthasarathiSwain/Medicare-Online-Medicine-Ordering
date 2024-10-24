package com.otz.bean;

public class Payement {
	private int payId;
	private int customerId;
	private String pInvoiceNum ;
	private String  txn_id;
	private String order_id;
	private String txn_status;
	private String amount;
	private String payMethod;
	private String date;
	
	
	
	public int getPayId() {
		return payId;
	}



	public void setPayId(int payId) {
		this.payId = payId;
	}



	public int getCustomerId() {
		return customerId;
	}



	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}



	public String getpInvoiceNum() {
		return pInvoiceNum;
	}



	public void setpInvoiceNum(String pInvoiceNum) {
		this.pInvoiceNum = pInvoiceNum;
	}



	public String getTxn_id() {
		return txn_id;
	}



	public void setTxn_id(String txn_id) {
		this.txn_id = txn_id;
	}



	public String getOrder_id() {
		return order_id;
	}



	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}



	public String getTxn_status() {
		return txn_status;
	}



	public void setTxn_status(String txn_status) {
		this.txn_status = txn_status;
	}



	public String getAmount() {
		return amount;
	}



	public void setAmount(String amount) {
		this.amount = amount;
	}



	public String getPayMethod() {
		return payMethod;
	}



	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}



	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}



	@Override
	public String toString() {
		return "Payement [payId=" + payId + ", customerId=" + customerId + ", pInvoiceNum=" + pInvoiceNum + ", txn_id="
				+ txn_id + ", order_id=" + order_id + ", txn_status=" + txn_status + ", amount=" + amount
				+ ", payMethod=" + payMethod + ", date=" + date + "]";
	}
}
    