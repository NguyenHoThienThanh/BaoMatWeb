package orishop.controllers.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import orishop.controllers.admin.CsrfTokenManager;
import orishop.models.AccountModels;
import orishop.models.CartModels;
import orishop.models.CategoryModels;
import orishop.models.CustomerModels;
import orishop.models.ProductModels;
import orishop.models.RatingModels;
import orishop.services.CategoryServiceImp;
import orishop.services.ICategoryService;
import orishop.services.IProductService;
import orishop.services.IRatingService;
import orishop.services.ProductServiceImp;
import orishop.services.RatingServiceImpl;


@WebServlet(urlPatterns = {"/user/product/listProduct", "/user/product/productByCategory", "/user/product/detailProduct", 
		"/user/product/manager", "/user/product/insert", "/user/product/update",
		"/user/product/delete", "/user/product/filterDesc", "/user/product/filterAsc", 
		"/user/product/topProduct", "/user/product/searchProduct", "/user/product/review",
		"/user/product/deleterating"})
public class UserProductController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final String CSRF_TOKEN_ATTR = "csrfToken";

	IProductService productService = new ProductServiceImp();
	ICategoryService categoryService = new CategoryServiceImp();
	IRatingService ratingService = new RatingServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();

		if (url.contains("listProduct")) {
			getListProduct(req, resp);
			
		} else if (url.contains("productByCategory")) {
			getProductByCategory(req, resp);
			
		}else if (url.contains("detailProduct")) {
			getDetailProduct(req, resp);
			
		}
//		else if (url.contains("insert")) {
//			doGet_Insert(req, resp);
//		}

		else if (url.contains("update")) {
			getUpdate(req, resp);
		} else if (url.contains("delete")) {
			getDelete(req, resp);
		} else if (url.contains("filterDesc")) {
			getFilterDesc(req, resp);

		} else if (url.contains("filterAsc")) {
			getFilterAsc(req, resp);

		} else if (url.contains("topProduct")) {
			getTopProduct(req, resp);

		} else if (url.contains("review")) {
			
		} else if (url.contains("product/deleterating")) {
			getDeleteRating(req, resp);
		}
	}
	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		resp.setCharacterEncoding("UTF-8");
//
//		String url = req.getRequestURI().toString();
//
//		if (url.contains("update")) {
//			doPost_Update(req, resp);
//		} else if (url.contains("insert")) {
//			doPost_Insert(req, resp);
//		} else if (url.contains("searchProduct")) {
//			postSearchProduct(req, resp);
//		} else if (url.contains("review")) {
//			postReview(req, resp);
//		}
//	}
	
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			String url = req.getRequestURI().toString();
			String csrfTokenFromForm = req.getParameter("csrfToken");
			String sessionId = req.getSession().getId();
			String csrfTokenFromSession = CsrfTokenManager.getCsrfTokenForSession(sessionId);
			if (csrfTokenFromSession != null && csrfTokenFromSession.equals(csrfTokenFromForm)) {
				if (url.contains("update")) {
					doPost_Update(req, resp);
				} else if (url.contains("insert")) {
					doPost_Insert(req, resp);
				} else if (url.contains("searchProduct")) {
					postSearchProduct(req, resp);
				} else if (url.contains("review")) {
					postReview(req, resp);
				}
			}
		}


	private void postSearchProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String proName = req.getParameter("searchProduct");
		List<ProductModels> listProduct = productService.findProduct(proName);
		
		int pagesize = 10;
		int size = listProduct.size();
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
		List<ProductModels> list = productService.getListEmpByPage(listProduct, start, end);
		req.setAttribute("list", list);
		req.setAttribute("page", page);
		req.setAttribute("num", num);
		req.setAttribute("count", listProduct.size());
		
		List<CategoryModels> listCate = categoryService.findAllCategory();
		
		req.setAttribute("list", list);
		req.setAttribute("listC", listCate);

		
		req.getRequestDispatcher("/views/user/product/listproduct.jsp").forward(req, resp);
	}

	private void getTopProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ProductModels> listProduct = productService.findTopProduct(10);
		int pagesize = 10;
		int size = listProduct.size();
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
		List<ProductModels> list = productService.getListEmpByPage(listProduct, start, end);
		req.setAttribute("list", list);
		req.setAttribute("page", page);
		req.setAttribute("num", num);
		req.setAttribute("count", listProduct.size());
		
		List<CategoryModels> listCate = categoryService.findAllCategory();
		
		req.setAttribute("list", list);
		req.setAttribute("listC", listCate);

		
		req.getRequestDispatcher("/views/user/product/listproduct.jsp").forward(req, resp);
		
	}

	private void getFilterAsc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ProductModels> listProduct = productService.filterProductAscByPrice();
		int pagesize = 10;
		int size = listProduct.size();
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
		List<ProductModels> list = productService.getListEmpByPage(listProduct, start, end);
		req.setAttribute("list", list);
		req.setAttribute("page", page);
		req.setAttribute("num", num);
		req.setAttribute("count", listProduct.size());
		
		List<CategoryModels> listCate = categoryService.findAllCategory();
		
		req.setAttribute("list", list);
		req.setAttribute("listC", listCate);

		
		req.getRequestDispatcher("/views/user/product/listproduct.jsp").forward(req, resp);
		
	}
	
	private void getDetailProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    	
