package com.otz.bean;

public class Slider {
	private int sliderId ;
	private String sName ;
	private String sImage ;
	private String sliderURL;
	
	//setter & getter 
	
	public int getSliderId() {
		return sliderId;
	}
	public void setSliderId(int sliderId) {
		this.sliderId = sliderId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsImage() {
		return sImage;
	}
	public void setsImage(String sImage) {
		this.sImage = sImage;
	}
	public String getSliderURL() {
		return sliderURL;
	}
	public void setSliderURL(String sliderURL) {
		this.sliderURL = sliderURL;
	}
	@Override
	public String toString() {
		return "Slider [sliderId=" + sliderId + ", sName=" + sName + ", sImage=" + sImage + ", sliderURL=" + sliderURL
				+ "]";
	}
	
	
}


