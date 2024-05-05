package orishop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import orishop.models.AccountModels;
import orishop.util.Constant;
import orishop.util.PasswordEncryption;

public class AccountDAOImpl implements IAccountDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public List<AccountModels> findAll() {
		// xử lí dữ liệu hiển thị tất cả phong ban

		List<AccountModels> list = new ArrayList<AccountModels>();
		String sql = "Select * from ACCOUNT";
		try {
			// ket noi du lieu
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				AccountModels account = new AccountModels();
				account.setAccountID(rs.getInt("accountID"));
				account.setUsername(rs.getString("username"));
				account.setPassword(rs.getString("password"));
				account.setMail(rs.getString("mail"));
				account.setRoleID(rs.getInt("roleID"));
				account.setStatus(rs.getInt("status"));
				account.setCode(rs.getString("code"));
				
				list.add(account);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public AccountModels findOne(int id) {

		String sql = "select * from Account where accountId=?";
		AccountModels account = new AccountModels();
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				account.setAccountID(rs.getInt("accountID"));
				account.setUsername(rs.getString("username"));
				account.setPassword(rs.getString("password"));
				account.setMail(rs.getString("mail"));
				account.setRoleID(rs.getInt("roleID"));
				account.setStatus(rs.getInt("status"));
				account.setCode(rs.getString("code"));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return account;
	}

	@Override
	public AccountModels findOne(String username) {

		String sql = "select * from Account where username=?";
		AccountModels account = new AccountModels();
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				account.setAccountID(rs.getInt("accountID"));
				account.setUsername(rs.getString("username"));
				account.setPassword(rs.getString("password"));
				account.setMail(rs.getString("mail"));
				account.setRoleID(rs.getInt("roleID"));
				account.setStatus(rs.getInt("status"));
				account.setCode(rs.getString("code"));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return account;
	}
	

	@Override
	public void insertregister(AccountModels model) {
		String sql = "Insert into Account (mail, username, password, status, roleID, code) values (?,?,?,?,?,?)";
       
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setString(1, model.getMail());
			ps.setString(2, model.getUsername());
			String password = PasswordEncryption.encrypt(model.getPassword(), Constant.SECRETKEY, Constant.SALT);
			ps.setString(3, password);
			ps.setInt(4, model.getStatus());
			ps.setInt(5, model.getRoleID());
			ps.setString(6, model.getCode());

			ps.executeUpdate();

			conn.close();

		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(AccountModels model) {
		String sql = "update Account set username = ? where accountId = ?";
		try {
	
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
		
			ps.setString(1, model.getUsername());
			ps.setInt(2, model.getAccountID());
			ps.executeUpdate();

			conn.close();

		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void insert(AccountModels model) {
		String sql = "Insert into Account (accountId,username) values (?,?)";

		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, model.getAccountID());
			ps.setString(2, model.getUsername());

			ps.executeUpdate();

			conn.close();

		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void delete(int id) {
		String sql = "delete from Account where accountId = ?";
		try {

			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);

			ps.setInt(1, id);

			ps.executeUpdate();

			conn.close();

		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updatestatus(AccountModels model) {
		String sql = "UPDATE [Account] Set status=?, code=? where mail=?";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, model.getStatus());
			ps.setString(2, model.getCode());
			ps.setString(3, model.getMail());
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean checkExistEmail(String mail) {
		boolean duplicate = false;
		String sql = "Select * from Account where mail=?";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setString(1, mail);
			rs = ps.executeQuery();
			if (rs.next()) {
				duplicate = true;
			}
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return duplicate;
	}

	@Override
	public boolean checkExistUsername(String username) {
		boolean duplicate = false;
		String sql = "Select * from Account where username=?";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				duplicate = true;
			}
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return duplicate;
	}


	public static void main(String[] args) {
		IAccountDAO accountDAO = new AccountDAOImpl();
		//AccountModels list1 = accountDAO.findOne(0);
		//AccountModels list1 = accountDAO.findOne("vietphap1");
		//boolean list1 = accountDAO.checkExistUsername("vietphap1");
		boolean list1 = accountDAO.checkExistEmail("vietphap@gmail.com");
		//UserModel model = new UserModel("a","abcde","a","a", 1 ,1,"123456");userDAO.updatestatus(model);
		//userDAO.delete(10);
		//System.out.println(list1.getFullname());
		System.out.println(list1);
	}
}