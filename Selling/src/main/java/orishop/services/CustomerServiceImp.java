package orishop.services;

import java.util.ArrayList;
import java.util.List;

import orishop.DAO.*;
import orishop.models.*;

public class CustomerServiceImp implements ICustomerService{
	ICustomerDAO cusDAO = new CustomerDAOImp();
	public List<CustomerModels> findAll() {
		return cusDAO.findAll();
	}

	@Override
	public List<CustomerModels> getListCustomerByPage(List<CustomerModels> listCus, int start, int end){
		List<CustomerModels> listCusPage = new ArrayList<>();
		
		for (int i = start; i < end; i++) {
			listCusPage.add(listCus.get(i));
		}
		return listCusPage;
	}
	
	public CustomerModels findOne(int id) {
		return cusDAO.findOne(id);
	}
	/*	Thiên Thanh
	@Override
	public CustomerModels findCustomerByCustomerID (int id){
		return cusDAO.findCustomerByCustomerID(id);
	}
	*/
	@Override
	public CustomerModels findCustomerByAccountID(int accountId) {
		return cusDAO.findCustomerByAccountID(accountId);
	}

	@Override
	public void editInfor(CustomerModels model) {
		CustomerModels customer = cusDAO.findOne(model.getCustomerId());
		customer.setCustomerName(model.getCustomerName());
		customer.setBirthday(model.getBirthday());
		customer.setGender(model.getGender());
		customer.setAddress(model.getAddress());
		customer.setPhone(model.getPhone());
		customer.setMail(model.getMail());
		customer.setRank(model.getRank());
		customer.setReputation(model.getReputation());
		customer.setRewardPoints(model.getRewardPoints());
		customer.setAccountId(model.getAccountId());

		cusDAO.editInfor(customer);
	}
	
	@Override
	public List<CustomerModels> findCustomerByCustomerName (String customerName){
		return cusDAO.findCustomerByCustomerName(customerName);
	}

	@Override
	public boolean delete(int id) {
		if (findOne(id)!=null) {
			return cusDAO.delete(id);
		}
		return false;
	}
}
