package model.customer;

public class Customer {

	private int ID;
	private String accountNum;
	private String gender;
	private String birth;
	private Account account;
	private Fullname fullname;
	private Phone phone;
	private Address address;
	
	public Customer(int iD, String accountNum, String gender, String birth, Account account, Fullname fullname,
			Phone phone, Address address) {
		super();
		this.ID = iD;
		this.accountNum = accountNum;
		this.gender = gender;
		this.birth = birth;
		this.account = account;
		this.fullname = fullname;
		this.phone = phone;
		this.address = address;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		this.ID = iD;
	}
	public String getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public Fullname getFullname() {
		return fullname;
	}
	public void setFullname(Fullname fullname) {
		this.fullname = fullname;
	}
	public Phone getPhone() {
		return phone;
	}
	public void setPhone(Phone phone) {
		this.phone = phone;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	
}