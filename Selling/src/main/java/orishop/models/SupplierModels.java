package orishop.models;
import java.io.Serializable;
public class SupplierModels implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String supplierID;
	private String supplierName;
	public SupplierModels() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SupplierModels(String supplierID, String supplierName) {
		super();
		this.supplierID = supplierID;
		this.supplierName = supplierName;
	}
	public String getSupplierID() {
		return supplierID;
	}
	public void setSupplierID(String supplierID) {
		this.supplierID = supplierID;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
}
