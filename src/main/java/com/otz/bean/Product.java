package com.otz.bean;

public class Product {
	private int productId ;
	private String productDate ;
	private String productName;
	private String customUrl;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String  productPrice;
	private String productDetails;
	private int manufactureId ;
	private int categoryId ;
	private String productKeywords;
	private String features;
	private String availability;
	private int  discount ;
	
	
	private int product_stock ;
	private String product_expire_date;
	private String diseaseCategory;
	private String manName;
	private String catName;
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductDate() {
		return productDate;
	}
	public void setProductDate(String productDate) {
		this.productDate = productDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCustomUrl() {
		return customUrl;
	}
	public void setCustomUrl(String customUrl) {
		this.customUrl = customUrl;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getImage4() {
		return image4;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductDetails() {
		return productDetails;
	}
	public void setProductDetails(String productDetails) {
		this.productDetails = productDetails;
	}
	public int getManufactureId() {
		return manufactureId;
	}
	public void setManufactureId(int manufactureId) {
		this.manufactureId = manufactureId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getProductKeywords() {
		return productKeywords;
	}
	public void setProductKeywords(String productKeywords) {
		this.productKeywords = productKeywords;
	}
	public String getFeatures() {
		return features;
	}
	public void setFeatures(String features) {
		this.features = features;
	}
	public String getAvailability() {
		return availability;
	}
	public void setAvailability(String availability) {
		this.availability = availability;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public String getProduct_expire_date() {
		return product_expire_date;
	}
	public void setProduct_expire_date(String product_expire_date) {
		this.product_expire_date = product_expire_date;
	}
	public String getDiseaseCategory() {
		return diseaseCategory;
	}
	public void setDiseaseCategory(String diseaseCategory) {
		this.diseaseCategory = diseaseCategory;
	}
	
	public String getManName() {
		return manName;
	}
	public void setManName(String manName) {
		this.manName = manName;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productDate=" + productDate + ", productName=" + productName
				+ ", customUrl=" + customUrl + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3
				+ ", image4=" + image4 + ", productPrice=" + productPrice + ", productDetails=" + productDetails
				+ ", manufactureId=" + manufactureId + ", categoryId=" + categoryId + ", productKeywords="
				+ productKeywords + ", features=" + features + ", availability=" + availability + ", discount="
				+ discount + ", product_stock=" + product_stock
				+ ", product_expire_date=" + product_expire_date + ", diseaseCategory=" + diseaseCategory + ", manName="
				+ manName + ", catName=" + catName + "]";
	}
	
}
