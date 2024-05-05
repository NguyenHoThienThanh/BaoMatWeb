package orishop.DAO;

import java.util.List;
import orishop.models.CartItemModels;

public interface ICartItemDAO {
	public CartItemModels findCartItemByProductID(int cartID, int productID);
	List<CartItemModels> findCartItemByCartID(int cartID);
	void insertCartItem(CartItemModels model);
	void deleteCartItem(int cartID, int productID);
	void updateCartItem(CartItemModels model);
	public int countCartItem(int cartID);
	public void deleteAllCartItem(int cartID) ;
	
}
