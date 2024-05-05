package orishop.controllers.admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import orishop.models.ProductModels;
import orishop.services.CategoryServiceImp;
import orishop.services.CustomerServiceImp;
import orishop.services.EmployeeServiceImp;
import orishop.services.ICategoryService;
import orishop.services.ICustomerService;
import orishop.services.IEmployeeService;

@WebServlet(urlPatterns = {"/admin/listshipper", "/admin/shipperdetail", "/admin/searchshipper","/admin/deleteshipper", "/admin/updateshipper"})

public class AdminShipperControllers extends HttpServlet {
	ICategoryService cateService = new CategoryServiceImp();
	IEmployeeService empService = new EmployeeServiceImp();
	ICustomerService cusService = new CustomerServiceImp();
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		if(url.contains("admin/listshipper")) {
			findAllShipper(req, resp);
		} else if(url.contains("admin/shipperdetail")) {
			getShipperDetail(req, resp);
		} else if(url.contains("admin/searchshipper")) {
			getSearchShipper(req, resp);
		}
		 else if(url.contains("/admin/deleteshipper")) {
				getDeleteShipper(req, resp);
			}
	}
	private void getDeleteShipper(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String url = req.getRequestURI();
		if(url.contains("admin/searchshipper")) {
			getSearchShipper(req, resp);
		} else if(url.contains("admin/updateshipper")) {
			postUpdateShipper(req, resp);
		}
	}

	//region shipper
	private void findAllShipper(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String search = req.getParameter("search_info");
		
		List<EmployeeModels> listEmp;
		if(search == null || search.isBlank()) {
			listEmp = empService.findAllShipper();
		} else {
			EmployeeModels emp;
			try {
				emp = empService.findShipper(Integer.valueOf(search));
			} catch (Exception e){
				emp = empService.findShipper(search).get(0);
			}
			listEmp = new ArrayList<EmployeeModels>();
			listEmp.add(emp);
		}
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
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/control_shipper/listshipper.jsp");
		rd.forward(req, resp);
	}
	
	private void getShipperDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int id = Integer.valueOf(req.getParameter("id"));
		
		EmployeeModels shipper = empService.findShipper(id);
		
		req.setAttribute("shipper", shipper);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/control_shipper/detailinforshipper.jsp");
		rd.forward(req, resp);
	}
	
	private void getSearchShipper(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String usename = req.getParameter("search_info");
		List<EmployeeModels> listShipper = empService.findShipper(usename);
		
		req.setAttribute("list", listShipper);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/control_shipper/listshipper.jsp");
		rd.forward(req, resp);	
	}
	
	private void postUpdateShipper(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int shipperId = Integer.valueOf(req.getParameter("employeeId"));
		EmployeeModels shipper = empService.findShipper(shipperId);
		System.out.println(shipper.getJob());
		try {
			BeanUtils.populate(shipper, req.getParameterMap());
			empService.updateShipper(shipper);
			req.setAttribute("shipper", shipper);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/control_shipper/detailinforshipper.jsp");
		rd.forward(req, resp);
	}
	//endregion
}
