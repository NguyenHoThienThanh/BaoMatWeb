package orishop.services;


import orishop.DAO.ICartDAO;
import orishop.DAO.CartDAOImpl;
import orishop.models.CartModels;

public class CartServiceImpl implements ICartService{
	ICartDAO cartDAO = new CartDAOImpl();
	
	@Override
	public CartModels findCartByCartID(int cartID) {
		return cartDAO.findCartByCartID(cartID);
	}

	@Override
	public CartModels findCartByCustomerID(int customerID) {
		return cartDAO.findCartByCustomerID(customerID);
	}

	@Override
	public float totalPriceCart(int cartID) {
		return cartDAO.totalPriceCart(cartID);
	}
}
