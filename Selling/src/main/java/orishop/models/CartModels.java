package orishop.models;
import java.io.Serializable;

public class CartModels implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int cartId;
	private int customerId;
	private Float totalPrice;
	CustomerModels customer;
	
	public CartModels() {
		super();
	}
	
	public CartModels(int cartId, int customerId, Float totalPrice, CustomerModels customer) {
		super();
		this.cartId = cartId;
		this.customerId = customerId;
		this.totalPrice = totalPrice;
		this.customer = customer;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public Float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public CustomerModels getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerModels customer) {
		this.customer = customer;
	}
}