//	        String pidParam = req.getParameter("pid");
//	        if (pidParam != null && pidParam.matches("\\d+")) { // Kiểm tra xem "pid" có phải là một chuỗi chứa các chữ số không
//	            int pid = Integer.parseInt(pidParam);
//	            ProductModels pro = productService.findOne(pid);
//	            if (pro != null) {
//	                String csrfToken = CsrfTokenManager.generateCsrfToken();
//	                CsrfTokenManager.saveCsrfTokenForSession(req.getSession().getId(), csrfToken);
//	                req.setAttribute(CSRF_TOKEN_ATTR, csrfToken);
//
//	                HttpSession session = req.getSession(true);
//	                session.setAttribute("productID", pro.getProductId());
//	                req.setAttribute("p", pro);
//	                req.getRequestDispatcher("/views/user/product/detailproduct.jsp").forward(req, resp);
//	                return;
//	            }
//	        }
//	        // Nếu "pid" không hợp lệ hoặc không tìm thấy sản phẩm, chuyển hướng đến trang lỗi hoặc xử lý khác
//	        resp.sendRedirect(req.getContextPath() + "/error"); // Chuyển hướng đến trang lỗi
	    	try {
	    	String pidParam = req.getParameter("pid");

	        if (pidParam != null) {
	            // Validate and sanitize input (using a whitelist approach)
	            String sanitizedPid = validateAndSanitizePid(pidParam);
	            if (sanitizedPid == null) {
	                // Handle invalid input (e.g., display error message)
	                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID format");
	                return;
	            }

	            try {
	                int pid = Integer.parseInt(sanitizedPid);
	                ProductModels pro = productService.findOne(pid);

	                if (pro != null) {
	                    String csrfToken = CsrfTokenManager.generateCsrfToken();
	                    CsrfTokenManager.saveCsrfTokenForSession(req.getSession().getId(), csrfToken);
	                    req.setAttribute(CSRF_TOKEN_ATTR, csrfToken);

	                    HttpSession session = req.getSession(true);
	                    session.setAttribute("productID", pro.getProductId());
	                    req.setAttribute("p", pro);
	                    req.getRequestDispatcher("/views/user/product/detailproduct.jsp").forward(req, resp);
	                } else {
	                    // Handle product not found (e.g., display appropriate message)
	                    req.setAttribute("errorMessage", "Product not found"); // Assuming you have an error handling mechanism
	                    req.getRequestDispatcher("/views/user/product/detailproduct.jsp").forward(req, resp);
	                }
	            } catch (NumberFormatException e) {
	                // Handle invalid format (e.g., display error message)
	            	e.printStackTrace();
	               // resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID format");
	                return;
	            }
	    }} catch (NumberFormatException e) {
	        // Xử lý nếu có lỗi khi chuyển đổi chuỗi thành số nguyên
	        e.printStackTrace(); // Hoặc log lỗi nếu cần
	        //resp.sendRedirect(req.getContextPath() + "/error"); // Chuyển hướng đến trang lỗi
	    } catch (Exception e) {
	        // Xử lý ngoại lệ khác
	        e.printStackTrace(); // Hoặc log lỗi nếu cần
	        //resp.sendRedirect(req.getContextPath() + "/error"); // Chuyển hướng đến trang lỗi
	    }
	}
	private String validateAndSanitizePid(String pidParam) {
	    if (pidParam.matches("^[a-zA-Z0-9_.-]+$")) {
	        return pidParam; // Valid format
	    } else {
	        return null; // Invalid format
	    }
	}

	private void getProductByCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    int id;
	    try {
	        id = Integer.parseInt(req.getParameter("cid"));
	    } catch (NumberFormatException e) {
	        // Xử lý ngoại lệ nếu "cid" không phải là một số nguyên hợp lệ
	        id = -1; // Hoặc một giá trị khác phù hợp, phụ thuộc vào yêu cầu của ứng dụng
	    }
	    
	    if (id != -1) { // Kiểm tra xem "cid" có giá trị hợp lệ không
	        List<ProductModels> listProduct = productService.findByCategory(id);
	        
	        req.setAttribute("list", listProduct);
	        int pagesize = 10;
	        int size = listProduct.size();
	        int num = (size % pagesize == 0 ? (size / pagesize) : (size / pagesize + 1));
	        int page, numberpage = pagesize;
	        String xpage = req.getParameter("page");
	        if (xpage == null) {
	            page = 1;
	        } else {
	            try {
	                page = Integer.parseInt(xpage);
	            } catch (NumberFormatException e) {
	                // Xử lý ngoại lệ nếu "page" không phải là một số nguyên hợp lệ
	                page = 1; // Trở về trang đầu tiên mặc định
	            }
	        }
	        int start = (page - 1) * numberpage;
	        int end = Math.min(page * numberpage, size);
	        List<ProductModels> list = productService.getListEmpByPage(listProduct, start, end);
	        req.setAttribute("list", list);
	        req.setAttribute("page", page);
	        req.setAttribute("num", num);
	        req.setAttribute("count", listProduct.size());
	        
	        List<CategoryModels> listCate = categoryService.findAllCategory();
	        
	        req.setAttribute("listC", listCate);
	    }
	    
	    req.getRequestDispatcher("/views/user/product/listproduct.jsp").forward(req, resp);
	}

	private void getFilterDesc(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		List<ProductModels> listProduct = productService.filterProductDescByPrice();
		int pagesize = 10;
		int size = listProduct.size();
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
		List<ProductModels> list = productService.getListEmpByPage(listProduct, start, end);
		req.setAttribute("list", list);
		req.setAttribute("page", page);
		req.setAttribute("num", num);
		req.setAttribute("count", listProduct.size());
		
		List<CategoryModels> listCate = categoryService.findAllCategory();
		
		req.setAttribute("list", list);
		req.setAttribute("listC", listCate);

		
		req.getRequestDispatcher("/views/user/product/listproduct.jsp").forward(req, resp);

	}

