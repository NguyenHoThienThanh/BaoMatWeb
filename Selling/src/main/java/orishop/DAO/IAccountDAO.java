package orishop.DAO;

import java.util.List;

import orishop.models.AccountModels;

public interface IAccountDAO {
	//dinh nghia cac Phuong thuc
	List<AccountModels> findAll();
	AccountModels findOne(int id);
	AccountModels findOne(String username);
	void insert(AccountModels model);
	void insertregister(AccountModels model);
	void update(AccountModels model);
	void updatestatus(AccountModels model);
	
	void delete(int id);
	boolean checkExistUsername(String username);
	boolean checkExistEmail(String email);
}
