package orishop.services;

import java.util.ArrayList;
import java.util.List;

import orishop.DAO.ICartItemDAO;
import orishop.DAO.CartItemDAOImpl;
import orishop.models.CartItemModels;
import orishop.models.CustomerModels;

public class CartItemServiceImpl implements ICartItemService{

	ICartItemDAO cartItemDao = new CartItemDAOImpl();
	
	@Override
	public CartItemModels findCartItemByProductID(int cartID, int productID) {
		return cartItemDao.findCartItemByProductID(cartID, productID);
	}

	@Override
	public List<CartItemModels> findCartItemByCartID(int cartID) {
		return cartItemDao.findCartItemByCartID(cartID);
	}
	
	@Override
	public List<CartItemModels> getCartItemByPage(List<CartItemModels> listCartItem, int start, int end){
		List<CartItemModels> listCartItemPage = new ArrayList<>();
		
		for (int i = start; i < end; i++) {
			listCartItemPage.add(listCartItem.get(i));
		}
		return listCartItemPage;
	}
	

	@Override
	public void insertCartItem(CartItemModels model) {
		cartItemDao.insertCartItem(model);
	}

	@Override
	public void deleteCartItem(int cartID, int productID) {
		cartItemDao.deleteCartItem(cartID, productID);
	}

	@Override
	public void updateCartItem(CartItemModels model) {
		CartItemModels newCartItem = cartItemDao.findCartItemByProductID(model.getCartID(), model.getProductID());
		newCartItem.setCartID(model.getCartID());
		newCartItem.setProductID(model.getProductID());
		newCartItem.setCount(model.getCount());
		newCartItem.setQuantity(model.getQuantity());
		newCartItem.setProduct(model.getProduct());
		newCartItem.setTotalPrice(model.getTotalPrice());

		cartItemDao.updateCartItem(newCartItem);
	}

	@Override
	public int countCartItem(int cartID) {
		return cartItemDao.countCartItem(cartID);
	}

	@Override
	public void deleteAllCartItem(int cartID) {
		cartItemDao.deleteAllCartItem(cartID);
	}

}
