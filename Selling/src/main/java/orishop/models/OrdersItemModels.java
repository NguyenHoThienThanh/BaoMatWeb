package orishop.models;

import java.io.Serializable;
import java.util.Date;

public class OrdersItemModels implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int productId;
	private int orderId;
	private int quantity;
	private float totalPrice;
	
	private ProductModels product;
	
	public OrdersItemModels() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrdersItemModels(int productId, int orderId, int quantity, float totalPrice, ProductModels product) {
		super();
		this.productId = productId;
		this.orderId = orderId;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.product = product;
	}

	// Getters and setters for each attribute

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public ProductModels getProduct() {
		return product;
	}

	public void setProduct(ProductModels product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "OrderDetails{" + "productId=" + productId + ", orderId=" + orderId + ", quantity=" + quantity
				+ ", totalPrice=" + totalPrice + '}';
	}
}