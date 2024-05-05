package orishop.services;

import java.util.List;

import orishop.models.AccountModels;

public interface IAccountService {
	
	List<AccountModels> findAll();
	AccountModels findOne(int id);
	AccountModels findOne(String username);
	void insert(AccountModels model);
	void insertregister(AccountModels model);
	void update(AccountModels model);
	void updatestatus(AccountModels model);
	
	boolean register(String username, String password, String mail, String code);
	AccountModels login(String username, String password);
	
	void delete(int id);
	boolean checkExistUsername(String username);
	boolean checkExistEmail(String email);
}
