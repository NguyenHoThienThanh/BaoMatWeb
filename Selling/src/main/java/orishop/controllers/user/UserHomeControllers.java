package orishop.controllers.user;

import java.io.IOException;
import java.net.http.HttpHeaders;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import orishop.models.AccountModels;
import orishop.models.CartModels;
import orishop.models.CategoryModels;
import orishop.models.CustomerModels;
import orishop.models.ProductModels;
import orishop.services.CartItemServiceImpl;
import orishop.services.CartServiceImpl;
import orishop.services.CategoryServiceImp;
import orishop.services.CustomerServiceImp;
import orishop.services.EmployeeServiceImp;
import orishop.services.ICartItemService;
import orishop.services.ICartService;
import orishop.services.ICategoryService;
import orishop.services.ICustomerService;
import orishop.services.IEmployeeService;
import orishop.services.IProductService;
import orishop.services.IRatingService;
import orishop.services.ProductServiceImp;
import orishop.services.RatingServiceImpl;

@WebServlet(urlPatterns = {"/user/home", "/user/editInfor", "/user/updateuser"})

public class UserHomeControllers extends HttpServlet {
	ICategoryService cateService = new CategoryServiceImp();
	IEmployeeService empService = new EmployeeServiceImp();
	ICustomerService cusService = new CustomerServiceImp();
	ICartService cartService = new CartServiceImpl();
	ICartItemService cartItemService = new CartItemServiceImpl();
	IProductService productService = new ProductServiceImp();
	ICategoryService categoryService = new CategoryServiceImp();
	IRatingService ratingService = new RatingServiceImpl();
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		if(url.contains("user/home")) {		
			getHome(req, resp);
		} else if (url.contains("user/editInfor")) {
			List<CustomerModels> listcustomer = cusService.findAll();
			req.setAttribute("listcustomer", listcustomer);
			RequestDispatcher rd = req.getRequestDispatcher("/views/user/inforuser_cart/inforuser.jsp");
			rd.forward(req, resp);
		}
	}
	private void getHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//resp.setHeader("Set-Cookie", "key=value; HttpOnly; SameSite=strict");
		
		HttpSession session = req.getSession();
		AccountModels user = (AccountModels) session.getAttribute("account");
		session.setAttribute("ratingService", ratingService);
		if (user != null) {
			CustomerModels cus = cusService.findCustomerByAccountID(user.getAccountID());
			CartModels cart1 = cartService.findCartByCustomerID(cus.getCustomerId());

			req.setAttribute("username", user.getUsername());
			req.setAttribute("accountID", user.getAccountID());
			req.setAttribute("customerID", cus.getCustomerId());
			session.setAttribute("customer", cus);
			session.setAttribute("customerID", cus.getCustomerId());
			session = req.getSession(true);
			session.setAttribute("cartID", cart1.getCartId());
			req.setAttribute("cartID", (int)session.getAttribute("cartID"));

			int countCartItem = cartItemService.countCartItem((int)session.getAttribute("cartID"));
			session.setAttribute("countCartItem", countCartItem);
			req.setAttribute("countCartItem", (int)session.getAttribute("countCartItem"));
		}
		List<ProductModels> listProduct = productService.findTopProduct(9);
		List<ProductModels> listProductSale = productService.findTopSaleProduct(3);
		List<CategoryModels> listCate = categoryService.findAllCategory();
		
		req.setAttribute("list", listProduct);
		req.setAttribute("listS", listProductSale);
		req.setAttribute("listC", listCate);

		req.getRequestDispatcher("/views/user/product/home.jsp").forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String url = req.getRequestURI().toString();
		if (url.contains("editInfor")) {
			editInfor(req, resp);
		} else if (url.contains("user/updateuser")) {
			postUpdateUser(req, resp);
		}
	}
	private void editInfor(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");


		CustomerModels model = new CustomerModels();
		try {
			// lay du lieu tu jsp bang beanutils
			BeanUtils.populate(model, req.getParameterMap());

			//model.setCategory(catService.findOne(model.getCategoryID())); 
			cusService.editInfor(model);
			//thông báo kết quả
			req.setAttribute("customer", model);
			req.setAttribute("message","Edit successful");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error","Edit fails");
		}
		resp.sendRedirect(req.getContextPath() + "/listcustomer");	
	}
		
	private void postUpdateUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
		CustomerModels model = (CustomerModels) session.getAttribute("customer");
		try {
			// lay du lieu tu jsp bang beanutils
			BeanUtils.populate(model, req.getParameterMap());

			//model.setCategory(catService.findOne(model.getCategoryID())); 
			cusService.editInfor(model);
			//thông báo kết quả
			session.setAttribute("customer", model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("/views/user/inforuser_cart/inforuser.jsp").forward(req, resp);
	}
}
