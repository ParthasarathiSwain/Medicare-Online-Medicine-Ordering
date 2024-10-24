package com.otz.bean;

public class Customer {
	private int  cusId;
	private String cusName;
	private String cusEmail;
	private String cusPassword;
	private String newPsw;
	private String cusAddress;
	private String cusCity;
	private String cusImage ;
	private String cusPNum;
	private String cConfirmCode ;
	public int getCusId() {
		return cusId;
	}
	public void setCusId(int cusId) {
		this.cusId = cusId;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getCusEmail() {
		return cusEmail;
	}
	public void setCusEmail(String cusEmail) {
		this.cusEmail = cusEmail;
	}
	public String getCusPassword() {
		return cusPassword;
	}
	public void setCusPassword(String cusPassword) {
		this.cusPassword = cusPassword;
	}
	public String getCusAddress() {
		return cusAddress;
	}
	public void setCusAddress(String cusAddress) {
		this.cusAddress = cusAddress;
	}
	public String getCusCity() {
		return cusCity;
	}
	public void setCusCity(String cusCity) {
		this.cusCity = cusCity;
	}
	public String getCusImage() {
		return cusImage;
	}
	public void setCusImage(String cusImage) {
		this.cusImage = cusImage;
	}
	public String getCusPNum() {
		return cusPNum;
	}
	public void setCusPNum(String cusPNum) {
		this.cusPNum = cusPNum;
	}
	public String getcConfirmCode() {
		return cConfirmCode;
	}
	public void setcConfirmCode(String cConfirmCode) {
		this.cConfirmCode = cConfirmCode;
	}

	public String getNewPsw() {
		return newPsw;
	}
	public void setNewPsw(String newPsw) {
		this.newPsw = newPsw;
	}
	@Override
	public String toString() {
		return "Customer [cusId=" + cusId + ", cusName=" + cusName + ", cusEmail=" + cusEmail + ", cusPassword="
				+ cusPassword + ", cusAddress=" + cusAddress + ", cusCity=" + cusCity + ", cusImage=" + cusImage
				+ ", cusPNum=" + cusPNum + ", cConfirmCode=" + cConfirmCode + "]";
	}
	
}
