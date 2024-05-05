package orishop.models;

import java.io.Serializable;
public class CategoryModels implements Serializable{
	private static final long serialVersionUID = 1L;

	private int categoryId;
	private String categoryName;
	private String imageURL;
	

	public CategoryModels() {
		super();
	}


	public CategoryModels(int categoryId, String categoryName, String imageURL) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.imageURL = imageURL;
	}


	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public String getImageURL() {
		return imageURL;
	}


	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	
	
}
