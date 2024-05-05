package orishop.models;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class OrdersModels implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int orderID;
	private Float orderValue;
	private Date orderDate;
	private int cartID;
	private int customerID;
	private String paymentStatus;
	private String orderStatus;
	private String paymentMethod;
	private String deliveryMethod;
	private int employeeId;
	private int countOrderByShipperId;
	
	private CustomerModels customer;
	private CartModels cart;
	private EmployeeModels shipper;
	private List<OrdersItemModels> orderItems;

	public OrdersModels() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrdersModels(int employeeId, int countOrderByShipperId) {
		super();
		this.employeeId = employeeId;
		this.countOrderByShipperId = countOrderByShipperId;
	}
	
	public OrdersModels(int orderID, Float orderValue, Date orderDate, int cartID, int customerID, String paymentStatus,
			String orderStatus, String paymentMethod, String deliveryMethod, int employeeId, int countOrderByShipperId,
			CustomerModels customer, CartModels cart, EmployeeModels shipper, List<OrdersItemModels> orderItems) {
		super();
		this.orderID = orderID;
		this.orderValue = orderValue;
		this.orderDate = orderDate;
		this.cartID = cartID;
		this.customerID = customerID;
		this.paymentStatus = paymentStatus;
		this.orderStatus = orderStatus;
		this.paymentMethod = paymentMethod;
		this.deliveryMethod = deliveryMethod;
		this.employeeId = employeeId;
		this.countOrderByShipperId = countOrderByShipperId;
		this.customer = customer;
		this.cart = cart;
		this.shipper = shipper;
		this.orderItems = orderItems;
	}
	public int getCountOrderByShipperId() {
		return countOrderByShipperId;
	}
	public void setCountOrderByShipperId(int countOrderByShipperId) {
		this.countOrderByShipperId = countOrderByShipperId;
	}
	
	
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public Float getOrderValue() {
		return orderValue;
	}
	public void setOrderValue(Float orderValue) {
		this.orderValue = orderValue;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getCartID() {
		return cartID;
	}
	public void setCartID(int cartID) {
		this.cartID = cartID;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public CartModels getCart() {
		return cart;
	}
	public void setCart(CartModels cart) {
		this.cart = cart;
	}
	public CustomerModels getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerModels customer) {
		this.customer = customer;
	}
	public EmployeeModels getShipper() {
		return shipper;
	}
	public void setShipper(EmployeeModels shipper) {
		this.shipper = shipper;
	}
	public List<OrdersItemModels> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrdersItemModels> orderItems) {
		this.orderItems = orderItems;
	}
}