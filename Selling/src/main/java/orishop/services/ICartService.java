package orishop.services;

import orishop.models.CartModels;

public interface ICartService {
	CartModels findCartByCustomerID(int customerID);
	CartModels findCartByCartID(int cartID);
	public float totalPriceCart(int cartID);

}
