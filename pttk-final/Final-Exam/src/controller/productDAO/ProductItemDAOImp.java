package controller.productDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.employee.Area;
import model.employee.Branch;
import model.employee.Employee;
import model.employee.SalaryGrade;
import model.employee.Timesheet;
import model.product.Book;
import model.product.Clothes;
import model.product.Product;
import model.product.ProductItem;
import model.product.Provider;
import model.user.Account;
import model.user.Address;
import model.user.Birth;
import model.user.Fullname;
import model.user.Phone;
import model.user.User;

public class ProductItemDAOImp implements ProductItemDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/pttk?allowPublicKeyRetrieval=true&useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "1234";

	private static final String INSERT_NEW_PITEM = "insert into productitem "
			+ "(employeeID, price, discount, addedDate, inStock, productID) values " + " (?, ?, ?, ?, ?, ?);";
	private static final String SELECT_ALL_BITEM_ID = "SELECT * FROM productitem WHERE productID IN (SELECT ID FROM product WHERE bookID is NOT NULL); ";
	private static final String SELECT_ALL_PITEM_ID = "SELECT * FROM productitem WHERE productID IN (SELECT ID FROM product WHERE phoneID is NOT NULL); ";
	private static final String SELECT_ALL_CITEM_ID = "SELECT * FROM productitem WHERE productID IN (SELECT ID FROM product WHERE clothesID is NOT NULL); ";
	private static final String UPDATE_PITEM_BY_ID = "UPDATE productitem SET price = ?, discount = ?, inStock= ? WHERE ID = ?;";
	private static final String SUBTRACT_PITEM_BY_ID = "UPDATE productitem SET inStock= ? WHERE ID = ?;";
	private static final String SELECT_PITEM_BY_ID = "select * from productitem where productID =?;";
	private static final String SELECT_PITEM_BY_ID2 = "select * from productitem where ID =?;";
	private static final String SELECT_NUM_BY_ID = "select inStock from productitem where ID = ?";
	private static final String DELETE_PITEM = "delete from productitem where id = ?;";
	private static final String INSERT_NEW_PVD = "insert into provider " + "(address, name) values" + " (?,?);";
	private static final String SELECT_MAX_ID_PVD = "SELECT MAX(id) FROM provider;";
	private static final String SELECT_PROD_BY_ID = "select * from product where ID =?;";
	private static final String UPDATE_PVD = "update provider set address=?, name=?, where ID=?;";
	private static final String SELECT_PVD_BY_ID = "select * from provider where id =?";
	private static final String SELECT_EMP_BY_ID = "select * from employee where id =?";
	private static final String SELECT_BRA_BY_ID = "select * from branch where id =?";
	private static final String SELECT_ARE_BY_ID = "select * from area where id =?";
	private static final String SELECT_TMS_BY_ID = "select * from timesheet where id =?";
	private static final String SELECT_GRD_BY_ID = "select * from salarygrade where id =?";
	private static final String SELECT_USR_BY_ID = "SELECT * from user where id = ?;";
	private static final String SELECT_ACC_BY_ID = "SELECT * from account where id = ?;";
	private static final String SELECT_ADD_BY_ID = "SELECT * from address where id = ?;";
	private static final String SELECT_NAME_BY_ID = "SELECT * from fullname where id = ?;";
	private static final String SELECT_BIRTH_BY_ID = "SELECT * from birth where id = ?;";
	private static final String SELECT_PHONE_BY_ID = "SELECT * from phone where id = ?;";
	private static final String SEARCH_PRODS = "SELECT ID FROM product WHERE name LIKE '%" + "?" + "%'";

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	public void addProvider(Provider provider) {
		// System.out.println(INSERT_ACC_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEW_PVD)) {
			preparedStatement.setString(1, provider.getAddress());
			preparedStatement.setString(2, provider.getName());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editProvider(Provider provider) {
		// System.out.println(INSERT_ACC_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PVD)) {
			preparedStatement.setString(1, provider.getAddress());
			preparedStatement.setString(2, provider.getName());
			preparedStatement.setInt(4, provider.getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Provider getProvider(int ID) {
		Provider pub = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PVD_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int iD = rs.getInt("ID");
				String address = rs.getString("address");
				String name = rs.getString("name");
				pub = new Provider(iD, address, name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pub;
	}

	public int getMaxIDPvd() {
		int id = 0;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MAX_ID_PVD)) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				id = rs.getInt("MAX(id)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	public Area getArea(int ID) {
		Area area = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ARE_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int iD = rs.getInt("ID");
				float square = rs.getFloat("square");
				String location = rs.getString("location");
				area = new Area(iD, square, location);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return area;
	}

	public Branch getBranch(int ID) {
		Branch bra = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BRA_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int iD = rs.getInt("ID");
				String name = rs.getString("name");
				int numWorkers = rs.getInt("numWorkers");
				String location = rs.getString("location");
				bra = new Branch(iD, name, numWorkers, location);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bra;
	}

	public Timesheet getTimesheet(int ID) {
		Timesheet tms = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TMS_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int iD = rs.getInt("ID");
				String date = rs.getString("date");
				String status = rs.getString("status");
				tms = new Timesheet(iD, date, status);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tms;
	}

	public SalaryGrade getSalaryGrade(int ID) {
		SalaryGrade slg = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_GRD_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String name = rs.getString("name");
				Float multiplier = rs.getFloat("multiplier");
				slg = new SalaryGrade(ID, name, multiplier);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return slg;
	}

	public Account getAccount(int ID) {
		Account acc = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACC_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String username = rs.getString("username");
				String password = rs.getString("password");
				acc = new Account(ID, username, password);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return acc;
	}

	public Address getAddress(int ID) {
		Address add = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADD_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String city = rs.getString("city");
				String district = rs.getString("district");
				String houseno = rs.getString("houseno");
				add = new Address(ID, city, district, houseno);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return add;
	}

	public Fullname getName(int ID) {
		Fullname fn = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NAME_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String firstname = rs.getString("firstname");
				String lastname = rs.getString("lastname");
				fn = new Fullname(ID, firstname, lastname);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fn;
	}

	public Birth getBirth(int ID) {
		Birth birth = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BIRTH_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String day = rs.getString("day");
				String month = rs.getString("month");
				String years = rs.getString("years");
				birth = new Birth(ID, day, month, years);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return birth;
	}

	public Phone getPhone(int ID) {
		Phone phone = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PHONE_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String phoneNum = rs.getString("phoneNum");
				String type = rs.getString("type");
				phone = new Phone(ID, phoneNum, type);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return phone;
	}

	public User getUser(int ID) {
		User user = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USR_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int accountID = rs.getInt("accountID");
				Account account = getAccount(accountID);
				int phoneID = rs.getInt("phoneID");
				Phone phone = getPhone(phoneID);
				int fullnameID = rs.getInt("fullnameID");
				Fullname fullname = getName(fullnameID);
				int birthID = rs.getInt("birthID");
				Birth birth = getBirth(birthID);
				int addressID = rs.getInt("addressID");
				Address address = getAddress(addressID);
				String gender = rs.getString("gender");
				user = new User(ID, gender, account, fullname, phone, birth, address);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public Employee getEmployee(int ID) {
		Employee emp = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMP_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				float salaries = rs.getFloat("salaries");
				String startedDate = rs.getString("startedDate");
				int areaID = rs.getInt("areaID");
				Area area = getArea(areaID);
				int branchID = rs.getInt("branchID");
				Branch branch = getBranch(branchID);
				int userID = rs.getInt("userID");
				User user = getUser(userID);
				int salaryGradeID = rs.getInt("salaryGradeID");
				SalaryGrade salaryGrade = getSalaryGrade(salaryGradeID);
				int timesheetID = rs.getInt("timesheetID");
				Timesheet timesheet = getTimesheet(timesheetID);
				emp = new Employee(ID, salaries, startedDate, user, area, branch, salaryGrade, timesheet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return emp;
	}

	public Product getProductByID(int ID) {
		Product product = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROD_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int employeeID = rs.getInt("employeeID");
				Employee employee = getEmployee(employeeID);
				int providerID = rs.getInt("providerID");
				Provider provider = getProvider(providerID);
				String name = rs.getString("name");
				String summary = rs.getString("summary");
				String category = rs.getString("category");
				String releaseDate = rs.getString("releaseDate");
				product = new Product(ID, name, summary, releaseDate, category, employee, provider);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}

	public List<Product> searchProduct(String key) {
		// System.out.println(SEARCH_BOOKS);
		List<Product> products = new ArrayList<>();
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT ID FROM product WHERE name LIKE '%" + key + "%'");) {
			// preparedStatement.setString(1, key);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int ID = rs.getInt("ID");
				Product product = getProductByID(ID);
				products.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}

	public void addProductItem(ProductItem product) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEW_PITEM)) {
			preparedStatement.setInt(1, product.getEmployee().getID());
			preparedStatement.setFloat(2, product.getPrice());
			preparedStatement.setFloat(3, product.getDiscount());
			preparedStatement.setString(4, product.getAddedDate());
			preparedStatement.setInt(5, product.getInStock());
			preparedStatement.setInt(6, product.getProduct().getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean delProductItem(int id) {
		boolean rowDeleted = false;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_PITEM);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rowDeleted;
	}

	public int getStock(int ID) {
		int instock = 0;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NUM_BY_ID)) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				instock = rs.getInt("inStock");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return instock;
	}

	public void substractProductItem(int ID, int numbers) {
		// TODO - implement BookItemDAOImp.updateBookItem
		int prevNum = getStock(ID);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SUBTRACT_PITEM_BY_ID)) {
			preparedStatement.setInt(1, prevNum - numbers);
			preparedStatement.setInt(2, ID);
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editProductItem(int id, float price, float discount, int inStock) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PITEM_BY_ID)) {
			preparedStatement.setFloat(1, price);
			preparedStatement.setFloat(2, discount);
			preparedStatement.setInt(3, inStock);
			preparedStatement.setInt(4, id);
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<ProductItem> getAllBookItems() {
		System.out.println("run getallbookitem");
		List<ProductItem> products = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BITEM_ID);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int ID = rs.getInt("ID");
				System.out.println("bookid: " + ID);
				int employeeID = rs.getInt("employeeID");
				Employee employee = getEmployee(employeeID);
				int prodID = rs.getInt("productID");
				Product product = getProductByID(prodID);
				int inStock = rs.getInt("inStock");
				float price = rs.getFloat("price");
				String addedDate = rs.getString("addedDate");
				float discount = rs.getFloat("discount");
				products.add(new ProductItem(ID, product, employee, price, addedDate, inStock, discount));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}

	public List<ProductItem> getAllPhoneItems() {
		List<ProductItem> products = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PITEM_ID);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int ID = rs.getInt("ID");
				int employeeID = rs.getInt("employeeID");
				Employee employee = getEmployee(employeeID);
				int prodID = rs.getInt("productID");
				Product product = getProductByID(prodID);
				int inStock = rs.getInt("inStock");
				float price = rs.getFloat("price");
				String addedDate = rs.getString("addedDate");
				float discount = rs.getFloat("discount");
				products.add(new ProductItem(ID, product, employee, price, addedDate, inStock, discount));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}

	public List<ProductItem> getAllClotheItems() {
		List<ProductItem> products = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CITEM_ID);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int ID = rs.getInt("ID");
				int employeeID = rs.getInt("employeeID");
				Employee employee = getEmployee(employeeID);
				int prodID = rs.getInt("productID");
				Product product = getProductByID(prodID);
				int inStock = rs.getInt("inStock");
				float price = rs.getFloat("price");
				String addedDate = rs.getString("addedDate");
				float discount = rs.getFloat("discount");
				products.add(new ProductItem(ID, product, employee, price, addedDate, inStock, discount));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}

	public ProductItem getProductItem(int ID) {
		ProductItem productItem = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PITEM_BY_ID);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("ID");
				int employeeID = rs.getInt("employeeID");
				Employee employee = getEmployee(employeeID);
				int prodID = rs.getInt("productID");
				Product product = getProductByID(prodID);
				int inStock = rs.getInt("inStock");
				float price = rs.getFloat("price");
				String addedDate = rs.getString("addedDate");
				float discount = rs.getFloat("discount");
				productItem = new ProductItem(id, product, employee, price, addedDate, inStock, discount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productItem;
	}

	public ProductItem getProductItemByID(int ID) {
		ProductItem productItem = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PITEM_BY_ID2);) {
			preparedStatement.setInt(1, ID);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("ID");
				int employeeID = rs.getInt("employeeID");
				Employee employee = getEmployee(employeeID);
				int prodID = rs.getInt("productID");
				Product product = getProductByID(prodID);
				int inStock = rs.getInt("inStock");
				float price = rs.getFloat("price");
				String addedDate = rs.getString("addedDate");
				float discount = rs.getFloat("discount");
				productItem = new ProductItem(id, product, employee, price, addedDate, inStock, discount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productItem;
	}
}
