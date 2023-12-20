package model.product;

import model.employee.Employee;

public class Clothes extends Product {
	private int ID;
	private String type;
	private String brand;
	private String color;
	private String gender;
	public Clothes(int iD, String name, String summary, String releaseDate, String category, Employee employee,
			Provider provider, int iD2, String type, String brand, String color, String gender) {
		super(iD, name, summary, releaseDate, category, employee, provider);
		ID = iD;
		this.type = type;
		this.brand = brand;
		this.color = color;
		this.gender = gender;
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
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
}
