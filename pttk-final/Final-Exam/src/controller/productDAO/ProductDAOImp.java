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
import model.product.Provider;
import model.user.Account;
import model.user.Address;
import model.user.Birth;
import model.user.Fullname;
import model.user.Phone;
import model.user.User;

public class ProductDAOImp implements ProductDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/pttk?allowPublicKeyRetrieval=true&useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "1234";

	private static final String INSERT_NEW_B = "insert into product "
			+ "(employeeID, providerID, name, summary, releaseDate, category, bookID, author, bookCategory, pageNum, volume) values "
			+ " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	private static final String INSERT_NEW_P = "insert into product "
			+ "(employeeID, providerID, name, summary, releaseDate, category, phoneID, phoneType, phoneBrand, model, spec) values "
			+ " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	private static final String INSERT_NEW_C = "insert into product "
			+ "(employeeID, providerID, name, summary, releaseDate, category, clothesID, clothesType, clothesBrand, color, gender) values "
			+ " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	private static final String INSERT_NEW_PVD = "insert into provider " + "(address, name) values" + " (?,?);";
	private static final String SELECT_MAX_ID_PVD = "SELECT MAX(id) FROM provider;";
	private static final String SELECT_PROD_BY_ID = "select * from book where ID =?;";
	private static final String CHECK_TYPES_B = "select * from product where ID =? and bookID is not null;";
	private static final String CHECK_TYPES_P = "select * from product where ID =? and phoneID is not null;";
	private static final String CHECK_TYPES_C = "select * from product where ID =? and clothesID is not null;";
	private static final String SELECT_ALL_B = "select * from product where bookID is not null;";
	private static final String SELECT_ALL_P = "select * from product where phoneID is not null;";
	private static final String SELECT_ALL_C = "select * from product where clothesID is not null;";
	private static final String UPDATE_B = "update product set providerID=?, name=?, summary=?, releaseDate=?, category=?, author=?, bookCategory=?, pageNum=?, volume=? where bookID=?;";
	private static final String UPDATE_P = "update product set providerID=?, name=?, summary=?, releaseDate=?, category=?, phoneType=?, phoneBrand=?, model=?, spec=? where phoneID=?;";
	private static final String UPDATE_C = "update product set providerID=?, name=?, summary=?, releaseDate=?, category=?, clothesType=?, clothesBrand=?, color=?, gender=? where clothesID=?;";
	private static final String UPDATE_PVD = "update provider set address=?, name=?, where ID=?;";
	private static final String DELETE_PROD = "delete from product where ID = ?;";
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
	private static final String SELECT_MAX_ID_BOOK = "SELECT MAX(bookID) FROM product;";
	private static final String SELECT_MAX_ID_PHONE = "SELECT MAX(phoneID) FROM product;";
	private static final String SELECT_MAX_ID_CLOTH = "SELECT MAX(clothesID) FROM product;";

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

	public int getType(int ID) {
		int flag = 0;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(CHECK_TYPES_B);) {
			statement.setInt(1, ID);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				flag = 1;
				return flag;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(CHECK_TYPES_P);) {
			statement.setInt(1, ID);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				flag = 2;
				return flag;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(CHECK_TYPES_C);) {
			statement.setInt(1, ID);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				flag = 3;
				return flag;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public void addProductBook(Book product) {
		// System.out.println(INSERT_ACC_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEW_B)) {
			preparedStatement.setInt(1, product.getEmployee().getID());
			preparedStatement.setInt(2, product.getProvider().getID());
			preparedStatement.setString(3, product.getName());
			preparedStatement.setString(4, product.getSummary());
			preparedStatement.setString(5, product.getReleaseDate());
			preparedStatement.setString(6, product.getCategory());
			preparedStatement.setInt(7, product.getID());
			preparedStatement.setString(8, product.getAuthor());
			preparedStatement.setString(9, product.getCategory());
			preparedStatement.setInt(10, product.getPageNum());
			preparedStatement.setInt(11, product.getVolume());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void addProductPhone(model.product.Phone product) {
		// System.out.println(INSERT_ACC_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEW_P)) {
			preparedStatement.setInt(1, product.getEmployee().getID());
			preparedStatement.setInt(2, product.getProvider().getID());
			preparedStatement.setString(3, product.getName());
			preparedStatement.setString(4, product.getSummary());
			preparedStatement.setString(5, product.getReleaseDate());
			preparedStatement.setString(6, product.getCategory());
			preparedStatement.setInt(7, product.getID());
			preparedStatement.setString(8, product.getType());
			preparedStatement.setString(9, product.getBrand());
			preparedStatement.setString(10, product.getModel());
			preparedStatement.setString(11, product.getSpec());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void addProductClothes(Clothes product) {
		// System.out.println(INSERT_ACC_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEW_C)) {
			preparedStatement.setInt(1, product.getEmployee().getID());
			preparedStatement.setInt(2, product.getProvider().getID());
			preparedStatement.setString(3, product.getName());
			preparedStatement.setString(4, product.getSummary());
			preparedStatement.setString(5, product.getReleaseDate());
			preparedStatement.setString(6, product.getCategory());
			preparedStatement.setInt(7, product.getID());
			preparedStatement.setString(8, product.getType());
			preparedStatement.setString(9, product.getBrand());
			preparedStatement.setString(10, product.getColor());
			preparedStatement.setString(11, product.getGender());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean delProduct(int id) {
		boolean rowDeleted = false;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_PROD);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rowDeleted;
	}

	public List<Book> findAllBooks() {
		List<Book> products = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_B);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int ID = rs.getInt("ID");
				System.out.println("bookID: " + ID);
				String name = rs.getString("name");
				String summary = rs.getString("summary");
				String releaseDate = rs.getString("releaseDate");
				String category = rs.getString("category");
				int employeeID = rs.getInt("employeeID");
				Employee employee = getEmployee(employeeID);
				int providerID = rs.getInt("providerID");
				Provider provider = getProvider(providerID);
				int bookID = rs.getInt("bookID");
				String author = rs.getString("author");
				String bookCategory = rs.getString("bookCategory");
				int pageNum = rs.getInt("pageNum");
				int volume = rs.getInt("volume");
				products.add(new Book(ID, name, summary, releaseDate, category, employee, provider, bookID, author,
						bookCategory, pageNum, volume));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}

	public List<model.product.Phone> findAllPhones() {
		List<model.product.Phone> products = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_P);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				String summary = rs.getString("summary");
				String releaseDate = rs.getString("releaseDate");
				String category = rs.getString("category");
				int employeeID = rs.getInt("employeeID");
				Employee employee = getEmployee(employeeID);
				int providerID = rs.getInt("providerID");
				Provider provider = getProvider(providerID);
				int phoneID = rs.getInt("phoneID");
				String type = rs.getString("phoneType");
				String brand = rs.getString("phoneBrand");
				String model = rs.getString("model");
				String spec = rs.getString("spec");
				products.add(new model.product.Phone(ID, name, summary, releaseDate, category, employee, provider,
						phoneID, type, brand, model, spec));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}

	public List<Clothes> findAllClothes() {
		List<Clothes> products = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_C);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				String summary = rs.getString("summary");
				String releaseDate = rs.getString("releaseDate");
				String category = rs.getString("category");
				int employeeID = rs.getInt("employeeID");
				Employee employee = getEmployee(employeeID);
				int providerID = rs.getInt("providerID");
				Provider provider = getProvider(providerID);
				int phoneID = rs.getInt("clothesID");
				String type = rs.getString("clothesType");
				String brand = rs.getString("clothesBrand");
				String color = rs.getString("color");
				String gender = rs.getString("gender");
				products.add(new Clothes(ID, name, summary, releaseDate, category, employee, provider, phoneID, type,
						brand, color, gender));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}

	public void editBook(Book product) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_B)) {
			preparedStatement.setInt(1, product.getProvider().getID());
			preparedStatement.setString(2, product.getName());
			preparedStatement.setString(3, product.getSummary());
			preparedStatement.setString(4, product.getReleaseDate());
			preparedStatement.setString(5, product.getCategory());
			preparedStatement.setString(6, product.getAuthor());
			preparedStatement.setString(7, product.getBookCategory());
			preparedStatement.setInt(8, product.getPageNum());
			preparedStatement.setInt(9, product.getVolume());
			preparedStatement.setInt(10, product.getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editPhone(model.product.Phone product) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_P)) {
			preparedStatement.setInt(1, product.getProvider().getID());
			preparedStatement.setString(2, product.getName());
			preparedStatement.setString(3, product.getSummary());
			preparedStatement.setString(4, product.getReleaseDate());
			preparedStatement.setString(5, product.getCategory());
			preparedStatement.setString(6, product.getType());
			preparedStatement.setString(7, product.getBrand());
			preparedStatement.setString(8, product.getModel());
			preparedStatement.setString(9, product.getSpec());
			preparedStatement.setInt(10, product.getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editClothes(Clothes product) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_C)) {
			preparedStatement.setInt(1, product.getProvider().getID());
			preparedStatement.setString(2, product.getName());
			preparedStatement.setString(3, product.getSummary());
			preparedStatement.setString(4, product.getReleaseDate());
			preparedStatement.setString(5, product.getCategory());
			preparedStatement.setString(6, product.getType());
			preparedStatement.setString(7, product.getBrand());
			preparedStatement.setString(8, product.getColor());
			preparedStatement.setString(9, product.getGender());
			preparedStatement.setInt(10, product.getID());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
				int providerID = rs.getInt("PublisherID");
				Provider provider = getProvider(providerID);
				String name = rs.getString("title");
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

	public Book getBByID(int ID) {
		Book book = null;
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
				int providerID = rs.getInt("PublisherID");
				Provider provider = getProvider(providerID);
				String name = rs.getString("title");
				String summary = rs.getString("summary");
				String category = rs.getString("category");
				String releaseDate = rs.getString("releaseDate");
				int bookID = rs.getInt("bookID");
				String author = rs.getString("author");
				String bookCategory = rs.getString("bookCategory");
				int pageNum = rs.getInt("pageNum");
				int volume = rs.getInt("volume");

				book = new Book(ID, name, summary, releaseDate, category, employee, provider, bookID, author,
						bookCategory, pageNum, volume);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}

	public model.product.Phone getPByID(int ID) {
		model.product.Phone phone = null;
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
				int providerID = rs.getInt("PublisherID");
				Provider provider = getProvider(providerID);
				String name = rs.getString("title");
				String summary = rs.getString("summary");
				String category = rs.getString("category");
				String releaseDate = rs.getString("releaseDate");
				int phoneID = rs.getInt("phoneID");
				String phoneType = rs.getString("phoneType");
				String phoneBrand = rs.getString("phoneBrand");
				String model = rs.getString("model");
				String spec = rs.getString("spec");

				phone = new model.product.Phone(ID, name, summary, releaseDate, category, employee, provider, phoneID,
						phoneType, phoneBrand, model, spec);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return phone;
	}

	public Clothes getCByID(int ID) {
		Clothes clothes = null;
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
				int providerID = rs.getInt("PublisherID");
				Provider provider = getProvider(providerID);
				String name = rs.getString("title");
				String summary = rs.getString("summary");
				String category = rs.getString("category");
				String releaseDate = rs.getString("releaseDate");
				int clothesID = rs.getInt("clothesID");
				String clothesType = rs.getString("clothesType");
				String clothesBrand = rs.getString("clothesBrand");
				String color = rs.getString("color");
				String gender = rs.getString("gender");

				clothes = new Clothes(ID, name, summary, releaseDate, category, employee, provider, clothesID,
						clothesType, clothesBrand, color, gender);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clothes;
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
	
	public int getMaxIDBook() {
		int id = 0;
		try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MAX_ID_BOOK)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
            	id = rs.getInt("MAX(bookID)");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return id;
	}
	
	public int getMaxIDPhone() {
		int id = 0;
		try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MAX_ID_PHONE)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
            	id = rs.getInt("MAX(phoneID)");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return id;
	}
	
	public int getMaxIDClothes() {
		int id = 0;
		try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MAX_ID_CLOTH)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
            	id = rs.getInt("MAX(clothesID)");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return id;
	}
}
