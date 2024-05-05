package orishop.services;

import java.util.ArrayList;
import java.util.List;

import orishop.DAO.*;
import orishop.models.*;

public class EmployeeServiceImp implements IEmployeeService{
	IEmployeeDAO empDAO = new EmployeeDAOImp();
	public List<EmployeeModels> findAll() {
		return empDAO.findAll();
	}
	@Override
	public List<EmployeeModels> findAllShipper() {
		return empDAO.findAllShipper();
	}
	@Override
	public List<EmployeeModels> findAllSeller() {
		return empDAO.findAllSeller();
	}
	@Override
	public List<EmployeeModels> getListEmpByPage(List<EmployeeModels> listEmp, int start, int end) {
		List<EmployeeModels> listEmpPage = new ArrayList<>();
		
		for (int i = start; i < end; i++) {
			listEmpPage.add(listEmp.get(i));
		}
		return listEmpPage;
	}
	@Override
	public EmployeeModels findShipper(int id) {
		return empDAO.findShipper(id);
	}
	@Override
	public List<EmployeeModels> findShipper(String name) {
		return empDAO.findShipper(name);
	}
	@Override
	public List<EmployeeModels> findSellerBySellerName(String sellerName){
		return empDAO.findSellerBySellerName(sellerName);
	}
	@Override
	public EmployeeModels findSeller(int id) {
		return empDAO.findSeller(id);
	}
	@Override
	public void updateEmployee(EmployeeModels employee) {
		empDAO.updateEmployee(employee);
	}
	@Override
	public EmployeeModels findShipperByAccountID(int id) {
		return empDAO.findShipperByAccountID(id);
	}
	@Override
	public boolean updateShipper(EmployeeModels shipper) {
		if (shipper.getJob().contains("Shipper")) {
			return empDAO.update(shipper);
		} else {
			return false;
		}
	}
	@Override
	public boolean updateSeller(EmployeeModels seller) {
		if (seller.getJob().contains("Seller")) {
			return empDAO.update(seller);
		} else {
			return false;
		}
	}
	@Override
	public boolean deleteShipper(int id) {
		if (findShipper(id)!=null) {
			return empDAO.delete(id);
		} else {
			return false;
		}
	}
	@Override
	public boolean deleteSeller(int id) {
		if (findSeller(id)!=null) {
			return empDAO.delete(id);
		} else {
			return false;
		}
	}
	
}
