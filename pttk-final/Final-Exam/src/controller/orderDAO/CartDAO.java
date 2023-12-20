package controller.orderDAO;

import java.util.HashMap;

import model.order.Cart;
import model.product.ProductItem;

public interface CartDAO {

	public void createCart(Cart cart);
	
	public Cart getCart(int customerID);

	public void editCart(Cart cart, float price, int quantity);

	/**
	 * 
	 * @param bookitem
	 */
	public void addProductItem(Cart cart, ProductItem product, int quantity);
	
	public void updateProductItem(Cart cart, ProductItem product, int increase);
	
	public int checkProductItem(Cart cart, ProductItem produc);
	
	public HashMap<Integer, Integer> getProductItemIDList(int cartID);
	
	

}