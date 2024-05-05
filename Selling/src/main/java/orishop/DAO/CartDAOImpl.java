package orishop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import orishop.models.CartModels;

public class CartDAOImpl implements ICartDAO {

	static ICartDAO cartDAO = new CartDAOImpl();
	static ICartItemDAO cartItemDAO = new CartItemDAOImpl();
	ICustomerDAO customerDAO= new CustomerDAOImp();
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	@Override
	public CartModels findCartByCustomerID(int customerID) {

		String sql = "select * from CART where customerId=?";
		CartModels cart = new CartModels();
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, customerID);
			rs = ps.executeQuery();
			while (rs.next()) {
				cart.setCartId(rs.getInt("cartId"));
				cart.setTotalPrice(rs.getFloat("cartId"));
				cart.setCustomerId(rs.getInt("customerId"));
				cart.setCustomer(customerDAO.findOne(customerID));

			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}
	
	@Override
	public CartModels findCartByCartID(int cartID) {

		String sql = "select * from CART where cartId=?";
		CartModels cart = new CartModels();
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cartID);
			rs = ps.executeQuery();
			while (rs.next()) {
				cart.setCartId(rs.getInt("cartId"));
				cart.setTotalPrice(rs.getFloat("cartId"));
				cart.setCustomerId(rs.getInt("customerId"));
				cart.setCustomer(customerDAO.findOne(rs.getInt("customerId")));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}

	@Override
	public float totalPriceCart(int cartID) {
		if (cartItemDAO.countCartItem(cartID)==0)
			return 0;
		CartModels model = cartDAO.findCartByCartID(cartID);
	
		String sql = "select cartId, sum(totalPrice) as totalPrice from Cart_Item group by cartId having cartId = ?";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cartID);
			rs = ps.executeQuery();
			while (rs.next()) {
				model.setTotalPrice(rs.getFloat("totalPrice"));
			}
			conn.close();

		} catch (

		Exception e) {
			e.printStackTrace();
		}
		if (model.getTotalPrice()==null) 
			return 0;
		else
			return model.getTotalPrice();
	}
	
	public static void main(String[] args) {
		//CartModels list1 = cartDAO.findCartByCustomerID(1);
		System.out.println(cartDAO.totalPriceCart(29));
	}
}
