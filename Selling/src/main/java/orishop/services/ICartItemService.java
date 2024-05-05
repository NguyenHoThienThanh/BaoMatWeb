package orishop.services;

import java.util.List;

import orishop.models.CartItemModels;

public interface ICartItemService {
	public CartItemModels findCartItemByProductID(int cartID, int productID);
	List<CartItemModels> findCartItemByCartID(int cartId);
	List<CartItemModels> getCartItemByPage(List<CartItemModels> listCartItem, int start, int end);
	void insertCartItem(CartItemModels model);
	void deleteCartItem(int cartID, int productID);
	void updateCartItem(CartItemModels model);
	public int countCartItem(int cartID);
	public void deleteAllCartItem(int cartID);

}
