package orishop.controllers.seller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import orishop.models.CategoryModels;
import orishop.models.OrdersItemModels;
import orishop.models.OrdersModels;
import orishop.models.ProductModels;
import orishop.services.CategoryServiceImp;
import orishop.services.CustomerServiceImp;
import orishop.services.ProductServiceImp;
import orishop.services.IProductService;
import orishop.services.OrderServiceImpl;
import orishop.services.EmployeeServiceImp;
import orishop.services.ICategoryService;
import orishop.services.ICustomerService;
import orishop.services.IEmployeeService;
import orishop.services.IOrderService;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1025 * 50, maxRequestSize = 1024 * 1024
		* 50)
@WebServlet(urlPatterns = { "/seller/home", "/seller/listproduct", "/seller/insertpro", "/seller/updatepro",
		"/seller/deletepro", "/seller/listorder", "/seller/detailorder", "/seller/updateorderSeller"})

public class SellerHomeControllers extends HttpServlet {
	ICategoryService cateService = new CategoryServiceImp();
	IEmployeeService empService = new EmployeeServiceImp();
	ICustomerService cusService = new CustomerServiceImp();
	IProductService proService = new ProductServiceImp();
	IOrderService orderService = new OrderServiceImpl();
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		if (url.contains("seller/home")) {
			long totalPrice = orderService.totalRevenueByMonth(1);
			long earningannual = orderService.totalRevenueByYear(2023);
				
			int orderrequest = orderService.countOrderRequest();
			req.setAttribute("earningmonthly", totalPrice);
			req.setAttribute("earningannual", earningannual);
			req.setAttribute("orderrequest", orderrequest);
			RequestDispatcher rd = req.getRequestDispatcher("/views/seller/revenue.jsp");
			rd.forward(req, resp);
		} else if (url.contains("listproduct")) {
			List<ProductModels> list = proService.findAllProduct();
			List<CategoryModels> listcate = cateService.findAllCategory();
			req.setAttribute("listcate", listcate);
			req.setAttribute("list", list);

			RequestDispatcher rd = req.getRequestDispatcher("/views/seller/listproduct.jsp");
			rd.forward(req, resp);
		} else if (url.contains("insertpro")) {
			List<CategoryModels> listcate = cateService.findAllCategory();
			req.setAttribute("listcate", listcate);

			RequestDispatcher rd = req.getRequestDispatcher("/views/seller/addproduct.jsp");
			rd.forward(req, resp);
		} else if (url.contains("updatepro")) {
			List<CategoryModels> listcate = cateService.findAllCategory();
			req.setAttribute("listcate", listcate);
			ProductModels product = proService.findOne(Integer.parseInt(req.getParameter("id")));
			req.setAttribute("product", product);

			RequestDispatcher rd = req.getRequestDispatcher("/views/seller/updateproduct.jsp");
			rd.forward(req, resp);
		} else if (url.contains("deletepro")) {
			deleteProduct(req, resp);
		}  else if (url.contains("listorder")) {
			getListOrder(req, resp);
		} else if (url.contains("seller/detailorder")) {
			getDetailOrder(req, resp);
		} 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if (url.contains("insertpro")) {
			addProduct(req, resp);
		} else if (url.contains("updatepro")) {
			UpdateProduct(req, resp);
		} else if (url.contains("seller/detailorder")) {
			postDetailOrder(req, resp);
		} else if (url.contains("seller/updateorderSeller")) {
			postUpdateOrder(req, resp);
		} 
	}

	private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		int id = Integer.parseInt(req.getParameter("id"));
		ProductModels product = proService.findOne(id);
		try {
			proService.deleteProduct(product);
			req.setAttribute("message", "Xoa thanh cong");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "That bai");
		}
		RequestDispatcher rd = req.getRequestDispatcher("/seller/listproduct");
		rd.forward(req, resp);
	}

	private void addProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		ProductModels model = new ProductModels();
		try {
			// lay du lieu tu jsp bang beanutils
			BeanUtils.populate(model, req.getParameterMap());
			model.setCategory(cateService.findOne(model.getCategoryId()));
			proService.insertProduct(model);
			// thông báo kết quả
			req.setAttribute("product", model);
			req.setAttribute("message", "Add successful");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Add fails");
		}

		resp.sendRedirect(req.getContextPath() + "/seller/listproduct");

	}

	private void UpdateProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		ProductModels model = new ProductModels();
		try {
			// lay du lieu tu jsp bang beanutils
			BeanUtils.populate(model, req.getParameterMap());

			// Xử lý truong image

			model.setCategory(cateService.findOne(model.getCategoryId()));
			proService.updateProduct(model);
			// thông báo kết quả
			req.setAttribute("product", model);
			req.setAttribute("message", "Update successful");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Update fails");
		}

		resp.sendRedirect(req.getContextPath() + "/seller/listproduct");
	}
	
	private void postDetailOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int id = Integer.valueOf(req.getParameter("orderId"));
		OrdersModels model = orderService.findOne(id);
		try {
			// lay du lieu tu jsp bang beanutils
			BeanUtils.populate(model, req.getParameterMap());

			// thông báo kết quả
			req.setAttribute("model", model);

		} catch (Exception e) {
			e.printStackTrace();
		}

		resp.sendRedirect(req.getContextPath() + "/seller/listproduct");
	}
		
	private void postUpdateOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int id = Integer.valueOf(req.getParameter("orderId"));
		OrdersModels model = orderService.findOne(id);
		try {
			// lay du lieu tu jsp bang beanutils
			BeanUtils.populate(model, req.getParameterMap());

			// Xử lý truong image
			orderService.update(model);
			// thông báo kết quả
			req.setAttribute("model", model);

		} catch (Exception e) {
			e.printStackTrace();
		}

		resp.sendRedirect(req.getContextPath() + "/seller/listorder");
	}
	
	private void getDetailOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int id = Integer.valueOf(req.getParameter("orderid"));
		OrdersModels model = orderService.findOne(id);
		req.setAttribute("i", model);

		RequestDispatcher rd = req.getRequestDispatcher("/views/seller/detailorder.jsp");
		rd.forward(req, resp);
	}
	
	private void getListOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		List<OrdersModels> listorder = orderService.findAllOrders();
		
		req.setAttribute("listorder", listorder);

		RequestDispatcher rd = req.getRequestDispatcher("/views/seller/listorder.jsp");
		rd.forward(req, resp);
	}
}