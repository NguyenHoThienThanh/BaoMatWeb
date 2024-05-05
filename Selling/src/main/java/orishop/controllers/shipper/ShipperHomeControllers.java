package orishop.controllers.shipper;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import orishop.DAO.CustomerDAOImp;
import orishop.DAO.IEmployeeDAO;
import orishop.models.AccountModels;
import orishop.models.CategoryModels;
import orishop.models.CustomerModels;
import orishop.models.EmployeeModels;
import orishop.models.OrdersModels;
import orishop.services.CategoryServiceImp;
import orishop.services.CustomerServiceImp;
import orishop.services.EmployeeServiceImp;
import orishop.services.ICategoryService;
import orishop.services.ICustomerService;
import orishop.services.IEmployeeService;
import orishop.services.IOrderService;
import orishop.services.OrderServiceImpl;

@WebServlet(urlPatterns = {"/shipper/home", "/shipper/order", "/shipper/updateinfor"})

public class ShipperHomeControllers extends HttpServlet {
	ICategoryService cateService = new CategoryServiceImp();
	IEmployeeService empService = new EmployeeServiceImp();
	ICustomerService cusService = new CustomerServiceImp();
	IOrderService orderService = new OrderServiceImpl();
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		
		if(url.contains("shipper/home")) {
			getOrderByShipper(req, resp);
		} else if(url.contains("shipper/order")) {
			RequestDispatcher rd = req.getRequestDispatcher("/views/shipper/shipper_order.jsp");
			rd.forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String url = req.getRequestURI();
		
		if(url.contains("shipper/updateinfor")) {
			postUpdateInfo(req, resp);
		}
	}
	
	protected void getOrderByShipper(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		HttpSession session = req.getSession();
		AccountModels account = (AccountModels) session.getAttribute("account");
		
		EmployeeModels shipper = empService.findShipperByAccountID(account.getAccountID());
		if(shipper != null) {
			List<OrdersModels> listOrders = orderService.findOrderByShipperId(shipper.getEmployeeId());
			
			 int pagesize = 3; 
			 int size = listOrders.size(); 
			 int num = (size%pagesize==0 ? (size/pagesize) : (size/pagesize + 1)); 
			 int page, numberpage = pagesize;
			 String xpage = req.getParameter("page"); 
			 if (xpage == null) {
				 page = 1; 
			} else { 
				page = Integer.parseInt(xpage); 
			} 
			 int start,end; 
			 start = (page - 1) *numberpage; 
			 end = Math.min(page*numberpage, size);
			 
			 List<OrdersModels> list = orderService.getListOrderByPage(listOrders, start, end); 
			 req.setAttribute("listorder", list);
			req.setAttribute("page", page);
			req.setAttribute("num", num);
			 ///------------------
			
			List<OrdersModels> listOrderDelivered = orderService.getOrderByOrderStatus(shipper.getEmployeeId(), "Đã giao khách hàng");
			
			int pagesize1 = 3; 
			 int size1 = listOrderDelivered.size(); 
			 int num1 = (size1%pagesize1==0 ? (size1/pagesize1) : (size1/pagesize1 + 1)); 
			 int page1, numberpage1 = pagesize1;
			 String xpage1 = req.getParameter("page1"); 
			 if (xpage1 == null) {
				 page1 = 1; 
			} else { 
				page1 = Integer.parseInt(xpage1); 
			} 
			 int start1,end1; 
			 start1 = (page1 - 1) *numberpage1; 
			 end1 = Math.min(page1*numberpage1, size1);
			 List<OrdersModels> list1 = orderService.getListOrderByPage(listOrderDelivered, start1, end1); 
			 req.setAttribute("listorderdelivered", list1);
			 req.setAttribute("page1", page1);
			 req.setAttribute("num1", num1);
			///--------------------------------
			List<OrdersModels> listOrderDelivering = orderService.getOrderByOrderStatus(shipper.getEmployeeId(), "Ðã giao cho shipper");
			int pagesize2 = 3; 
			 int size2 = listOrderDelivering.size(); 
			 int num2 = (size2%pagesize2==0 ? (size2/pagesize2) : (size2/pagesize2 + 1)); 
			 int page2, numberpage2 = pagesize2;
			 String xpage2 = req.getParameter("page2"); 
			 if (xpage2 == null) {
				 page2 = 1; 
			} else { 
				page2 = Integer.parseInt(xpage2); 
			} 
			 int start2,end2; 
			 start2 = (page2 - 1) *numberpage2; 
			 end2 = Math.min(page2*numberpage2, size2);
			 List<OrdersModels> list2 = orderService.getListOrderByPage(listOrderDelivering, start2, end2); 
			req.setAttribute("listorderdelivering", list2);

			 req.setAttribute("page2", page2);
			 req.setAttribute("num2", num2);
			
			//----------------
			req.setAttribute("shipper", shipper);
			req.setAttribute("username", account.getUsername());
			
			
			RequestDispatcher rd 
			= req.getRequestDispatcher("/views/shipper/shipper_order.jsp");
			rd.forward(req, resp);
		} 	
	}
	
	protected void postUpdateInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		EmployeeModels shipper = new EmployeeModels();
		
		try {
			// lay du lieu tu jsp bang beanutils
			BeanUtils.populate(shipper, req.getParameterMap());
			empService.updateEmployee(shipper);
			//thông báo kết quả
			req.setAttribute("shipper", shipper);
			req.setAttribute("message","Add successful");
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error","Add fails");
		}
		resp.sendRedirect(req.getContextPath() + "/shipper/home");
	}	
}
