package controller.productDAO;

import java.util.List;

import model.product.Book;
import model.product.Clothes;
import model.product.Phone;

public interface ProductDAO {
	public void addProductBook(Book book);
	
	public void addProductPhone(Phone phone);
	
	public void addProductClothes(Clothes clothes);
	
	public boolean delProduct(int id);
	
	public List<Book> findAllBooks();
	
	public List<Phone> findAllPhones();
	
	public List<Clothes> findAllClothes();
	
	public void editBook(Book book);
	
	public void editPhone(Phone phone);
	
	public void editClothes(Clothes clothes);
	
	public int getMaxIDBook();
	
	public int getMaxIDPhone();
	
	public int getMaxIDClothes();
}
