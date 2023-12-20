
public class tester {
	private static final String INSERT_NEW_BITEM = "insert into productitem " + "(employeeID, price, discount, addedDate, inStock, productID) values "+" (?, ?, ?, ?, ?, ?);";
	 private static final String UPDATE_BITEM_BY_ID = "UPDATE productitem SET price = ?, discount = ? inStock= ? WHERE ID = ?;";
}