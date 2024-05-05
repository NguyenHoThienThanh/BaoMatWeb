package orishop.services;
import java.util.List;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import orishop.DAO.IAccountDAO;
import orishop.DAO.AccountDAOImpl;
import orishop.models.AccountModels;
import orishop.util.Constant;
import orishop.util.PasswordEncryption;

public class AccountServiceImpl implements IAccountService{
	IAccountDAO userDAO = new AccountDAOImpl();
	
	
	@Override
	public List<AccountModels> findAll() {
		return userDAO.findAll();
	}

	@Override
	public AccountModels findOne(int id) {
		return userDAO.findOne(id);
	}

	
	@Override
	public AccountModels findOne(String username) {
		return userDAO.findOne(username);
	}
	
	@Override
	public void insert(AccountModels model) {
		userDAO.insert(model);
	}

	@Override
	public void insertregister(AccountModels model) {
		userDAO.insertregister(model);
	}

	@Override
	public void update(AccountModels model) {
		AccountModels oldUser = userDAO.findOne(model.getAccountID());
		oldUser.setMail(model.getMail());
		oldUser.setUsername(model.getUsername());
		oldUser.setPassword(model.getPassword());
		oldUser.setRoleID(model.getRoleID());
		oldUser.setStatus(model.getStatus());
		oldUser.setCode(model.getCode());

		userDAO.update(oldUser);
	}

	@Override
	public void updatestatus(AccountModels model) {
		userDAO.updatestatus(model);
	}

	@Override
	public boolean register(String username, String password, String mail, String code) {
		if (userDAO.checkExistEmail(mail))
			return false;
		if (userDAO.checkExistUsername(username))
			return false;
		userDAO.insertregister(new AccountModels(username,password, mail, 1, 0, code));
		return true;
	}


	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

//	@Override
//	public AccountModels login(String username, String password) {
//	    // Tìm kiếm tài khoản trong cơ sở dữ liệu bằng username
//	    AccountModels user = this.findOne(username);
//	    if (user != null) {
//	        // Lấy mật khẩu đã hash từ cơ sở dữ liệu
//	        String storedPassword = user.getPassword().trim();
//	        
//	        // Mã hóa mật khẩu nhập vào trước khi so sánh
//	        String encodedPassword = encoder.encode(password);
//
//	        // So sánh mật khẩu đã hash từ cơ sở dữ liệu với mật khẩu đã mã hóa từ người dùng nhập vào
//	        if (encoder.matches(encodedPassword, storedPassword)) {
//	            // Mật khẩu hợp lệ, trả về tài khoản
//	            return user;
//	        }
//	    }
//	    // Mật khẩu không hợp lệ hoặc tài khoản không tồn tại, trả về null
//	    return null;
//	}
	
	@Override
	public AccountModels login(String username, String password) {
		AccountModels user = this.findOne(username);
		String passwordDecryption = PasswordEncryption.decrypt(user.getPassword(), Constant.SECRETKEY, Constant.SALT);
		if (user!=null && password.equals(user.getPassword())) {
			return user;
		} else if (user!=null && (passwordDecryption.equals(password))) {
			return user;
		} else
		return null;
	}

	

	@Override
	public boolean checkExistUsername(String username) {
		return userDAO.checkExistUsername(username);
	}

	@Override
	public boolean checkExistEmail(String mail) {
		return userDAO.checkExistEmail(mail);
	}

	@Override
	public void delete(int id) {
		userDAO.delete(id);
	}
}
