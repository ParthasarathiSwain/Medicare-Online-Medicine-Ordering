package com.otz.bean;

public class Manufacturer {
	private int  manufactureId;
	private String manName;
	private String manImage;
	public int getManufactureId() {
		return manufactureId;
	}
	public void setManufactureId(int manufactureId) {
		this.manufactureId = manufactureId;
	}
	public String getManName() {
		return manName;
	}
	public void setManName(String manName) {
		this.manName = manName;
	}
	public String getManImage() {
		return manImage;
	}
	public void setManImage(String manImage) {
		this.manImage = manImage;
	}
	@Override
	public String toString() {
		return "ManufactureId [manufactureId=" + manufactureId + ", manName=" + manName + ", manImage=" + manImage
				+ "]";
	}
	
	
}
