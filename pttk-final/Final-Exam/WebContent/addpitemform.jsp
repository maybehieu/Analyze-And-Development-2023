<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add new Bookitem</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
			integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
		<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
		<link rel="stylesheet" href="css/formstyle.css">
	</head>

	<body>
		<div class="main-block">
			<form action="processadditem" method="POST">
				<div class="title">
					<i class="fas fa-pencil-alt"></i>
					<h2>Add ProductItem Information</h2>
				</div>
				<div class="info">
					<div class="left-entry">
						<p>ID</p><input type="text" name="ID" placeholder="ID" required value="${ID}" readonly>
						<p>Added Date</p><input type="text" name="addedDate" placeholder="Added Date"
							value="${addedDate}" required readonly>
						<p>Price</p><input type="text" name="price" placeholder="Price" required>
						<p>Discount</p><input type="text" name="discount" placeholder="Discount" required>
						<p>Instock</p><input type="text" name="inStock" placeholder="Instock" required>
					</div>
				</div>
				<button class="margintime" type="submit" value="Submit" style="width: 20%;">Submit</button>
				<div class="col text-center">
					<a href="admin" style="margin:20px 0px;" class="text-center btn btn-primary btn-lg active"
						role="button" aria-pressed="true">Back to Admin Page</a>
				</div>
			</form>
		</div>
	</body>

	</html>