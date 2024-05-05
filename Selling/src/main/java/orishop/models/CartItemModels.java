package orishop.models;
import java.io.Serializable;
public class CartItemModels implements Serializable{
	private static final long serialVersionUID = 1L;
	private int cartID;
	private int productID;
	private int quantity;
	private Float totalPrice;
	ProductModels product;
	
	private int count;
	
	public CartItemModels() {
		super();
	}
	public CartItemModels(int cartID, int count) {
		super();
		this.cartID = cartID;
		this.count = count;
	}
	

	
	public CartItemModels(int cartID, int productID, int quantity, Float totalPrice) {
		super();
		this.cartID = cartID;
		this.productID = productID;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}
	public CartItemModels(int cartID, int productID, int quantity, Float totalPrice, ProductModels product) {
		super();
		this.cartID = cartID;
		this.productID = productID;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.product = product;
	}
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCartID() {
		return cartID;
	}
	public void setCartID(int cartID) {
		this.cartID = cartID;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public ProductModels getProduct() {
		return product;
	}
	public void setProduct(ProductModels product) {
		this.product = product;
	}
}