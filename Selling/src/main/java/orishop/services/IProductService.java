package orishop.services;

import java.util.ArrayList;
import java.util.List;

import orishop.models.EmployeeModels;
import orishop.models.ProductModels;

public interface IProductService {
List<ProductModels> findAllProduct();
	
	List<ProductModels> findByCategory(int cid);
	
	List<ProductModels> findProduct(String productName);
	
	List<ProductModels> filterProductDescByPrice();
	
	List<ProductModels> filterProductAscByPrice();
	
	List<ProductModels> findTopProduct(int amount);
	
	List<ProductModels> findTopSaleProduct(int amount);
	
	List<ProductModels> getListProductByPage(List<ProductModels> listPro, int start, int end);
	
	void insertProduct(ProductModels product);
	//void addProduct(ProductModels model);
		
	ProductModels findLast();
	
	void updateProduct(ProductModels product);
	
	void deleteProduct(ProductModels product);

	ProductModels findOne(String parameter);

	ProductModels findOne(int productId);
	
	int countReview(int productId);
	
	float getRatingScore(int productId);
	
	public List<ProductModels> getListEmpByPage(List<ProductModels> listEmp, int start, int end);

}
