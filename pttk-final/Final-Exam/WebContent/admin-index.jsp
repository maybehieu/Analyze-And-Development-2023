<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Admin Site | Ecommerce</title>
			<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
				rel="stylesheet">
			<link href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
			<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"
				rel="stylesheet" />
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
			<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
			<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
			<link rel="stylesheet" href="css/style.css">
			<link rel="stylesheet" href="css/tabstyle.css">
		</head>

		<body>
			<div class="container" style="background-color: #fd8585;">
				<div class="navbar">
					<div class="logo">
						<a href="home"><img src="images/logo.png" alt="logo" width="125px"></a>
					</div>
					<nav>
						<ul id="MenuItems">
							<li><a href="home">Home</a></li>
							<li><a href="admin">Admin Site</a></li>
							<li><a href="orderlists">Order Histories</a></li>
							<li><a href="#maps">Contact</a></li>
							<c:if test="${customerID}">
								<li><a href="logout">Logout</a></li>
							</c:if>
							<c:if test="${!customerID}">
								<li><a href="account.jsp">Login/Register</a></li>
							</c:if>
						</ul>
					</nav>
					<a href="cart"><img src="images/cart.png" width="30px" height="30px"></a>
					<img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
				</div>
			</div>

			<h1 class="jumbotron text-center container" style="color: white; background-color: #fd8585;">Admin Dashboard
				<br><br> <i style="font-weight: 300;">Welcome</i>
			</h1>

			<div class="container tab">
				<button class="tablinks" onclick="openCity(event, 'cus')">Customer</button>
				<button class="tablinks" onclick="openCity(event, 'book')">Books</button>
				<button class="tablinks" onclick="openCity(event, 'phone')">Phones</button>
				<button class="tablinks" onclick="openCity(event, 'cloth')">Clothes</button>
				<button class="tablinks" onclick="openCity(event, 'pitem')">ProductItem</button>
				<button class="tablinks" onclick="openCity(event, 'ord')">Orders</button>
			</div>

			<!-- Cart items details -->
			<div class="small-container">
				<div id="cus" class="tabcontent">

					<h1 class="text-center" style="margin: 20px 0px;">Customer List</h1>
					<table id="customer" class="table table-sm table-striped table-bordered">
						<thead>
							<tr>
								<th>CustomerID</th>
								<th>UserID</th>
								<th>Customer Username</th>
								<th>Customer Firstname</th>
								<th>Customer AccountNumber</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${customers}" var="item" varStatus="i">
								<tr>
									<td>${item.ID}</td>
									<td>${item.user.ID}</td>
									<td>${item.user.account.username}</td>
									<td>${item.user.fullname.firstname}</td>
									<td>${item.accountNum}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<form action="/Final-Exam/addnewproduct">
				</div>
				<div id="book" class="tabcontent">
					</form>
					<h1 class="text-center" style="margin: 20px 0px;">Books List</h1>
					<table id="book" class="table table-sm table-striped table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Provider</th>
								<th>ReleaseDate</th>
								<th>Summary</th>
								<th>Author</th>
								<th>Category</th>
								<th>PageNum</th>
								<th>Volume</th>
								<th>Action1</th>
								<th>Action2</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listBooks}" var="item" varStatus="i">
								<tr>
									<td>${item.ID}</td>
									<td>${item.name}</td>
									<td>${item.provider.name}</td>
									<td>${item.releaseDate}</td>
									<td>${item.summary}</td>
									<td>${item.author}</td>
									<td>${item.bookCategory}</td>
									<td>${item.pageNum}</td>
									<td>${item.volume}</td>
									<td>
										<form action="editproduct">
											<input type="hidden" name="ID" value=${item.ID} />
											<input type="submit" value="Edit">
										</form>
									</td>
									<td>
										<form action="uploadproductitem">
											<input type="hidden" name="ID" value=${item.ID} />
											<input type="submit" value="Upload">
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="phone" class="tabcontent">
					<h1 class="text-center" style="margin: 20px 0px;">Phones List</h1>
					<table id="phone" class="table table-sm table-striped table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Provider</th>
								<th>ReleaseDate</th>
								<th>Summary</th>
								<th>Type</th>
								<th>Brand</th>
								<th>Model</th>
								<th>Spec</th>
								<th>Action1</th>
								<th>Action2</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listPhones}" var="item" varStatus="i">
								<tr>
									<td>${item.ID}</td>
									<td>${item.name}</td>
									<td>${item.provider.name}</td>
									<td>${item.releaseDate}</td>
									<td>${item.summary}</td>
									<td>${item.type}</td>
									<td>${item.brand}</td>
									<td>${item.model}</td>
									<td>${item.spec}</td>
									<td>
										<form action="editproduct">
											<input type="hidden" name="ID" value=${item.ID} />
											<input type="submit" value="Edit">
										</form>
									</td>
									<td>
										<form action="uploadproductitem">
											<input type="hidden" name="ID" value=${item.ID} />
											<input type="submit" value="Upload">
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="cloth" class="tabcontent">
					<h1 class="text-center" style="margin: 20px 0px;">Clothing List</h1>
					<table id="cloth" class="table table-sm table-striped table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Provider</th>
								<th>ReleaseDate</th>
								<th>Summary</th>
								<th>Type</th>
								<th>Brand</th>
								<th>Color</th>
								<th>Gender</th>
								<th>Action1</th>
								<th>Action2</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listClothes}" var="item" varStatus="i">
								<tr>
									<td>${item.ID}</td>
									<td>${item.name}</td>
									<td>${item.provider.name}</td>
									<td>${item.releaseDate}</td>
									<td>${item.summary}</td>
									<td>${item.type}</td>
									<td>${item.brand}</td>
									<td>${item.color}</td>
									<td>${item.gender}</td>
									<td>
										<form action="editproduct">
											<input type="hidden" name="ID" value=${item.ID} />
											<input type="submit" value="Edit">
										</form>
									</td>
									<td>
										<form action="uploadproductitem">
											<input type="hidden" name="ID" value=${item.ID} />
											<input type="submit" value="Upload">
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div id="pitem" class="tabcontent">
					<h1 class="text-center" style="margin: 20px 0px;">Bookitem List</h1>
					<table id="bookitem" class="table table-sm table-striped table-bordered">
						<thead>
							<tr>
								<th>ProductID</th>
								<th>ID</th>
								<th>Title</th>
								<th>Author</th>
								<th>Price</th>
								<th>Discount</th>
								<th>Uploaded Date</th>
								<th>InStock Amount</th>
								<th>Action1</th>
								<th>Action2</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bookitem}" var="item" varStatus="i">
								<tr>
									<td>${item.ID}</td>
									<td>${item.book.ID}</td>
									<td>${item.book.title}</td>
									<td>${item.book.author.name}</td>
									<td>${item.price}</td>
									<td>${item.discount}</td>
									<td>${item.uploadDate}</td>
									<td>${item.inStock}</td>
									<td>
										<form action="editbookitem">
											<input type="hidden" name="ID" value=${item.book.ID} />
											<input type="submit" value="Edit">
										</form>
									</td>
									<td>
										<form action="delBitem">
											<input type="hidden" name="bookitemID" value=${item.ID} />
											<input type="submit" value="Delete">
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="ord" class="tabcontent">
					<h1 class="text-center" style="margin: 20px 0px;">Orders List</h1>
					<table id="order" class="table table-sm table-striped table-bordered">
						<thead>
							<tr>
								<th>OrderID</th>
								<th>Username</th>
								<th>ID Customer</th>
								<th>Customer Name</th>
								<th>Total Prices</th>
								<th>Total Items</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listOrders}" var="item" varStatus="i">
								<tr>
									<td>${item.ID}</td>
									<td>${item.cart.customer.user.account.username}</td>
									<td>${item.cart.customer.ID}</td>
									<td>${item.cart.customer.user.fullname.firstname}</td>
									<td>${item.cart.totalPrice}</td>
									<td>${item.cart.totalQuantity}</td>
									<td>${item.date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<form action="addnewproduct">
					<input class="button" style="margin: 20px 400px;" type="submit" value="Add Product" />
				</form>
			</div>
			<section id="maps">
				<div class="container" style="margin-top: 40px; padding-bottom: 50px;">
					<div class="title-3 wow fadeInUp" data-wow-duration="1.5s">
						<h1 style="color: rgb(255, 41, 41);">Bản đồ & Fanpage</h1>
						<div class="img-hoavan">
							<img src="images/img-hoavan.png">
						</div>
					</div>
					<div class="row wow fadeInUp" data-wow-duration="1.6s">
						<div class="col-md-8">
							<div id="map">
								<iframe
									src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59591.666042484176!2d105.7507820959328!3d21.01350656759759!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135accdd8a1ad71%3A0xa2f9b16036648187!2zSOG7jWMgdmnhu4duIGLGsHUgY2jDrW5oIHZp4buFbiB0aMO0bmcgUHRpdA!5e0!3m2!1svi!2s!4v1602036764946!5m2!1svi!2s"
									width="640" height="500" frameborder="0" style="border:0;" allowfullscreen=""
									aria-hidden="false" tabindex="0"></iframe>
							</div>
						</div class="col-md-4">
						<iframe
							src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FITPTIT%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId"
							width="340" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0"
							allowfullscreen="true"
							allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
					</div>
				</div>
			</section>

			<footer id="footer">
				<div class="footer-bottom">
					<div class="container">
						<h2 class="tt-ft-bottom wow fadeInUp" data-wow-duration="1.6s">Thông tin liên hệ</h2>
						<div class="wow animated zoomIn">
							<div class="row">
								<div class="col-md-7 col-sm-12 col-xs-12">
									<h4>Trụ sở chính TP. Hà Nội:</h3>
										<p>Số 122, Đường Hoàng Quốc Việt, Q.Cầu Giấy, Hà Nội</p>
										<h4>Cơ sở chính tại TP. Hà Nội:</h3>
											<p>Km10, Đường Nguyễn Trãi, Q.Hà Đông, Hà Nội</p>
								</div>
								<div class="col-md-5 col-sm-12 col-xs-12">
									<h4>Cơ sở 1 tại TP. Hồ Chí Minh:</h3>
										<p>11 Nguyễn Đình Chiểu, P. Đa Kao, Q.1 TP Hồ Chí Minh</p>
										<h4>Cơ sở 2 tại TP. Hồ Chí Minh:</h3>
											<p>Đường Man Thiện, P. Hiệp Phú, Q.9 TP Hồ Chí Minh</p>
								</div>
							</div>
						</div>
						<br><br><br>
						<div class="copy-right">
							<span style="text-align: center;">Copyright © 2023 Website ECommerce</span>
						</div>
					</div>
				</div>
				</div>
			</footer>

			<script>
				function openCity(evt, cityName) {
					var i, tabcontent, tablinks;
					tabcontent = document.getElementsByClassName("tabcontent");
					for (i = 0; i < tabcontent.length; i++) {
						tabcontent[i].style.display = "none";
					}
					tablinks = document.getElementsByClassName("tablinks");
					for (i = 0; i < tablinks.length; i++) {
						tablinks[i].className = tablinks[i].className.replace(" active", "");
					}
					document.getElementById(cityName).style.display = "block";
					evt.currentTarget.className += " active";
				}
			</script>

			<script>
				var MenuItems = document.getElementById("MenuItems");
				MenuItems.style.maxHeight = "0px";
				function menutoggle() {
					if (MenuItems.style.maxHeight == "0px") {
						MenuItems.style.maxHeight = "200px"
					}
					else {
						MenuItems.style.maxHeight = "0px"
					}
				}
			</script>

			<script>
				$(document).ready(function () {
					$('#customer').DataTable();
				});
			</script>
			<script>
				$(document).ready(function () {
					$('#comics').DataTable();
				});
			</script>
			<script>
				$(document).ready(function () {
					$('#textBook').DataTable();
				});
			</script>

			<script>
				$(document).ready(function () {
					$('#lightNovel').DataTable();
				});
			</script>

			<script>
				$(document).ready(function () {
					$('#bookitem').DataTable();
				});
			</script>

			<script>
				$(document).ready(function () {
					$('#order').DataTable();
				});
			</script>

			<script>
				function editbook(ISBN) {
					$.ajax({
						url: 'editbook',
						type: 'POST',
						data: {
							ISBN,
						},
						complete: function (xhr, textStatus) {
							console.log(xhr.status);
						}
					});
				}
			</script>

		</body>

		</html>