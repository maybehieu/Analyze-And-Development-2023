package controller.productDAO;

import java.util.List;

import model.product.ProductItem;

public interface ProductItemDAO {
	public void addProductItem(ProductItem prod);
	
	public boolean delProductItem(int id);
	
	public void substractProductItem(int id, int number);
	
	public void editProductItem(int id, float price, float discount, int inStock);
	
	public List<ProductItem> getAllBookItems();
	
	public List<ProductItem> getAllPhoneItems();
	
	public List<ProductItem> getAllClotheItems();
	
	public ProductItem getProductItem(int ID);
}
