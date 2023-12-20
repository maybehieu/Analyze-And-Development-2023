package model.product;

import model.employee.Employee;

public class ProductItem {
	private int ID;
	private Product product;
	private Employee employee;
	private float price;
	private String addedDate;
	private int inStock;
	private float discount;
	public ProductItem(int iD, Product product, Employee employee, float price, String addedDate, int inStock, float discount) {
		super();
		ID = iD;
		this.product = product;
		this.employee = employee;
		this.price = price;
		this.addedDate = addedDate;
		this.inStock = inStock;
		this.discount = discount;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getAddedDate() {
		return addedDate;
	}
	public void setAddedDate(String addedDate) {
		this.addedDate = addedDate;
	}
	public int getInStock() {
		return inStock;
	}
	public void setInStock(int inStock) {
		this.inStock = inStock;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	
	
}
