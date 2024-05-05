package orishop.models;
import java.io.Serializable;
public class ImportingModels implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String productID;
	private String supplierID;
	private int quantity;
	private Float cost;
	
	public ImportingModels() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ImportingModels(String productID, String supplierID, int quantity, Float cost) {
		super();
		this.productID = productID;
		this.supplierID = supplierID;
		this.quantity = quantity;
		this.cost = cost;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getSupplierID() {
		return supplierID;
	}

	public void setSupplierID(String supplierID) {
		this.supplierID = supplierID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Float getCost() {
		return cost;
	}

	public void setCost(Float cost) {
		this.cost = cost;
	}
}
