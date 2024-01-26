<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/formstyle.css">
</head>
<body>
	<div class="main-block">
	  <form action="processedit" method="POST">
	    <div class="title">	
	      <i class="fas fa-pencil-alt"></i> 
	      <h2>Edit Product Information</h2>
	    </div>
	    <div class="info">
	    	<div class="left-entry">
	    	  <p>ID</p><input type="text" name="ID" placeholder="ID" required value="${ID}" readonly>
	      	  <p>Name</p><input type="text" name="name" placeholder="Name" required value="${name}">
		      <p>Release Date</p><input type="text" name="releaseDate" placeholder="Release Date" required value="${releaseDate}">
		      </div>
		      <div class="left-entry">
		      <p>Provider Name</p><input type="text" name="providerName" placeholder="Publisher Name" required value="${providerName}">
		      <p>Provider Address</p><input type="text" name="address" placeholder="Provider Address" required value="${address}">
		      <p>Summary</p><input type="text" name="summary" placeholder="Summary" required value="${summary}">
	      	</div>
	      	<div class="left-entry">
	      <p style="display: block;" >Product Category</p><input id="category" type="text" name="category" placeholder="Category" required value="${category}" readonly>
	      <input type="text" name="itemID" placeholder="itemID" required value="${itemID}" readonly hidden>
	      
	      <!-- <p style="display: none;" class="LN">Translated Language</p><input type="text" name="translateLanguage" placeholder="Translated Language" class="LN" 
		  style="display: none;" required value="${translateLanguage}">
	      <p style="display: none;" class="LN">Volume</p><input type="text" name="volume" placeholder="Volume" class="LN" style="display: none;" required value="${volume}">
	      <p style="display: none;" class="LN">Editions</p><input type="text" name="editions" placeholder="Editions" class="LN" style="display: none;" required value="${editions}"> -->
	      <p style="display: block;" class="B">Author</p><input type="text" name="author"
							placeholder="Author's name" class="B" style="display: block;" required value="${author}">
						<p style="display: block;" class="B">Category</p><input type="text" name="bookCategory"
							placeholder="Book's category" class="B" style="display: block;" required value="${bookCategory}">
						<p style="display: block;" class="B">Number of Pages</p><input type="text" name="pageNum"
							placeholder="Page number" class="B" style="display: block;" required value="${pageNum}">
						<p style="display: block;" class="B">Volume</p><input type="text" name="volume"
							placeholder="Volume" class="B" style="display: block;" required value="${volume}">


	      <!-- <p style="display: none;" class="TX">Number Of Pages</p><input type="text" name="numberOfPages" placeholder="Number Of Pages" class="TX" style="display: none;" required value="${numberOfPages}">
	      <p style="display: none;" class="TX">Volume</p><input type="text" name="volumeTX" placeholder="Volume" class="TX" style="display: none;" required value="${volumeTX}">
	      <p style="display: none;" class="TX">Editions</p><input type="text" name="editionsTX" placeholder="Editions" class="TX" style="display: none;" required value="${editionsTX}"> -->
	      <p style="display: none;" class="P">Type of Phone</p><input type="text" name="phoneType"
							placeholder="Type" class="P" style="display: none;" required value="${phoneType}">
						<p style="display: none;" class="P">Brand of Phone</p><input type="text" name="phoneBrand"
							placeholder="Brand" class="P" style="display: none;" required value="${phoneBrand}">
						<p style="display: none;" class="P">Model</p><input type="text" name="model" placeholder="Model"
							class="P" style="display: none;" required value="${model}">
						<p style="display: none;" class="P">Specification</p><input type="text" name="spec"
							placeholder="Specification" class="P" style="display: none;" required value="${spec}">

	      <!-- <p style="display: none;" class="CM">Series Name</p><input type="text" name="nameSeries" placeholder="Series Name" class="CM" style="display: none;" required value="${nameSeries}">
	      <p style="display: none;" class="CM">Artist Name</p><input type="text" name="artists" placeholder="Artist Name" class="CM" style="display: none;" required value="${artists}"> -->
		  <p style="display: none;" class="C">Type of Clothing</p><input type="text" name="clothesType"
		  placeholder="Type" class="C" style="display: none;" required value="${clothesType}">
	  <p style="display: none;" class="C">Brand of Clothing</p><input type="text" name="clothesBrand"
		  placeholder="Brand" class="C" style="display: none;" required value="${clothesBrand}">
	  <p style="display: none;" class="C">Color</p><input type="text" name="color" placeholder="Color"
		  class="C" style="display: none;" required value="${color}">
	  <p style="display: none;" class="C">Gender</p><input type="text" name="gender"
		  placeholder="Gender" class="C" style="display: none;" required value="${gender}">
  
		</div>
	    </div>
	    <button class="margintime" type="submit" value="Submit" style="width: 20%;">Submit</button>
	    <div class="col text-center">
     		<a href="admin" style="margin:20px 0px;" class="text-center btn btn-primary btn-lg active" role="button" aria-pressed="true">Back to Admin Page</a>
    	</div>
	  </form>
	</div>
	<script
  src="https://code.jquery.com/jquery-3.6.0.slim.js"
  integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
  crossorigin="anonymous"></script>
	<script defer>
		console.log('smt');
		  var myInput = document.getElementById("category").value;
		  console.log(myInput);
		  if (myInput === "Book") {
		  [].forEach.call(document.querySelectorAll('.B'), function (el) {
			  el.required = true;
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
		  if (myInput === "Phone") {
			  [].forEach.call(document.querySelectorAll('.B'), function (el) {
				  el.style.display = 'none';
				  el.required = false;
				});
			  [].forEach.call(document.querySelectorAll('.C'), function (el) {
				  el.style.display = 'none';
				  el.required = false;
				});
			  [].forEach.call(document.querySelectorAll('.P'), function (el) {
				  el.style.display = 'block';
				  el.required = true;
				});
		  }
		  if (myInput === "Clothes") {
			  [].forEach.call(document.querySelectorAll('.B'), function (el) {
				  el.style.display = 'none';
				  el.required = false;
				});
			  [].forEach.call(document.querySelectorAll('.C'), function (el) {
				  el.style.display = 'block';
				  el.required = true;
				});
			  [].forEach.call(document.querySelectorAll('.P'), function (el) {
				  el.style.display = 'none';
				  el.required = false;
				});
		  }
	</script>
</body>
</html>