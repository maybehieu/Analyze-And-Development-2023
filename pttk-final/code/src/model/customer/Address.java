package model.customer;

public class Address {

	private int ID;
	private String number;
	private String street;
	private String district;
	private String city;
	
	public Address(int iD, String number, String street, String district, String city) {
		super();
		this.ID = iD;
		this.number = number;
		this.street = street;
		this.district = district;
		this.city = city;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		this.ID = iD;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}

	
}