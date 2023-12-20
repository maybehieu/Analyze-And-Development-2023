package model.product;

import model.employee.Employee;

public class Product {
	private int ID;
	private String name;
	private String summary;
	private String releaseDate;
	private String category;
	private Employee employee;
	private Provider provider;
	public Product(int iD, String name, String summary, String releaseDate, String category, Employee employee,
			Provider provider) {
		super();
		ID = iD;
		this.name = name;
		this.summary = summary;
		this.releaseDate = releaseDate;
		this.category = category;
		this.employee = employee;
		this.provider = provider;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Provider getProvider() {
		return provider;
	}
	public void setProvider(Provider provider) {
		this.provider = provider;
	}
	
	
}
