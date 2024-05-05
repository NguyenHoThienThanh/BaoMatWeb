package orishop.services;

import java.util.ArrayList;
import java.util.List;

import orishop.DAO.IOrderDAO;
import orishop.DAO.OrderDAOImpl;
import orishop.models.CartItemModels;
import orishop.models.OrdersItemModels;
import orishop.models.OrdersModels;

public class OrderServiceImpl implements IOrderService {
	IOrderDAO orderDAO = new OrderDAOImpl();

	@Override
	public List<OrdersModels> findAllOrders() {

		return orderDAO.findAllOrders();
	}

	@Override
	public void createOrder(OrdersModels model, int customerId, double totalPrice, List<CartItemModels> cartItems) {

		orderDAO.createOrder(model, customerId, totalPrice, cartItems);
	}

	@Override
	public List<OrdersModels> findOrderByShipperId(int id) {

		return orderDAO.findOrderByShipperId(id);
	}

	@Override
	public List<OrdersModels> findOrderByShipperIdAndDistributed(int id) {

		return orderDAO.findOrderByShipperIdAndDistributed(id);
	}

	@Override
	public List<OrdersModels> countOrderByShipperId(int employeeID) {
		return orderDAO.countOrderByShipperId(employeeID);
	}

	@Override
	public List<OrdersModels> getOrderByOrderStatus(int shipperId, String orderStatus) {
		List<OrdersModels> listOrder = orderDAO.findAllOrders();
		List<OrdersModels> result = new ArrayList<OrdersModels>();
		for (OrdersModels order : listOrder) {
			if (order.getOrderStatus().contains(orderStatus) & order.getEmployeeId() == shipperId) {
				result.add(order);
			}
		}
		return result;
	}

	@Override
	public List<OrdersModels> getOrderByPaymentStatus(int shipperId, String paymentStatus) {
		List<OrdersModels> listOrder = orderDAO.findAllOrders();
		List<OrdersModels> result = new ArrayList<OrdersModels>();
		for (OrdersModels order : listOrder) {
			if (order.getPaymentStatus().contains(paymentStatus) & order.getEmployeeId() == shipperId) {
				result.add(order);
			}
		}
		return result;
	}

	@Override
	public long totalPriceProductSell() {
		return orderDAO.totalPriceProductSell();
	}

	@Override
	public List<OrdersItemModels> getOrderItems(int id) {
		return orderDAO.getOrderItems(id);
	}

	@Override
	public int countOrderRequest() {
		List<OrdersModels> listOrder = orderDAO.findAllOrders();

		listOrder.removeIf(order -> !"Save".equals(order.getOrderStatus()));
		return listOrder.size();
	}

	@Override
	public List<OrdersModels> canceledOrder(int id) {
		return orderDAO.canceledOrder(id);
	}

	@Override
	public long totalRevenueByMonth(int month) {
		return orderDAO.totalRevenueByMonth(month);
	}
	
	@Override
	public long totalRevenueByMonth(int month, int year) {
		return orderDAO.totalRevenueByMonth(month, year);
	}

	@Override
	public long totalRevenueByYear(int year) {
		return orderDAO.totalRevenueByYear(year);
	}

	@Override
	public int findLatestOrderId() {

		return orderDAO.findLatestOrderId();
	}
	@Override
	public List<OrdersModels> findAllOrderByUserAndOrderStatus(int customerId, String orderStatus) {
		List<OrdersModels> listOrder = findAllOrders();
		List<OrdersModels> result = new ArrayList<OrdersModels>();
		for (OrdersModels order: listOrder) {
			if(order.getCustomerID() == customerId & order.getOrderStatus().contains(orderStatus)) {
				result.add(order);
			}
		}
		return result;
	}
	
	@Override
	public List<OrdersModels> findAllOrderByUser(int customerId) {
		List<OrdersModels> listOrder = orderDAO.findAllOrders();
		List<OrdersModels> result = new ArrayList<OrdersModels>();
		for (OrdersModels order: listOrder) {
			if(order.getCustomerID() == customerId) {
				result.add(order);
			}
		}
		return result;
	}
	@Override
	public void updateOrder(double totalPriceOrder, String deliveryMethod, String paymentStatus) {
		orderDAO.updateOrder(totalPriceOrder, deliveryMethod, paymentStatus);
		
	}

	@Override
	public void update(OrdersModels model) {
		orderDAO.update(model);
	}

	@Override
	public OrdersModels findOne(int orderId) {
		return orderDAO.findOne(orderId);
	}

	@Override
	public void updateOrderPaymentStatus(int orderId, String paymentStatus) {
		orderDAO.updateOrderPaymentStatus(orderId, paymentStatus);
	}
	
	public Object[] thongke(int year){
		Object[] data = new Object[12];
		for(int i=0; i<12; i++) {
			data[i] = totalRevenueByMonth(i+1, year);
		}
		return data;
	}
	@Override
	public List<OrdersModels> getListOrderByPage(List<OrdersModels> listOrder, int start, int end) {
		List<OrdersModels> listOrderPage = new ArrayList<>();
		
		for (int i = start; i < end; i++) {
			listOrderPage.add(listOrder.get(i));
		}
		return listOrderPage;
	}
}
