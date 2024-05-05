package orishop.models;

import java.sql.Date;

public class RatingModels {

	private int ratingId;
    private int productId;
    private int customerId;
    private int rating;
    private String review;
    private Date reviewDate;
    // Constructors, getters, and setters
    // Constructor without parameters
    
    private CustomerModels customer;
    private ProductModels product;
    
    public RatingModels() {
    }


    // Getters and setters for all attributes
    public int getRatingId() {
        return ratingId;
    }

    public RatingModels(int ratingId, int productId, int customerId, int rating, String review, Date reviewDate,
			CustomerModels customer, ProductModels product) {
		super();
		this.ratingId = ratingId;
		this.productId = productId;
		this.customerId = customerId;
		this.rating = rating;
		this.review = review;
		this.reviewDate = reviewDate;
		this.customer = customer;
		this.product = product;
	}

	public void setRatingId(int ratingId) {
        this.ratingId = ratingId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }


	public CustomerModels getCustomer() {
		return customer;
	}


	public void setCustomer(CustomerModels customer) {
		this.customer = customer;
	}


	public ProductModels getProduct() {
		return product;
	}


	public void setProduct(ProductModels product) {
		this.product = product;
	}
    
    
}
