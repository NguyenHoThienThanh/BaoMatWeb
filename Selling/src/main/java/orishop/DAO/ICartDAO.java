package orishop.DAO;

import orishop.models.CartModels;

public interface ICartDAO {
	CartModels findCartByCartID(int customerID);
	CartModels findCartByCustomerID(int cartID);
	public float totalPriceCart(int cartID);

}
