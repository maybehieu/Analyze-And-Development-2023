package controller.userController;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.customerDAO.CustomerDAOImp;
import controller.customerDAO.FavouriteDAOImp;
import controller.customerDAO.SearchHistoryDAOImp;
import controller.employeeDAO.EmployeeDAOImp;
import controller.orderDAO.BillDAOImp;
import controller.orderDAO.CartDAOImp;
import controller.orderDAO.OrderDAOImp;
import controller.productDAO.ProductDAOImp;
import controller.productDAO.ProductItemDAOImp;
import controller.userDAO.UserDAOImp;
import model.customer.Customer;
import model.employee.Employee;
import model.order.Bill;
import model.order.Cart;
import model.order.ConstantVoucher;
import model.order.Order;
import model.order.Payment;
import model.order.PercentageVoucher;
import model.order.Shipment;
import model.order.Voucher;
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

@WebServlet(urlPatterns = { "/", "" })
public class userController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private boolean isLogin = false;
	// private BookDAOImp bookDAO;
	// private BookitemDAOImp bookitemDAO;
	private ProductDAOImp productDAO;
	private ProductItemDAOImp productItemDAO;
	private CustomerDAOImp customerDAO;
	private FavouriteDAOImp favouriteDAO;
	private SearchHistoryDAOImp searchDAO;
	private BillDAOImp billDAO;
	private CartDAOImp cartDAO;
	private OrderDAOImp orderDAO;
	private UserDAOImp userDAO;
	private EmployeeDAOImp employeeDAO;
	private int cusID;
	private SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	private SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	// public void init() {
	// this.isLogin = isLogin;
	// this.cusID = cusID;
	//
	// }

	public userController() {
		// bookDAO = new BookDAOImp();
		productDAO = new ProductDAOImp();
		userDAO = new UserDAOImp();
		employeeDAO = new EmployeeDAOImp();
		customerDAO = new CustomerDAOImp();
		// bookitemDAO = new BookitemDAOImp();
		productItemDAO = new ProductItemDAOImp();
		favouriteDAO = new FavouriteDAOImp();
		searchDAO = new SearchHistoryDAOImp();
		cartDAO = new CartDAOImp();
		orderDAO = new OrderDAOImp();
		billDAO = new BillDAOImp();
		System.out.println("something");
	}

	private Cookie getCookie(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		System.out.println(cookies);
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(name)) {
					return cookie;
				}
			}
		}
		return null;
	}

	private int getcustomerID(HttpServletRequest request) {
		Cookie cookie = getCookie(request, "customerId");
		if (cookie != null) {
			String customerIDname = cookie.getValue();
			// System.out.println(customerIDname);
			try {
				return Integer.parseInt(customerIDname);
			} catch (Exception e) {
				return -1;
			}
		}
		return 0;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		System.out.println(request.getServletPath());
		System.out.println(request.getRequestURI());

		try {
			switch (action.toLowerCase()) {
				case "/register":
					register(request, response);
					break;
				case "/loginform":
					loginform(request, response);
					break;
				case "/logout":
					logout(request, response);
					break;
				case "/addproduct":
					addProductItem(request, response);
					break;
				case "/cart":
					showCart(request, response);
					break;
				case "/selectspv":
					selectVoucherShipPayment(request, response);
					break;
				case "/login":
					login(request, response);
					break;
				case "/checkout":
					checkoutDetail(request, response);
					break;
				case "/order":
					order(request, response);
					break;
				case "/bill":
					getBill(request, response);
					break;
				case "/addnewproduct":
					addProductForm(request, response);
					break;
				case "/editproduct":
					editProductForm(request, response);
					break;
				case "/uploadproductitem":
					addProductItemForm(request, response);
					break;
				case "/editproductitem":
					editProductItemForm(request, response);
					break;
				case "/home":
					listProducts(request, response);
					break;
				case "/manage":
					adminPage(request, response);
					break;
				case "/admin":
					adminPage(request, response);
					break;
				case "/processadd":
					addProductC(request, response);
					break;
				case "/processedit":
					editProductC(request, response);
					break;
				case "/processedititem":
					editProductitem(request, response);
					break;
				case "/processadditem":
					uploadProductitem(request, response);
					break;
				case "/dellbitemcart":
					dellPitemCart(request, response);
					break;
				case "/orderlists":
					orderLists(request, response);
					break;
				case "/delpitem":
					delPitem(request, response);
					break;
				case "/productdetails":
					productDetails(request, response);
					break;
				case "/search":
					search(request, response);
					break;
				default:
					listProducts(request, response);
					break;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NoSuchAlgorithmException {
		try {
			String firstname = request.getParameter("firstName");
			String lastname = request.getParameter("lastName");
			String gender = request.getParameter("gender");
			String username = request.getParameter("username");
			String passwordTmp = request.getParameter("password");
			String phoneNum = request.getParameter("phoneNum");
			String type = request.getParameter("type");
			String accountNum = request.getParameter("accountNum");
			String city = request.getParameter("city");
			String district = request.getParameter("district");
			String houseNo = request.getParameter("houseNo");
			String day = request.getParameter("day");
			String month = request.getParameter("month");
			String years = request.getParameter("years");

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(passwordTmp.getBytes(StandardCharsets.UTF_8));
			String password = Base64.getEncoder().encodeToString(hash);

			Account account = new Account(1, username, password);
			Phone phone = new Phone(1, phoneNum, type);
			Address address = new Address(1, city, district, houseNo);
			Fullname fullname = new Fullname(1, firstname, lastname);
			Birth birth = new Birth(1, day, month, years);
			User user = new User(1, gender, account, fullname, phone, birth, address);
			Customer customer = new Customer(1, accountNum, user);

			userDAO.addAcc(account);
			userDAO.addAddress(address);
			userDAO.addPhone(phone);
			userDAO.addFN(fullname);
			userDAO.addBirth(birth);
			userDAO.addUser(user);
			customerDAO.addCustomer(customer);

			PrintWriter writer = response.getWriter();
			writer.write("Register Success!");
			writer.close();
		} catch (Exception e) {
			PrintWriter writer = response.getWriter();
			writer.write("Register Failed!");
			writer.close();
		}

	}

	public void listProducts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = false;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID <= 0) {
			response.sendRedirect("account.jsp");
			return;
		}
		// List<Bookitem> comics = bookitemDAO.getAllCMitem();
		// List<Bookitem> textBook = bookitemDAO.getAllTXitem();
		// List<Bookitem> lightNovel = bookitemDAO.getAllLNitem();
		List<ProductItem> books = productItemDAO.getAllBookItems();
		List<ProductItem> phones = productItemDAO.getAllPhoneItems();
		List<ProductItem> clothes = productItemDAO.getAllClotheItems();
		// request.setAttribute("listComics", comics);
		// request.setAttribute("listTextBook", textBook);
		// request.setAttribute("listLightNovel", lightNovel);
		request.setAttribute("listBooks", books);
		request.setAttribute("listPhones", phones);
		request.setAttribute("listClothes", clothes);
		request.setAttribute("customerID", customerID > 0);
		RequestDispatcher dispatcher = request.getRequestDispatcher("productlist.jsp");
		dispatcher.forward(request, response);
	}

	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie cookie = new Cookie("customerId", "");
		response.addCookie(cookie);
		response.sendRedirect("home");
	}

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NoSuchAlgorithmException {
		String username = request.getParameter("username");
		String passwordTmp = request.getParameter("password");

		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] hash = digest.digest(passwordTmp.getBytes(StandardCharsets.UTF_8));
		String password = Base64.getEncoder().encodeToString(hash);
		// System.out.println(username+password);
		int accountID = userDAO.getAccountID(username, password);
		System.out.println(accountID);
		if (userDAO.checkValidAccount(username, password)) {
			int customerId = customerDAO.getCustomerByAccountID(accountID).getID();
			Cookie cookie = new Cookie("customerId", String.valueOf(customerId));
			response.addCookie(cookie);
			request.setAttribute("customerID", customerId);
			response.sendRedirect("home");
		} else {
			response.sendRedirect("account.jsp");
		}
	}

	public void loginform(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("account.jsp");
	}

	public void addProductItem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		System.out.println(customerID);
		if (requireLogin && customerID <= 0) {
			PrintWriter writer = response.getWriter();
			writer.write("Please login first!");
			writer.close();
			return;
		} else {
			String bookItemId = request.getParameter("productItemId");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			// Bookitem bookItem =
			// bookitemDAO.getBookitemByID(Integer.parseInt(bookItemId));
			ProductItem productItem = productItemDAO.getProductItemByID(Integer.parseInt(bookItemId));
			Cart cart = cartDAO.getCart(customerID);
			if (cart == null) {
				cart = new Cart(1, customerDAO.getCustomer(customerID), dateFormat.format(new Date()),
						dateFormat.format(new Date()), 0, (float) 0);
				cartDAO.createCart(cart);
			}
			if (cartDAO.checkProductItem(cart, productItem) > 0) {
				System.out.println("abc");
				cartDAO.updateProductItem(cart, productItem, customerID);
			} else {
				cartDAO.addProductItem(cart, productItem, quantity);
			}

			PrintWriter writer = response.getWriter();
			writer.write("Added " + productItem.getProduct().getName() + " to cart");
			writer.close();
		}

	}

	public void showCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID <= 0) {
			response.sendRedirect("account.jsp");
			return;
		}
		float totalPrice = 0;
		float discount = 0;
		Cart cart = cartDAO.getCart(customerID);
		if (cart == null) {
			cart = new Cart(1, customerDAO.getCustomer(customerID), dateFormat.format(new Date()),
					dateFormat.format(new Date()), 0, (float) 0);
			cartDAO.createCart(cart);
		}

		HashMap<Integer, Integer> products = cartDAO.getProductItemIDList(cart.getID());

		List<ProductItem> productItems = new ArrayList<ProductItem>();
		List<Integer> productQuantity = new ArrayList<Integer>();
		List<Float> productPrice = new ArrayList<Float>();

		for (Map.Entry<Integer, Integer> entry : products.entrySet()) {
			System.out.println(entry.getKey() + " " + entry.getValue());
			ProductItem productItem = productItemDAO.getProductItemByID(entry.getKey());
			productItems.add(productItem);
			productQuantity.add(entry.getValue());
			System.out.println("CCC" + productItem.getProduct().getName());
			totalPrice += productItem.getPrice() * entry.getValue();
			productPrice.add(productItem.getPrice() * entry.getValue());
			discount += productItem.getDiscount() * entry.getValue();
		}

		// request.setAttribute("bookItems", productItems);
		// request.setAttribute("bookQuantity", productQuantity);
		// request.setAttribute("bookPrice", productPrice);
		request.setAttribute("productItems", productItems);
		request.setAttribute("productQuantity", productQuantity);
		request.setAttribute("productPrice", productPrice);

		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("discount", discount);
		request.setAttribute("total", totalPrice - discount);
		request.setAttribute("customerID", customerID > 0);

		RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
		dispatcher.forward(request, response);
	}

	public void selectVoucherShipPayment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("voucherShipPayment.jsp");
		dispatcher.forward(request, response);
	}

	public void order(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		int shipmentID = Integer.parseInt(request.getParameter("shipment"));
		int voucherID = Integer.parseInt(request.getParameter("voucher"));
		int paymentID = Integer.parseInt(request.getParameter("payment"));
		if (requireLogin && customerID <= 0) {
			response.sendRedirect("account.jsp");
			return;
		}
		float totalPrice = 0;
		float discount = 0;
		Cart cart = cartDAO.getCart(customerID);
		if (cart == null) {
			cart = new Cart(1, customerDAO.getCustomer(customerID), dateFormat.format(new Date()),
					dateFormat.format(new Date()), 0, (float) 0);
			cartDAO.createCart(cart);
		}

		// HashMap<Integer, Integer> books = cartDAO.getProductItemIDList(cart.getID());
		HashMap<Integer, Integer> products = cartDAO.getProductItemIDList(cart.getID());
		Shipment shipment = orderDAO.getShipmentByID(shipmentID);
		Voucher voucher = orderDAO.getVoucherByID(voucherID);
		Payment payment = orderDAO.getPaymentByID(paymentID);

		// if (shipmentID == 3){
		// FastShipment shipment = shipmentDAO.findFastShipmentByID(shipmentID);
		// }else if(shipmentID == 2){
		// EconomicalShipment shipment =
		// shipmentDAO.findEconomicalShipmentByID(shipmentID);
		// }
		// else{
		// AbroadShipment shipment = shipmentDAO.findAbroadShipmentByID(shipmentID);
		// }

		// List<Bookitem> bookitems = new ArrayList<Bookitem>();
		// List<Integer> bookQuantity = new ArrayList<Integer>();
		// List<Float> bookPrice = new ArrayList<Float>();
		List<ProductItem> productitems = new ArrayList<ProductItem>();
		List<Integer> productQuantity = new ArrayList<Integer>();
		List<Float> productPrice = new ArrayList<Float>();
		int totalQuantities = 0;

		// for (Map.Entry<Integer, Integer> entryBook : books.entrySet()) {
		// System.out.println(entryBook.getKey() + " " + entryBook.getValue());
		// Bookitem bookItem = bookitemDAO.getBookitemByID(entryBook.getKey());
		// bookitemDAO.editBookItem(bookItem.getID(), bookItem.getPrice(),
		// bookItem.getDiscount(), bookItem.getInStock()-entryBook.getValue());
		// bookitems.add(bookItem);
		// bookQuantity.add(entryBook.getValue());
		// totalQuantities += entryBook.getValue();
		// totalPrice += bookItem.getPrice() * entryBook.getValue();
		// bookPrice.add(bookItem.getPrice() * entryBook.getValue());
		// discount += bookItem.getDiscount() * entryBook.getValue();
		// }
		for (Map.Entry<Integer, Integer> entryProduct : products.entrySet()) {
			System.out.println(entryProduct.getKey() + " " + entryProduct.getValue());
			ProductItem bookItem = productItemDAO.getProductItemByID(entryProduct.getKey());
			productItemDAO.editProductItem(bookItem.getID(), bookItem.getPrice(), bookItem.getDiscount(),
					bookItem.getInStock() - entryProduct.getValue());
			productitems.add(bookItem);
			productQuantity.add(entryProduct.getValue());
			totalQuantities += entryProduct.getValue();
			totalPrice += bookItem.getPrice() * entryProduct.getValue();
			productPrice.add(bookItem.getPrice() * entryProduct.getValue());
			discount += bookItem.getDiscount() * entryProduct.getValue();
		}

		float voucherdiscount = 0;
		float shipmentPrice = shipment.getFees();
		float paymentPrice = payment.getFees();
		int type = orderDAO.getVoucherType(voucherID);
		if (type == 1) {
			ConstantVoucher vc = orderDAO.getConstantVoucher(voucherID);
			voucherdiscount = vc.getQuantity();
		} else {
			PercentageVoucher vc = orderDAO.getPercentageVoucher(voucherID);
			voucherdiscount = totalPrice * vc.getPercentage() / 100;
		}

		Order order = new Order(0, dateFormat.format(new Date()), cart, payment, shipment, voucher,
				employeeDAO.getEmployee(1));
		orderDAO.addOrder(order);
		cartDAO.editCart(cart, totalPrice - discount - voucherdiscount + shipmentPrice + paymentPrice, totalQuantities);
		billDAO.addBill(new Bill(1, cart.getTotalPrice(), dateFormat.format(new Date()), discount, order,
				employeeDAO.getEmployee(1)));
		cartDAO.createCart(new Cart(cart.getID() + 1, customerDAO.getCustomer(getcustomerID(request)),
				dateFormat.format(new Date()), dateFormat.format(new Date()), 0, (float) 0.0));
		// request.setAttribute("bookItems", bookitems);
		// request.setAttribute("bookQuantity", bookQuantity);
		// request.setAttribute("bookPrice", bookPrice);
		request.setAttribute("productItems", productitems);
		request.setAttribute("productQuantity", productQuantity);
		request.setAttribute("productPrice", productPrice);

		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("voucherDiscount", voucherdiscount);
		request.setAttribute("discount", discount + voucherdiscount);
		request.setAttribute("shipmentPrice", shipmentPrice);
		request.setAttribute("paymentPrice", paymentPrice);
		request.setAttribute("total", totalPrice - discount - voucherdiscount + shipmentPrice + paymentPrice);
		request.setAttribute("customerID", customerID > 0);

		RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
		dispatcher.forward(request, response);
	}

	public void checkoutDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID <= 0) {
			response.sendRedirect("account.jsp");
			return;
		}
		float totalPrice = 0;
		float discount = 0;
		Cart cart = cartDAO.getCart(customerID);
		if (cart == null) {
			cart = new Cart(1, customerDAO.getCustomer(customerID), dateFormat.format(new Date()),
					dateFormat.format(new Date()), 0, (float) 0);
			cartDAO.createCart(cart);
		}

		// HashMap<Integer, Integer> books = cartDAO.getBookitemIDList(cart.getID());
		HashMap<Integer, Integer> products = cartDAO.getProductItemIDList(cart.getID());

		// List<Bookitem> bookitems = new ArrayList<Bookitem>();
		// List<Integer> bookQuantity = new ArrayList<Integer>();
		// List<Float> bookPrice = new ArrayList<Float>();
		List<ProductItem> productitems = new ArrayList<ProductItem>();
		List<Integer> productQuantity = new ArrayList<Integer>();
		List<Float> productPrice = new ArrayList<Float>();
		List<Payment> payments = new ArrayList<Payment>();
		List<Shipment> shipments = new ArrayList<Shipment>();
		List<Voucher> vouchers = new ArrayList<Voucher>();

		int totalQuantities = 0;

		for (Payment payment : orderDAO.getAllPayment()) {
			payments.add(payment);
		}
		for (Shipment shipment : orderDAO.getAllShipment()) {
			shipments.add(shipment);
		}
		for (Voucher voucher : orderDAO.getAllVoucher()) {
			vouchers.add(voucher);
		}
		// for (Map.Entry<Integer, Integer> entryBook : books.entrySet()) {
		// System.out.println(entryBook.getKey() + " " + entryBook.getValue());
		// Bookitem bookitem = bookitemDAO.getBookitemByID(entryBook.getKey());
		// bookitems.add(bookitem);
		// bookQuantity.add(entryBook.getValue());
		// totalQuantities += entryBook.getValue();
		// totalPrice += bookitem.getPrice() * entryBook.getValue();
		// bookPrice.add(bookitem.getPrice() * entryBook.getValue());
		// discount += bookitem.getDiscount() * entryBook.getValue();
		// }
		for (Map.Entry<Integer, Integer> entryProduct : products.entrySet()) {
			System.out.println(entryProduct.getKey() + " " + entryProduct.getValue());
			ProductItem productitem = productItemDAO.getProductItemByID(entryProduct.getKey());
			productitems.add(productitem);
			productQuantity.add(entryProduct.getValue());
			totalQuantities += entryProduct.getValue();
			totalPrice += productitem.getPrice() * entryProduct.getValue();
			productPrice.add(productitem.getPrice() * entryProduct.getValue());
			discount += productitem.getDiscount() * entryProduct.getValue();
		}
		// request.setAttribute("bookItems", bookitems);
		// request.setAttribute("bookQuantity", bookQuantity);
		// request.setAttribute("bookPrice", bookPrice);
		request.setAttribute("productItems", productitems);
		request.setAttribute("productQuantity", productQuantity);
		request.setAttribute("productPrice", productPrice);

		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("discount", discount);
		request.setAttribute("total", totalPrice - discount);

		request.setAttribute("payments", payments);
		request.setAttribute("shipments", shipments);
		request.setAttribute("vouchers", vouchers);

		request.setAttribute("customerID", customerID > 0);

		RequestDispatcher dispatcher = request.getRequestDispatcher("checkoutDetail.jsp");
		dispatcher.forward(request, response);
	}

	public void getBill(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int billID = billDAO.getMaxID(getcustomerID(request));
		Bill bill = billDAO.getBill(billID);
		Order order = bill.getOrder();
		orderDAO.getPaymentType(order.getPayment().getID());
		String paymentName;
		String shipmentName;
		String voucherName;
		if (orderDAO.getPaymentType(order.getPayment().getID()) == 1) {
			paymentName = "COD";
		} else if (orderDAO.getPaymentType(order.getPayment().getID()) == 2) {
			paymentName = "Internet Banking";
		} else {
			paymentName = "Credit Card";
		}

		if (orderDAO.getShipmentType(order.getShipment().getID()) == 1) {
			shipmentName = "Economical";
		} else if (orderDAO.getShipmentType(order.getShipment().getID()) == 2) {
			shipmentName = "Safe";
		} else {
			shipmentName = "Fast";
		}

		if (orderDAO.getPaymentType(order.getPayment().getID()) == 1) {
			voucherName = "Constant";
		} else {
			voucherName = "Percentage";
		}

		request.setAttribute("totalPrice", bill.getTotalPrice());
		request.setAttribute("totalDiscount", bill.getTotalDiscount());
		request.setAttribute("orderID", order.getID());
		request.setAttribute("paymentMethod", paymentName);
		request.setAttribute("shipmentMethod", shipmentName);
		request.setAttribute("voucherMethod", voucherName);
	}

	public void addProductForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID != 1) {
			response.sendRedirect("account.jsp");
			return;
		}
		response.sendRedirect("addproductform.jsp");
	}

	public void addProductC(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID != 1) {
			response.sendRedirect("account.jsp");
			System.out.println("cc");
			return;
		}

		int employeeID = 1;
		Employee employee = employeeDAO.getEmployee(employeeID);
		String address = request.getParameter("address");
		String providerName = request.getParameter("providerName");
		Provider providertmp = new Provider(1, address, providerName);
		productDAO.addProvider(providertmp);
		Provider provider = productDAO.getProvider(productDAO.getMaxIDPvd());
		String name = request.getParameter("name");
		String summary = request.getParameter("summary");
		String releaseDate = request.getParameter("releaseDate");
		String category = request.getParameter("category");
		if (category.equals("B")) {
			String author = request.getParameter("author");
			String bookCategory = request.getParameter("bookCategory");
			System.out.println(bookCategory);
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			int volume = Integer.parseInt(request.getParameter("volume"));
			int ID = productDAO.getMaxIDProduct()+1;
			int bookID = productDAO.getMaxIDBook()+1;
//			Book product = new Book(1, name, summary, releaseDate, category, employee, provider, 1, author,
//					bookCategory, pageNum, volume);
			Book product = new Book(ID, name, summary, releaseDate, category, employee, provider, bookID, author,
					bookCategory, pageNum, volume);
			productDAO.addProductBook(product);
			System.out.println("Add book done ");
			System.out.println(summary + " " + author);
		} else if (category.equals("P")) {
			String phonetype = request.getParameter("phoneType");
			String phonebrand = request.getParameter("phoneBrand");
			String model = request.getParameter("model");
			String spec = request.getParameter("spec");
			int ID = productDAO.getMaxIDProduct()+1;
			int phoneID = productDAO.getMaxIDPhone()+1;
//			model.product.Phone product = new model.product.Phone(1, name, summary, releaseDate, category, employee,
//					provider, 1, phonetype, phonebrand, model, spec);
			model.product.Phone product = new model.product.Phone(ID, name, summary, releaseDate, category, employee,
					provider, phoneID, phonetype, phonebrand, model, spec);
			productDAO.addProductPhone(product);
			System.out.println("Add P done ");
		} else if (category.equals("C")) {
			String clothestype = request.getParameter("clothesType");
			String clothesbrand = request.getParameter("clothesBrand");
			String color = request.getParameter("color");
			String gender = request.getParameter("gender");
			int ID = productDAO.getMaxIDProduct()+1;
			int clothesID = productDAO.getMaxIDClothes()+1;
//			Clothes product = new Clothes(1, name, summary, releaseDate, category, employee, provider, 1, clothestype,
//					clothesbrand, color, gender);
			Clothes product = new Clothes(ID, name, summary, releaseDate, category, employee, provider, clothesID, clothestype,
					clothesbrand, color, gender);
			productDAO.addProductClothes(product);
			System.out.println("Add C done ");
		}
		// response.sendRedirect("admin-index.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin");
		dispatcher.forward(request, response);
	}

	public void editProductForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID != 1) {
			response.sendRedirect("account.jsp");
			return;
		}
		int ID = Integer.parseInt(request.getParameter("ID"));
		int type = productDAO.getType(ID);
		Product product = productDAO.getProductByID(ID);
		request.setAttribute("ID", ID);
		request.setAttribute("address", product.getProvider().getAddress());
		request.setAttribute("providerName", product.getProvider().getName());
		request.setAttribute("name", product.getName());
		request.setAttribute("summary", product.getSummary());
		request.setAttribute("releaseDate", String.valueOf(product.getReleaseDate())); // int

		if (type == 1) {
			Book book = productDAO.getBByID(ID);
			request.setAttribute("category", "Book");
			request.setAttribute("ID", String.valueOf(book.getID()));
			request.setAttribute("author", book.getAuthor());
			request.setAttribute("bookCategory", book.getBookCategory());
			request.setAttribute("pageNum", String.valueOf(book.getPageNum())); // int
			request.setAttribute("volume", String.valueOf(book.getVolume())); // int
			RequestDispatcher dispatcher = request.getRequestDispatcher("editproductform.jsp");
			dispatcher.forward(request, response);
			return;
		} else if (type == 2) {
			model.product.Phone phone = productDAO.getPByID(ID);
			request.setAttribute("category", "Phone");
			request.setAttribute("ID", String.valueOf(phone.getID()));
			request.setAttribute("phoneType", phone.getType());
			request.setAttribute("phoneBrand", phone.getBrand());
			request.setAttribute("model", phone.getModel());
			request.setAttribute("spec", phone.getSpec());
			RequestDispatcher dispatcher = request.getRequestDispatcher("editproductform.jsp");
			dispatcher.forward(request, response);
			return;
		} else if (type == 3) {
			Clothes clothes = productDAO.getCByID(ID);
			request.setAttribute("category", "Clothes");
			request.setAttribute("ID", String.valueOf(clothes.getID()));
			request.setAttribute("clothesType", clothes.getType());
			request.setAttribute("clothesBrand", clothes.getBrand());
			request.setAttribute("color", clothes.getColor());
			request.setAttribute("gender", clothes.getGender());
			RequestDispatcher dispatcher = request.getRequestDispatcher("editproductform.jsp");
			dispatcher.forward(request, response);
			return;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/manage");
		dispatcher.forward(request, response);
	}

	public void editProductC(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID != 1) {
			response.sendRedirect("account.jsp");
			return;
		}

		int employeeID = 1;
		int prodID = Integer.parseInt(request.getParameter("ID"));
		System.out.println("prodid: " +prodID);
		Product prodtmp = productDAO.getProductByID(prodID);
		int providerID = prodtmp.getProvider().getID();
		Employee employee = employeeDAO.getEmployee(employeeID);
		String address = request.getParameter("address");
		String providerName = request.getParameter("providerName");
		Provider providertmp = new Provider(providerID, address, providerName);
		productDAO.editProvider(providertmp);
		String name = request.getParameter("title");
		String summary = request.getParameter("summary");
		String releaseDate = request.getParameter("releaseDate");
		String category = request.getParameter("category");
		System.out.println("prod cate: " +category);

		if (category.equals("Book")) {
			String author = request.getParameter("author");
			String bookCategory = request.getParameter("bookCategory");
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			int volume = Integer.parseInt(request.getParameter("volume"));
			Book product = new Book(prodID, name, summary, releaseDate, category, employee, providertmp, 1, author,
					bookCategory, pageNum, volume);
			productDAO.editBook(product);
		} else if (category.equals("Phone")) {
			String phonetype = request.getParameter("phoneType");
			String phonebrand = request.getParameter("phoneBrand");
			String model = request.getParameter("model");
			String spec = request.getParameter("spec");
			model.product.Phone product = new model.product.Phone(prodID, name, summary, releaseDate, category,
					employee, providertmp, 1, phonetype, phonebrand, model, spec);
			productDAO.editPhone(product);
			System.out.println("edit P");
		} else {
			String clothestype = request.getParameter("phoneType");
			String clothesbrand = request.getParameter("phoneBrand");
			String color = request.getParameter("color");
			String gender = request.getParameter("gender");
			Clothes product = new Clothes(prodID, name, summary, releaseDate, category, employee, providertmp, 1,
					clothestype, clothesbrand, color, gender);
			productDAO.editClothes(product);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/manage");
		dispatcher.forward(request, response);
	}

	public void addProductItemForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID != 1) {
			response.sendRedirect("account.jsp");
			return;
		}
		int ID = Integer.parseInt(request.getParameter("ID"));
		ProductItem tmp = productItemDAO.getProductItem(ID);
		if (tmp != null) {
			response.sendRedirect("/Final-Exam/admin");
		}
		request.setAttribute("ID", ID);
		request.setAttribute("addedDate", dateFormat.format(new Date()));
		RequestDispatcher dispatcher = request.getRequestDispatcher("addpitemform.jsp");
		dispatcher.forward(request, response);
		// response.sendRedirect("addbitemform.jsp");
	}

	public void uploadProductitem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID != 1) {
			response.sendRedirect("account.jsp");
			return;
		}

		int employeeID = 1;
		Employee employee = employeeDAO.getEmployee(employeeID);
		int ID = Integer.parseInt(request.getParameter("ID"));
		float price = Float.parseFloat(request.getParameter("price"));
		float discount = Float.parseFloat(request.getParameter("discount"));
		String addedDate = request.getParameter("addedDate");
		int inStock = Integer.parseInt(request.getParameter("inStock"));
		Product product = productDAO.getProductByID(ID);
		ProductItem productItem = new ProductItem(1, product, employee, price, addedDate, inStock, discount);
		productItemDAO.addProductItem(productItem);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/manage");
		dispatcher.forward(request, response);
	}

	public void editProductItemForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID != 1) {
			response.sendRedirect("account.jsp");
			return;
		}
		int ID = Integer.parseInt(request.getParameter("ID"));
		ProductItem productitem = productItemDAO.getProductItem(ID);
		request.setAttribute("ID", String.valueOf(productitem.getID()));
		request.setAttribute("prodID", ID);
		request.setAttribute("addedDate", productitem.getAddedDate());
		request.setAttribute("price", String.valueOf(productitem.getPrice())); // int
		request.setAttribute("discount", String.valueOf(productitem.getDiscount())); // int
		request.setAttribute("inStock", String.valueOf(productitem.getInStock())); // int

		RequestDispatcher dispatcher = request.getRequestDispatcher("editpitemform.jsp");
		dispatcher.forward(request, response);
	}

	public void editProductitem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID != 1) {
			response.sendRedirect("account.jsp");
			return;
		}

		int employeeID = 1;
		int ID = Integer.parseInt(request.getParameter("ID"));
		int prodID = Integer.parseInt(request.getParameter("prodID"));
		Employee employee = employeeDAO.getEmployee(employeeID);
		Product product = productDAO.getProductByID(prodID);
		String addedDate = request.getParameter("addedDate");
		int inStock = Integer.parseInt(request.getParameter("inStock"));
		float price = Float.parseFloat(request.getParameter("price"));
		float discount = Float.parseFloat(request.getParameter("discount"));
		productItemDAO.editProductItem(ID, price, discount, inStock);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/manage");
		dispatcher.forward(request, response);
	}

	public void adminPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID != 1) {
			System.out.print("CC");
			response.sendRedirect("/Final-Exam/home");
			return;
		}
		List<Book> books = productDAO.findAllBooks();
		List<model.product.Phone> phones = productDAO.findAllPhones();
		List<Clothes> clothes = productDAO.findAllClothes();
		List<Customer> customers = customerDAO.findAllCustomers();
		List<ProductItem> productItem = productItemDAO.getAllBookItems();
		List<ProductItem> productItem2 = productItemDAO.getAllPhoneItems();
		List<ProductItem> productItem3 = productItemDAO.getAllClotheItems();
		List<Order> orders = orderDAO.getAllOrderAdmin();
		while (orders.remove(null))
			;
		for (ProductItem item : productItem2) {
			productItem.add(item);
		}
		for (ProductItem item : productItem3) {
			productItem.add(item);
		}
		request.setAttribute("listOrders", orders);
		request.setAttribute("customerID", customerID > 0);
		request.setAttribute("listBooks", books);
		request.setAttribute("listPhones", phones);
		request.setAttribute("listClothes", clothes);
		request.setAttribute("customers", customers);
		request.setAttribute("productItem", productItem);

		RequestDispatcher dispatcher = request.getRequestDispatcher("admin-index.jsp");
		dispatcher.forward(request, response);
	}

	public void dellPitemCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID <= 0) {
			response.sendRedirect("account.jsp");
			return;
		}
		int productitemID = Integer.parseInt(request.getParameter("productitemID"));
		int cartID = cartDAO.getCart(customerID).getID();
		System.out.println(cartDAO.delCartPitem(productitemID, cartID));
		response.sendRedirect("cart");
		// RequestDispatcher dispatcher = request.getRequestDispatcher("/cart");
		// dispatcher.forward(request, response);
	}

	public void orderLists(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID <= 0) {
			response.sendRedirect("account.jsp");
			return;
		}
		List<Order> orders = orderDAO.showAllOrder(customerID);
		// orders.get(0).getPayment().get
		while (orders.remove(null))
			;
		System.out.println(orders.size());
		request.setAttribute("listOrders", orders);
		request.setAttribute("customerID", customerID > 0);
		// bookitem.get(0).getBook().get
		// TextBook txt;
		// txt.getAuthor().get
		RequestDispatcher dispatcher = request.getRequestDispatcher("orderhistory.jsp");
		dispatcher.forward(request, response);
	}

	public void delPitem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = true;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID != 1) {
			response.sendRedirect("/Final-Exam/home");
			return;
		}
		int productitemID = Integer.parseInt(request.getParameter("productitemID"));
		// bookitem.get(0).getBook().get
		// TextBook txt;
		// txt.getAuthor().get\
		System.out.println(productitemID);
		productItemDAO.delProductItem(productitemID);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/manage");
		dispatcher.forward(request, response);
	}

	public void productDetails(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = false;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID <= 0) {
			response.sendRedirect("/Final-Exam/home");
			return;
		}
		int ID = Integer.parseInt(request.getParameter("id"));
		ProductItem productitem = productItemDAO.getProductItemByID(ID);
		// bookitem.getBook().getT
		request.setAttribute("productitem", productitem);
		request.setAttribute("customerID", customerID > 0);
		RequestDispatcher dispatcher = request.getRequestDispatcher("products.jsp");
		dispatcher.forward(request, response);
	}

	public void search(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean requireLogin = false;
		int customerID = getcustomerID(request);
		if (requireLogin && customerID <= 0) {
			response.sendRedirect("account.jsp");
			return;
		}
		String keywords = request.getParameter("keywords");
		List<Product> products = productDAO.searchProduct(keywords);
		List<ProductItem> productitems = new ArrayList<>();
		for (Product product : products) {
			productitems.add(productItemDAO.getProductItem(product.getID()));
		}
		request.setAttribute("productitems", productitems);
		request.setAttribute("customerID", customerID > 0);
		RequestDispatcher dispatcher = request.getRequestDispatcher("productlistsearch.jsp");
		dispatcher.forward(request, response);
	}
}
