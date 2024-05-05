package orishop.controllers.user;

import java.io.IOException;


import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import orishop.models.CartItemModels;
import orishop.models.OrdersModels;
import orishop.services.CartItemServiceImpl;
import orishop.services.CartServiceImpl;
import orishop.services.CustomerServiceImp;
import orishop.services.ICartItemService;
import orishop.services.ICartService;
import orishop.services.ICustomerService;
import orishop.services.IOrderService;
import orishop.services.OrderServiceImpl;
@WebServlet(urlPatterns = { "/user/payment","/user/updateorder"})

public class UserOrderController extends HttpServlet  {
private static final long serialVersionUID = 1L;
	
	ICartService cartService = new CartServiceImpl();
	ICartItemService cartItemService = new CartItemServiceImpl();
	ICustomerService CustomerSerivce = new CustomerServiceImp();
	IOrderService orderService = new OrderServiceImpl();
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String url = req.getRequestURI().toString();
		float deliveryFee = 0;
		int choose = 0;
		HttpSession session = req.getSession();
		int cartID = (int) session.getAttribute("cartID");
		List<CartItemModels> listCartItem = (List<CartItemModels>) session.getAttribute("listCartItem");
		
		
		if (url.contains("user/payment")) {
			
			try {
				choose = Integer.valueOf(req.getParameter("deliveryMethod"));
				if(choose == 1) {
					req.setAttribute("deliveryFee", 20000.0);
					deliveryFee = (float) 20000.0;
					
					
				} else if(choose == 2) {
					req.setAttribute("deliveryFee", 50000.0);
					deliveryFee = (float) 50000.0;
				}
			} catch (Exception e) {
				choose = 1;
				req.setAttribute("deliveryFee", 20000.0);
				deliveryFee = (float) 20000.0;
			}
			
			int customerId = (int)session.getAttribute("customerID");
			float totalPriceCart = (float)session.getAttribute("totalPriceCart");
			float totalPriceOrder = totalPriceCart + deliveryFee;
			session.setAttribute("totalPriceOrder", totalPriceOrder);
			
			String deliveryMethod = Integer.toString(choose);
			session.setAttribute("deliveryMethod", deliveryMethod);
			int flag = (int) session.getAttribute("flag");
			if(flag == 1) {
			OrdersModels model = new OrdersModels();
			model.setDeliveryMethod(deliveryMethod);
			orderService.createOrder(model, customerId, totalPriceOrder, listCartItem);
			cartItemService.deleteAllCartItem(cartID);
			flag = 0;
			session.setAttribute("flag", flag);
			}
			
			
			RequestDispatcher rd = req.getRequestDispatcher("/views/user/inforuser_cart/detailcart.jsp");
			rd.forward(req, resp);
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if (url.contains("/user/updateorder")) {
			updateOrder(req, resp);
		}
	}
	private void updateOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
		float totalPriceOrder = (float) session.getAttribute("totalPriceOrder");
		String deliveryMethod = (String) session.getAttribute("deliveryMethod");
		String paymentStatus = "Unpaid";
		orderService.updateOrder(totalPriceOrder, deliveryMethod, paymentStatus);
	}
	
}




