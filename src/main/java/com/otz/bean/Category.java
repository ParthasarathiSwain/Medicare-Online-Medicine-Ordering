package com.otz.bean;

public class Category {
	private int  categoryId;
	private String catName;
	private String catImage;
	
	//Setter & Getter 
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public String getCatImage() {
		return catImage;
	}
	public void setCatImage(String catImage) {
		this.catImage = catImage;
	}
	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", catName=" + catName + ", catImage=" + catImage + "]";
	}
	
}
