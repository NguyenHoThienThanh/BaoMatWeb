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

import orishop.models.*;
import orishop.services.*;

@WebServlet(urlPatterns = { "/user/product/insertCartItem", "/user/findCartByCartID", "/user/findCartItem",
		"/user/insertCartItem", "/user/updateCartItem", "/user/deleteCartItem", "/user/countCartItem", "/user/insertorder", "/user/mypurchase"})

public class UserCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ICartService cartService = new CartServiceImpl();
	ICartItemService cartItemService = new CartItemServiceImpl();
	ICustomerService customerSerivce = new CustomerServiceImp();
	IEmployeeService empService = new EmployeeServiceImp();
	IOrderService orderService = new OrderServiceImpl();

	IProductService productService = new ProductServiceImp();
	ICategoryService categoryService = new CategoryServiceImp();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String url = req.getRequestURI().toString();
		int flag = 1;
		HttpSession session = req.getSession();
		session.setAttribute("flag", flag);
		if (url.contains("user/findCartByCartID")) {
			listCartItemByPage(req, resp);
		} else if (url.contains("user/deleteCartItem")) {
			deleteCartItemByPage(req, resp);
		} else if (url.contains("user/updateCartItem")) {
			updateCartItem(req, resp);
		} else if (url.contains("user/mypurchase")) {
			getMyPurchase(req, resp);
		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if (url.contains("insertCartItem")) {
			insertCartItem(req, resp);
		} else if (url.contains("/user/insertorder")) {
			insertOrder(req, resp);
			deleteAllCartItem(req, resp);
		}
	}

	private void updateCartItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		int cartId = Integer.parseInt(req.getParameter("cartID"));
		int productId = Integer.parseInt(req.getParameter("productID"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		float totalPrice = Float.parseFloat(req.getParameter("totalPrice"));

		CartItemModels cartItem = new CartItemModels();
		cartItem.setCartID(cartId);
		cartItem.setProductID(productId);
		cartItem.setQuantity(quantity);
		cartItem.setTotalPrice(totalPrice);

		cartItemService.updateCartItem(cartItem);

		resp.sendRedirect(req.getContextPath() + "/user/findCartByCartID");
	}

	private void insertCartItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		try {
			HttpSession session = req.getSession();
			int cartId = ((int) session.getAttribute("cartID"));
			int productId = ((int) session.getAttribute("productID"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));

			CartItemModels model = cartItemService.findCartItemByProductID(cartId, productId);
			if (model.getCartID() != cartId) {
				CartItemModels cartItem = new CartItemModels();
				cartItem.setCartID(cartId);
				cartItem.setProductID(productId);
				cartItem.setQuantity(quantity);
				cartItemService.insertCartItem(cartItem);
			} else {
				CartItemModels cartItem = new CartItemModels();
				cartItem.setCartID(cartId);
				cartItem.setProductID(productId);
				cartItem.setQuantity(quantity + model.getQuantity());
				cartItemService.updateCartItem(cartItem);
			}
		}catch(Exception ex) {
			System.err.println("Error finding: " + ex.getMessage());
		}
		
		resp.sendRedirect(req.getContextPath() + "/user/findCartByCartID");
	}

	private void listCartItemByPage(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String url = req.getRequestURI().toString();

		if (url.contains("user/findCartByCartID")) {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");

			HttpSession session = req.getSession();
			AccountModels user = (AccountModels) session.getAttribute("account");
			if (user != null) {
				CustomerModels cus = customerSerivce.findCustomerByAccountID(user.getAccountID());
				CartModels cart1 = cartService.findCartByCustomerID(cus.getCustomerId());

				req.setAttribute("username", user.getUsername());
				req.setAttribute("accountID", user.getAccountID());

				session = req.getSession(true);
				session.setAttribute("cartID", cart1.getCartId());
				req.setAttribute("cartID", (int) session.getAttribute("cartID"));

				int countCartItem = cartItemService.countCartItem((int) session.getAttribute("cartID"));
				session.setAttribute("countCartItem", countCartItem);
				req.setAttribute("countCartItem", (int) session.getAttribute("countCartItem"));
			}

			try {
				CartModels cart = cartService.findCartByCartID((int) session.getAttribute("cartID"));
				req.setAttribute("cart", cart);
				List<CartItemModels> listCartItem = cartItemService.findCartItemByCartID(cart.getCartId());
				session.setAttribute("listCartItem", listCartItem);

				int pagesize = 4;
				int size = listCartItem.size();
				int num = (size % pagesize == 0 ? (size / pagesize) : (size / pagesize + 1));
				int page, numberpage = pagesize;
				String xpage = req.getParameter("page");
				if (xpage == null) {
					page = 1;
				} else {
					page = Integer.parseInt(xpage);
				}
				int start, end;
				start = (page - 1) * numberpage;
				end = Math.min(page * numberpage, size);

				List<CartItemModels> list = cartItemService.getCartItemByPage(listCartItem, start, end);
				req.setAttribute("list", list);
				req.setAttribute("page", page);
				req.setAttribute("num", num);
				req.setAttribute("count", listCartItem.size());

				float totalPriceCart = cartService.totalPriceCart((int) session.getAttribute("cartID"));
				session.setAttribute("totalPriceCart", totalPriceCart);
				req.setAttribute("totalPriceCart", (float) session.getAttribute("totalPriceCart"));
			}catch(Exception ex) {
				System.err.println("Error finding: " + ex.getMessage());
			}
			

			req.getRequestDispatcher("/views/user/inforuser_cart/cart.jsp").forward(req, resp);
		}
	}
	private void deleteCartItemByPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		int cartId = Integer.parseInt(req.getParameter("cartID"));
		int productId = Integer.parseInt(req.getParameter("productID"));

		cartItemService.deleteCartItem(cartId, productId);

		req.setAttribute("message", "Đã xóa thành công");

		resp.sendRedirect(req.getContextPath() + "/user/findCartByCartID");
	}
	
	private void insertOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
		OrdersModels model = new OrdersModels();
		int customerId = (int) session.getAttribute("customerID");
		float totalPriceOrder = (float) session.getAttribute("totalPriceCart");
		int cartID = (int) session.getAttribute("cartID");
		List<CartItemModels> listCartItem = cartItemService.findCartItemByCartID(cartID);

		orderService.createOrder(model, customerId, totalPriceOrder, listCartItem);
	}
	
	private void deleteAllCartItem(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		int cartID = (int) session.getAttribute("cartID");

		cartItemService.deleteAllCartItem(cartID);
	}
	
	private void getMyPurchase(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		HttpSession session = req.getSession();
		AccountModels user = (AccountModels) session.getAttribute("account");
		if (user != null) {
			CustomerModels cus = customerSerivce.findCustomerByAccountID(user.getAccountID());
			List<OrdersModels> listOrder = orderService.findAllOrderByUser(cus.getCustomerId());
			List<OrdersModels> listOrdered = orderService.findAllOrderByUserAndOrderStatus(cus.getCustomerId(), "Save");
			List<OrdersModels> listOrderDelivering = orderService.findAllOrderByUserAndOrderStatus(cus.getCustomerId(), "Đã giao cho shipper");
			List<OrdersModels> listOrderComplete = orderService.findAllOrderByUserAndOrderStatus(cus.getCustomerId(), "Đã giao khách hàng");
			List<OrdersModels> listordersave = orderService.findAllOrderByUserAndOrderStatus(cus.getCustomerId(), "Chưa giao cho shipper");
			req.setAttribute("listorder", listOrder);
			req.setAttribute("listordered", listOrdered);
			req.setAttribute("listdelivering", listOrderDelivering);
			req.setAttribute("listcomplete", listOrderComplete);
			req.setAttribute("listordersave", listordersave);
			
			req.getRequestDispatcher("/views/user/inforuser_cart/mypurchase.jsp").forward(req, resp);
		}
	}
}
