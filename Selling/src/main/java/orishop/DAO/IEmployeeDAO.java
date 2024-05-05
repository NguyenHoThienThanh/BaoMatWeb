package orishop.DAO;

import java.util.List;

import orishop.models.*;

public interface IEmployeeDAO {
	List<EmployeeModels> findAll();
	List<EmployeeModels> findAllShipper();
	List<EmployeeModels> findAllSeller();
	EmployeeModels findShipper(int id);
	List<EmployeeModels> findShipper(String name);
	EmployeeModels findShipperByAccountID(int id);
	boolean update(EmployeeModels employee);
	boolean delete(int employeeId);
	EmployeeModels findSeller(int id);
	void updateEmployee(EmployeeModels employee);
	List<EmployeeModels> findSellerBySellerName(String sellerName);
}
