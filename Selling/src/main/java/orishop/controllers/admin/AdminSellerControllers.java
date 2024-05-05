package orishop.controllers.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import orishop.DAO.CustomerDAOImp;
import orishop.DAO.IEmployeeDAO;
import orishop.models.CategoryModels;
import orishop.models.CustomerModels;
import orishop.models.EmployeeModels;
import orishop.services.CategoryServiceImp;
import orishop.services.CustomerServiceImp;
import orishop.services.EmployeeServiceImp;
import orishop.services.ICategoryService;
import orishop.services.ICustomerService;
import orishop.services.IEmployeeService;

@WebServlet(urlPatterns = {"/admin/listseller","/admin/searchSeller", "/admin/sellerdetail", "/admin/updateseller", "/admin/deleteseller"})

public class AdminSellerControllers extends HttpServlet {
	ICategoryService cateService = new CategoryServiceImp();
	IEmployeeService empService = new EmployeeServiceImp();
	ICustomerService cusService = new CustomerServiceImp();
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		if(url.contains("admin/listseller")) {
			findAllSeller(req, resp);
		}
		else if(url.contains("admin/searchSeller")) {
			getSearchSeller(req, resp);
		} else if (url.contains("admin/sellerdetail")) {
			getSellerDetail(req, resp);
		}
	}
	private void getSearchSeller(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String usename = req.getParameter("search_info");
		List<EmployeeModels> listseller = empService.findSellerBySellerName(usename);
		
		req.setAttribute("list", listseller);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/control_seller/listseller.jsp");
		rd.forward(req, resp);
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String url = req.getRequestURI();
		if(url.contains("admin/searchSeller")) {
			getSearchSeller(req, resp);
		} else if(url.contains("admin/updateseller")) {
			getUpdateSeller(req, resp);
		}
	}
	
	//region seller
	private void findAllSeller(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		List<EmployeeModels> listEmp = empService.findAllSeller();
		
		int pagesize = 3;
		int size = listEmp.size();
		int num = (size%pagesize==0 ? (size/pagesize) : (size/pagesize + 1));
		int page, numberpage = pagesize;
		String xpage = req.getParameter("page");
		if (xpage == null) {
			page = 1;
		}
		else {
			page = Integer.parseInt(xpage);
		}
		int start,end;
		start = (page - 1) * numberpage;
		end = Math.min(page*numberpage, size);
		
		List<EmployeeModels> list = empService.getListEmpByPage(listEmp, start, end);
		req.setAttribute("list", list);
		req.setAttribute("page", page);
		req.setAttribute("num", num);
		req.setAttribute("count", listEmp.size());
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/control_seller/listseller.jsp");
		rd.forward(req, resp);
	}
	
	private void getSellerDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int id = Integer.valueOf(req.getParameter("id"));
		
		EmployeeModels seller = empService.findSeller(id);
		
		req.setAttribute("seller", seller);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/control_seller/detailinforseller.jsp");
		rd.forward(req, resp);
	}
	
	private void getUpdateSeller(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int sellerId = Integer.valueOf(req.getParameter("employeeId"));
		EmployeeModels seller = empService.findSeller(sellerId);
		System.out.println(seller.getJob());
		try {
			BeanUtils.populate(seller, req.getParameterMap());
			empService.updateSeller(seller);
			req.setAttribute("seller", seller);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/control_seller/detailinforseller.jsp");
		rd.forward(req, resp);
	}
	
	//endregion
}
