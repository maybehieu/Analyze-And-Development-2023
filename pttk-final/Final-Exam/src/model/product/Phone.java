package model.product;

import model.employee.Employee;

public class Phone extends Product{
	private int ID;
	private String type;
	private String brand;
	private String model;
	private String spec;
	public Phone(int iD, String name, String summary, String releaseDate, String category, Employee employee,
			Provider provider, int iD2, String type, String brand, String model, String spec) {
		super(iD, name, summary, releaseDate, category, employee, provider);
		this.ID = iD2;
		this.type = type;
		this.brand = brand;
		this.model = model;
		this.spec = spec;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	
	
}
