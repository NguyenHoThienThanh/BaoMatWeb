package orishop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import orishop.models.*;

public class CustomerDAOImp implements ICustomerDAO{
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public List<CustomerModels> findAll() {
		List<CustomerModels> listCus = new ArrayList<CustomerModels>();
		String sql = "SELECT * FROM Customer";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				CustomerModels customer = new CustomerModels();
                customer.setCustomerId(rs.getInt("customerId"));
                customer.setCustomerName(rs.getString("customerName"));
                customer.setBirthday(rs.getDate("birthday"));
                customer.setGender(rs.getString("gender"));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getLong("phone"));
                customer.setMail(rs.getString("mail"));
                customer.setRank(rs.getString("rank"));
                customer.setReputation(rs.getInt("reputation"));
                customer.setRewardPoints(rs.getInt("rewardPoints"));
                customer.setAccountId(rs.getInt("accountId"));

                // Thêm đối tượng Employee vào danh sách
                listCus.add(customer);
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return listCus;
	}
	
	public CustomerModels findOne(int id) {
		CustomerModels customer = new CustomerModels();
		String sql = "SELECT * FROM Customer where customerId=?";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			rs.next();
	        customer.setCustomerId(rs.getInt("customerId"));
	        customer.setCustomerName(rs.getString("customerName"));
	        customer.setBirthday(rs.getDate("birthday"));
	        customer.setGender(rs.getString("gender"));
	        customer.setAddress(rs.getString("address"));
	        customer.setPhone(rs.getLong("phone"));
	        customer.setMail(rs.getString("mail"));
	        customer.setRank(rs.getString("rank"));
	        customer.setReputation(rs.getInt("reputation"));
	        customer.setRewardPoints(rs.getInt("rewardPoints"));
            customer.setAccountId(rs.getInt("accountId"));
		}catch (Exception e){
			e.printStackTrace();
		}
		return customer;
	}
	
	/*
	@Override
	public CustomerModels findCustomerByCustomerID(int id) {
		String sql = "SELECT * FROM CUSTOMER WHERE customerId = ?";
		CustomerModels customer = new CustomerModels();
		try {
			new DBConnectionSQLServer();
			conn = DBConnectionSQLServer.getConnectionW();
			ps=conn.prepareStatement(sql);
			ps.setInt(1,id);
			rs=ps.executeQuery();
			while (rs.next()) {
				customer.setCustomerId(rs.getInt("customerId"));
				customer.setCustomerName(rs.getString("customerName"));
				customer.setBirthday(rs.getDate("birthday"));
				customer.setGender(rs.getString("gender"));
				customer.setAddress(rs.getString("address"));
				customer.setPhone(rs.getLong("phone"));
				customer.setMail(rs.getString("mail"));
				customer.setRank(rs.getString("rank"));
				customer.setReputation(rs.getInt("reputation"));
				customer.setRewardPoints(rs.getInt("rewardPoints"));
				customer.setAccountId(rs.getInt("accountId"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return customer;
	}
	*/
	@Override
	public List<CustomerModels> findCustomerByCustomerName(String customerName) {
	    String sql = "SELECT * FROM CUSTOMER WHERE customerName LIKE N'%" + customerName + "'";
	    List<CustomerModels> listcustomer = new ArrayList<CustomerModels>();
	    try {
	        new DBConnectionSQLServer();
	        Connection conn = DBConnectionSQLServer.getConnectionW();
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	        	CustomerModels customer = new CustomerModels();
	        	customer.setCustomerId(rs.getInt("customerId"));
				customer.setCustomerName(rs.getString("customerName"));
				customer.setBirthday(rs.getDate("birthday"));
				customer.setGender(rs.getString("gender"));
				customer.setAddress(rs.getString("address"));
				customer.setPhone(rs.getLong("phone"));
				customer.setMail(rs.getString("mail"));
				customer.setRank(rs.getString("rank"));
				customer.setReputation(rs.getInt("reputation"));
				customer.setRewardPoints(rs.getInt("rewardPoints"));
				customer.setAccountId(rs.getInt("accountId"));
				listcustomer.add(customer);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return listcustomer;
	}
	
	public CustomerModels findCustomerByAccountID(int accountId) {
		CustomerModels customer = new CustomerModels();
		String sql = "SELECT * FROM Customer where accountId=?";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, accountId);
			rs = ps.executeQuery();
			rs.next();
	        customer.setCustomerId(rs.getInt("customerId"));
	        customer.setCustomerName(rs.getString("customerName"));
	        customer.setBirthday(rs.getDate("birthday"));
	        customer.setGender(rs.getString("gender"));
	        customer.setAddress(rs.getString("address"));
	        customer.setPhone(rs.getLong("phone"));
	        customer.setMail(rs.getString("mail"));
	        customer.setRank(rs.getString("rank"));
	        customer.setReputation(rs.getInt("reputation"));
	        customer.setRewardPoints(rs.getInt("rewardPoints"));
            customer.setAccountId(rs.getInt("accountId"));
		}catch (Exception e){
			e.printStackTrace();
		}
		return customer;
	}
	
	
	@Override
	public void editInfor(CustomerModels model) {
			String sql = "update CUSTOMER set CustomerName = ?, Birthday = ?, Gender = ?, Address = ?, Phone = ?,"
					+ " Mail = ?, Rank = ?, Reputation = ?, RewardPoints = ?, AccountID = ? where CustomerID = ?";
			try {
				new DBConnectionSQLServer();
				conn = DBConnectionSQLServer.getConnectionW();
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, model.getCustomerName());
				ps.setDate(2, model.getBirthday());
				ps.setString(3, model.getGender());
				ps.setString(4, model.getAddress());
				ps.setLong(5, model.getPhone());
				ps.setString(6, model.getMail());
				ps.setString(7, model.getRank());
				ps.setInt(8, model.getReputation());
				ps.setInt(9, model.getRewardPoints());
				ps.setInt(10, model.getAccountId());
				ps.setInt(11, model.getCustomerId());

				ps.executeUpdate();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}

	@Override
	public boolean delete(int id) {
		String sql = "delete CUSTOMER where customerId=?";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
		return true;
	}
}
