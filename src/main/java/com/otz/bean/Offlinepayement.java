package com.otz.bean;

public class Offlinepayement {
	private int  payId;
	private String branch ;
	private String  depositImage;
	private String depositDate;
	private String amount;
	public int getPayId() {
		return payId;
	}
	public void setPayId(int payId) {
		this.payId = payId;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getDepositImage() {
		return depositImage;
	}
	public void setDepositImage(String depositImage) {
		this.depositImage = depositImage;
	}
	public String getDepositDate() {
		return depositDate;
	}
	public void setDepositDate(String depositDate) {
		this.depositDate = depositDate;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Offlinepayement [payId=" + payId + ", branch=" + branch + ", depositImage=" + depositImage
				+ ", depositDate=" + depositDate + ", amount=" + amount + "]";
	}
	
}
  