//	private void doGet_Insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		List<CategoryModel> listCate = categoryService.findAllCategory();
//		req.setAttribute("listC", listCate);
//		req.getRequestDispatcher("/views/Product/insertProduct.jsp").forward(req, resp);
//		
//	}

	private void getDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int id = Integer.parseInt(req.getParameter("pid"));
		ProductModels product = productService.findOne(id);
		productService.deleteProduct(product);
		resp.sendRedirect(req.getContextPath() + "/product/listproduct");

	}

	private void doPost_Insert(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		ProductModels product = new ProductModels();

		try {

			BeanUtils.populate(product, req.getParameterMap());

			product.setCategory(categoryService.findOne(product.getCategoryId()));

			productService.insertProduct(product);

		} catch (Exception e) {
			// TODO: handle exception
		}

		resp.sendRedirect(req.getContextPath() + "/product/manager");
	}

	private void doPost_Update(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		ProductModels product = new ProductModels();

		try {

			BeanUtils.populate(product, req.getParameterMap());

			product.setCategory(categoryService.findOne(product.getCategoryId()));

			productService.updateProduct(product);

		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect(req.getContextPath() + "/product/manager");

	}

	// Chưa check
	private void getUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("pid"));
		ProductModels product = productService.findOne(id);

		List<CategoryModels> listcate = categoryService.findAllCategory();

		req.setAttribute("P", product);
		req.setAttribute("listC", listcate);
		req.getRequestDispatcher("/views/Product/updateproduct.jsp").forward(req, resp);
	}

	private void getListProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    List<ProductModels> listProduct = productService.findAllProduct();
	    int pagesize = 10;
	    int size = listProduct.size();
	    int num = (size % pagesize == 0 ? (size / pagesize) : (size / pagesize + 1));
	    int page, numberpage = pagesize;
	    String xpage = req.getParameter("page");
	    if (xpage == null || xpage.isEmpty()) { // Kiểm tra xem xpage có null hoặc rỗng không
	        page = 1;
	    } else {
	        try {
	            page = Integer.parseInt(xpage);
	        } catch (NumberFormatException e) {
	            // Xử lý ngoại lệ nếu giá trị của xpage không phải là một số nguyên hợp lệ
	            page = 1; // Trở về trang đầu tiên mặc định
	        }
	    }
	    int start = (page - 1) * numberpage;
	    int end = Math.min(page * numberpage, size);
	    try {
	        List<ProductModels> list = productService.getListEmpByPage(listProduct, start, end);
	        req.setAttribute("list", list);
	        req.setAttribute("page", page);
	        req.setAttribute("num", num);
	        req.setAttribute("count", listProduct.size());

	        List<CategoryModels> listCate = categoryService.findAllCategory();

	        req.setAttribute("listC", listCate); // Thay đổi tên biến để tránh trùng lặp
	    } catch (Exception ex) {
	        System.err.println("Error finding: " + ex.getMessage());
	    }

	    req.getRequestDispatcher("/views/user/product/listproduct.jsp").forward(req, resp);
	}
	
	private void postReview(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		int id = (int) session.getAttribute("productID");
		ProductModels product = productService.findOne(id);
		CustomerModels customer = (CustomerModels) session.getAttribute("customer");
		String test = req.getParameter("review");
		String t = req.getParameter("rating");
		System.out.println("Review: " + test);
		System.out.println("Rating: " + t);
		try {
		    RatingModels rating = ratingService.findOne(customer.getCustomerId(), product.getProductId());
		    if(rating != null) {
				BeanUtils.populate(rating, req.getParameterMap());
				ratingService.update(rating);
				ratingService.delete(id);
			} else {
				rating = new RatingModels();
				BeanUtils.populate(rating, req.getParameterMap());
				rating.setCustomerId(customer.getCustomerId());
				rating.setProductId(product.getProductId());
				ratingService.insert(rating);
			}
		} catch (Exception ex) {
		    // Log the exception for debugging purposes (optional)
		    // Don't print the exception details in the response
		    System.err.println("Error finding rating: " + ex.getMessage());
		    // Set a generic error message for the user
		    req.setAttribute("errorMessage", "An error occurred while processing your review.");
		}

		req.setAttribute("p", product);
		
		session = req.getSession(true);
		session.setAttribute("productID", product.getProductId());
		req.getRequestDispatcher("/views/user/product/detailproduct.jsp").forward(req, resp);
	}
	
	private void getDeleteRating(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int pid = Integer.parseInt(req.getParameter("pid"));
		ProductModels product = productService.findOne(pid);
		HttpSession session = req.getSession();
		CustomerModels customer = (CustomerModels) session.getAttribute("customer");
		
		RatingModels rating = ratingService.findOne(customer.getCustomerId(), pid);
		List<CategoryModels> listcate = categoryService.findAllCategory();
		
		ratingService.delete(rating.getRatingId());
		req.setAttribute("p", product);
		
		session = req.getSession(true);
		session.setAttribute("productID", product.getProductId());
		req.getRequestDispatcher("/views/user/product/detailproduct.jsp").forward(req, resp);
	}

}
