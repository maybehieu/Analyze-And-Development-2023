<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Book</title>
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
	      <h2>Edit Book Information</h2>
	    </div>
	    <div class="info">
	    	<div class="left-entry">
	    	  <p>ISBN</p><input type="text" name="ISBN" placeholder="ISBN" required value="${ISBN}" readonly>
	      	  <p>Title</p><input type="text" name="title" placeholder="Title" required value="${title}">
		      <p>Years</p><input type="text" name="years" placeholder="Years" required value="${years}">
		      <p>Author Name</p><input type="text" name="nameAuthor" placeholder="Author Name" required value="${nameAuthor}"> 
		      <p>Author ShortBio</p><input type="text" name="shortBio" placeholder="Author ShortBio" required value="${shortBio}">
		      <p>Author Birth</p><input type="text" name="birth" placeholder="Author Birth" required value="${birth}">
		      </div>
		      <div class="left-entry">
		      <p>Publisher Name</p><input type="text" name="namePublisher" placeholder="Publisher Name" required value="${namePublisher}">
		      <p>Publisher Address</p><input type="text" name="address" placeholder="Publisher Address" required value="${address}">
		      <p>Publisher Operated Years</p><input type="text" name="operateYears" placeholder="Publisher Operated Years" required value="${operateYears}">
		      <p>Summary</p><input type="text" name="summary" placeholder="Summary" required value="${summary}">
	      	</div>
	      	<div class="left-entry">
	      <p style="display: block;" >Book Type</p><input id="booktype" type="text" name="type" placeholder="Type" required value="${type}" readonly>
	      <input type="text" name="ID" placeholder="ID" required value="${ID}" readonly hidden>
	      
	      <p style="display: none;" class="LN">Translated Language</p><input type="text" name="translateLanguage" placeholder="Translated Language" class="LN" style="display: none;" required value="${translateLanguage}">
	      <p style="display: none;" class="LN">Volume</p><input type="text" name="volume" placeholder="Volume" class="LN" style="display: none;" required value="${volume}">
	      <p style="display: none;" class="LN">Editions</p><input type="text" name="editions" placeholder="Editions" class="LN" style="display: none;" required value="${editions}">
	      
	      <p style="display: none;" class="TX">Number Of Pages</p><input type="text" name="numberOfPages" placeholder="Number Of Pages" class="TX" style="display: none;" required value="${numberOfPages}">
	      <p style="display: none;" class="TX">Volume</p><input type="text" name="volumeTX" placeholder="Volume" class="TX" style="display: none;" required value="${volumeTX}">
	      <p style="display: none;" class="TX">Editions</p><input type="text" name="editionsTX" placeholder="Editions" class="TX" style="display: none;" required value="${editionsTX}">
	      
	      <p style="display: none;" class="CM">Series Name</p><input type="text" name="nameSeries" placeholder="Series Name" class="CM" style="display: none;" required value="${nameSeries}">
	      <p style="display: none;" class="CM">Artist Name</p><input type="text" name="artists" placeholder="Artist Name" class="CM" style="display: none;" required value="${artists}">
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
		  var myInput = document.getElementById("booktype").value;
		  console.log(myInput);
		  if (myInput === "Comics") {
		  [].forEach.call(document.querySelectorAll('.CM'), function (el) {
			  el.required = true;
			  el.style.display = 'block';
			});
		  [].forEach.call(document.querySelectorAll('.TX'), function (el) {
			  el.style.display = 'none';
			  el.required = false;
			});
		  [].forEach.call(document.querySelectorAll('.LN'), function (el) {
			  el.style.display = 'none';
			  el.required = false;
			});
		  }
		  if (myInput === "LightNovel") {
			  [].forEach.call(document.querySelectorAll('.CM'), function (el) {
				  el.style.display = 'none';
				  el.required = false;
				});
			  [].forEach.call(document.querySelectorAll('.TX'), function (el) {
				  el.style.display = 'none';
				  el.required = false;
				});
			  [].forEach.call(document.querySelectorAll('.LN'), function (el) {
				  el.style.display = 'block';
				  el.required = true;
				});
		  }
		  if (myInput === "TextBook") {
			  [].forEach.call(document.querySelectorAll('.CM'), function (el) {
				  el.style.display = 'none';
				  el.required = false;
				});
			  [].forEach.call(document.querySelectorAll('.TX'), function (el) {
				  el.style.display = 'block';
				  el.required = true;
				});
			  [].forEach.call(document.querySelectorAll('.LN'), function (el) {
				  el.style.display = 'none';
				  el.required = false;
				});
		  }
	</script>
</body>
</html>