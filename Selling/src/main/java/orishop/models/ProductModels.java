package orishop.models;
import java.io.Serializable;
import java.util.List;
public class ProductModels implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int productId;
	private String productName;
	private String description;
	private int stock;
	private int amount;
	private float price;
	private int categoryId;
	private String imageURL;
	
	private CategoryModels category;
	private List<RatingModels> listRating;
	
	public ProductModels() {
		super();
	}

	

	public ProductModels(int productId, String productName, String description, int stock, int amount, float price,
			int categoryId, String imageURL, CategoryModels category, List<RatingModels> listRating) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.description = description;
		this.stock = stock;
		this.amount = amount;
		this.price = price;
		this.categoryId = categoryId;
		this.imageURL = imageURL;
		this.category = category;
		this.listRating = listRating;
	}



	public ProductModels(int productId, String productName, String description, int stock, int amount, float price,
			int categoryId, String imageURL, CategoryModels category) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.description = description;
		this.stock = stock;
		this.amount = amount;
		this.price = price;
		this.categoryId = categoryId;
		this.imageURL = imageURL;
		this.category = category;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public CategoryModels getCategory() {
		return category;
	}

	public void setCategory(CategoryModels category) {
		this.category = category;
	}



	public List<RatingModels> getListRating() {
		return listRating;
	}



	public void setListRating(List<RatingModels> listRating) {
		this.listRating = listRating;
	}
	
	

	
	
	
}