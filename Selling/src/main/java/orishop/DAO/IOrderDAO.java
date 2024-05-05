package orishop.DAO;

import java.util.List;

import orishop.models.CartItemModels;
import orishop.models.OrdersItemModels;
import orishop.models.OrdersModels;

public interface IOrderDAO {
	List<OrdersModels> findAllOrders();
	void createOrder(OrdersModels model, int customerId, double totalPrice, List<CartItemModels> cartItems);
	void updateOrder(double totalPriceOrder, String deliveryMethod, String paymentStatus);
	void updateOrderPaymentStatus(int orderId, String paymentStatus) ;
	void update(OrdersModels model);
	OrdersModels findOne(int orderId);
	List<OrdersModels> findOrderByShipperId(int id);
	
	List<OrdersModels> findOrderByShipperIdAndDistributed(int id);
	
	List<OrdersModels> countOrderByShipperId(int employeeID);
	
	List<OrdersItemModels> getOrderItems(int id);
	
	List<OrdersModels> canceledOrder(int id);
	
	long totalPriceProductSell();
	
	long totalRevenueByMonth(int month);
	
	long totalRevenueByMonth(int month, int year);
	
	long totalRevenueByYear(int year);
	
	int findLatestOrderId();
}
