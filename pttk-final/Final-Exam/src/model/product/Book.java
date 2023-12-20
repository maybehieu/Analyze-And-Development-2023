package model.product;

import model.employee.Employee;

public class Book extends Product {
	private int ID;
	private String author;
	private String bookCategory;
	private int pageNum;
	private int volume;
	public Book(int iD, String name, String summary, String releaseDate, String category, Employee employee,
			Provider provider, int iD2, String author, String bookCategory, int pageNum, int volume) {
		super(iD, name, summary, releaseDate, category, employee, provider);
		this.ID = iD;
		this.author = author;
		this.bookCategory = bookCategory;
		this.pageNum = pageNum;
		this.volume = volume;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String category) {
		this.bookCategory = category;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	
	
}
