package model.order;

public class InternetBanking extends Payment {

	private int ID;
	private String accountNumber;
	private String token;

	public InternetBanking(int iD, float fees, String names, int iD2, String accountNumber, String token) {
		super(iD, fees, names);
		ID = iD2;
		this.accountNumber = accountNumber;
		this.token = token;
	}

	public int getID() {
		return this.ID;
	}

	/**
	 * 
	 * @param ID
	 */
	public void setID(int ID) {
		this.ID = ID;
	}

	public String getAccountNumber() {
		return this.accountNumber;
	}

	/**
	 * 
	 * @param accountNumber
	 */
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String gettoken() {
		return this.token;
	}

	/**
	 * 
	 * @param token
	 */
	public void settoken(String token) {
		this.token = token;
	}

}