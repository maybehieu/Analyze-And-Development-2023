<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add new Product</title>
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
			<form action="processAdd" method="POST">
				<div class="title">
					<i class="fas fa-pencil-alt"></i>
					<h2>Add Product Information</h2>
				</div>
				<div class="info">
					<div class="left-entry">
						<input type="text" name="name" placeholder="Name" required>
						<input type="text" name="releaseDate" placeholder="Release Date" required>
						<input type="text" name="providerName" placeholder="Provider Name" required>
						<input type="text" name="address" placeholder="Provider Address" required>
						<input type="text" name="summary" placeholder="Summary" required>
					</div>
					<div class="left-entry">
						<select id="choices" name="category">
							<option value="B" selected>Book</option>
							<option value="P">Phone</option>
							<option value="C">Clothing</option>
						</select>
						<p style="display: block;" class="B">Author</p><input type="text" name="author"
							placeholder="Author's name" class="B" style="display: block;" required>
						<p style="display: block;" class="B">Category</p><input type="text" name="bookCategory"
							placeholder="Book's category" class="B" style="display: block;" required>
						<p style="display: block;" class="B">Number of Pages</p><input type="text" name="pageNum"
							placeholder="Page number" class="B" style="display: block;" required>
						<p style="display: block;" class="B">Volume</p><input type="text" name="volume"
							placeholder="Volume" class="B" style="display: block;" required>

						<p style="display: none;" class="P">Type of Phone</p><input type="text" name="phoneType"
							placeholder="Type" class="P" style="display: none;" required>
						<p style="display: none;" class="P">Brand of Phone</p><input type="text" name="phoneBrand"
							placeholder="Brand" class="P" style="display: none;" required>
						<p style="display: none;" class="P">Model</p><input type="text" name="model" placeholder="Model"
							class="P" style="display: none;" required>
						<p style="display: none;" class="P">Specification</p><input type="text" name="spec"
							placeholder="Specification" class="P" style="display: none;" required>

						<p style="display: none;" class="C">Type of Clothing</p><input type="text" name="clothesType"
							placeholder="Type" class="C" style="display: none;" required>
						<p style="display: none;" class="C">Brand of Clothing</p><input type="text" name="clothesBrand"
							placeholder="Brand" class="C" style="display: none;" required>
						<p style="display: none;" class="C">Color</p><input type="text" name="color" placeholder="Color"
							class="C" style="display: none;" required>
						<p style="display: none;" class="C">Gender</p><input type="text" name="gender"
							placeholder="Gender" class="C" style="display: none;" required>
					</div>
				</div>
				<button class="margintime" type="submit" value="Submit" style="width: 20%;">Submit</button>
				<div class="col text-center">
					<a href="admin" style="margin:20px 0px;" class="text-center btn btn-primary btn-lg active"
						role="button" aria-pressed="true">Back to Admin Page</a>
				</div>

			</form>

		</div>
		<script>
			src = "https://code.jquery.com/jquery-3.6.0.slim.js"
			integrity = "sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
			crossorigin = "anonymous" ></script>
		<script>
				$("#choices").change(function () {
					var selected_option = $('#choices').val();

					if (selected_option === 'B') {
						[].forEach.call(document.querySelectorAll('.B'), function (el) {
							el.required = false;
							el.style.display = 'block';
						});
						[].forEach.call(document.querySelectorAll('.P'), function (el) {
							el.style.display = 'none';
							el.required = false;
						});
						[].forEach.call(document.querySelectorAll('.C'), function (el) {
							el.style.display = 'none';
							el.required = false;
						});
					}
					if (selected_option === 'C') {
						[].forEach.call(document.querySelectorAll('.B'), function (el) {
							el.style.display = 'none';
							el.required = false;
						});
						[].forEach.call(document.querySelectorAll('.P'), function (el) {
							el.style.display = 'none';
							el.required = false;
						});
						[].forEach.call(document.querySelectorAll('.C'), function (el) {
							el.style.display = 'block';
							el.required = false;
						});
					}
					if (selected_option === 'P') {
						[].forEach.call(document.querySelectorAll('.B'), function (el) {
							el.style.display = 'none';
							el.required = false;
						});
						[].forEach.call(document.querySelectorAll('.P'), function (el) {
							el.style.display = 'block';
							el.required = false;
						});
						[].forEach.call(document.querySelectorAll('.C'), function (el) {
							el.style.display = 'none';
							el.required = false;
						});
					}
				})
		</script>
		<script>
			function submitForm() {
				// Get the first form with the name
				// Usually the form name is not repeated
				// but duplicate names are possible in HTML
				// Therefore to work around the issue, enforce the correct index
				var frm = document.getElementsByName('contact-form')[0];
				frm.submit(); // Submit the form
				console.log("Form Submitted!")
				frm.reset();  // Reset all form data
				return false; // Prevent page refresh
			}
		</script>
	</body>

	</html>