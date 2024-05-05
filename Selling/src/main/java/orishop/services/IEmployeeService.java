package orishop.services;

import java.util.List;

import orishop.models.*;

public interface IEmployeeService {
	List<EmployeeModels> findAll();
	List<EmployeeModels> findAllShipper();
	List<EmployeeModels> findAllSeller();
	
	List<EmployeeModels> getListEmpByPage(List<EmployeeModels> listEmp, int start, int end);
	
	boolean updateShipper(EmployeeModels shipper);
	boolean updateSeller(EmployeeModels seller);
	
	boolean deleteShipper(int id);
	boolean deleteSeller(int id);
	
	EmployeeModels findShipper(int id);
	List<EmployeeModels> findShipper(String name);
	EmployeeModels findShipperByAccountID(int id);
	
	EmployeeModels findSeller(int id);
	void updateEmployee(EmployeeModels employee);
	List<EmployeeModels> findSellerBySellerName(String sellerName);
}
