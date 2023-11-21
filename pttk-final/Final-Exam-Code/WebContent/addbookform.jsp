<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new Book</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
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
	      <h2>Add Book Information</h2>
	    </div>
	    <div class="info">
	    	<div class="left-entry">
	      	  <input type="text" name="title" placeholder="Title" required>
		      <input type="text" name="years" placeholder="Years" required>
		      <input type="text" name="nameAuthor" placeholder="Author Name" required>
		      <input type="text" name="shortBio" placeholder="Author ShortBio" required>
		      <input type="text" name="birth" placeholder="Author Birth" required>
		      <input type="text" name="namePublisher" placeholder="Publisher Name" required>
		      <input type="text" name="address" placeholder="Publisher Address" required>
		      <input type="text" name="operateYears" placeholder="Publisher Operated Years" required>
		      <input type="text" name="summary" placeholder="Summary" required>
	      	</div>
	      	<div class="left-entry">
	      <select id="choices" name="type">
	        <option value="LN" selected>Light Novel</option>
	        <option value="CM">Comics</option>
	        <option value="TX">Text Book</option>
	      </select>
	      <p style="display: block;" class="LN">Translated Language</p><input type="text" name="translateLanguage" placeholder="Translated Language" class="LN" style="display: block;" required>
	      <p style="display: block;" class="LN">Volume</p><input type="text" name="volume" placeholder="Volume" class="LN" style="display: block;" required>
	      <p style="display: block;" class="LN">Editions</p><input type="text" name="editions" placeholder="Editions" class="LN" style="display: block;" required>
	      
	      <p style="display: none;" class="TX">Number Of Pages</p><input type="text" name="numberOfPages" placeholder="Number Of Pages" class="TX" style="display: none;" required>
	      <p style="display: none;" class="TX">Volume</p><input type="text" name="volumeTX" placeholder="Volume" class="TX" style="display: none;" required>
	      <p style="display: none;" class="TX">Editions</p><input type="text" name="editionsTX" placeholder="Editions" class="TX" style="display: none;" required>
	      
	      <p style="display: none;" class="CM">Series Name</p><input type="text" name="nameSeries" placeholder="Series Name" class="CM" style="display: none;" required>
	      <p style="display: none;" class="CM">Artist Name</p><input type="text" name="artists" placeholder="Artist Name" class="CM" style="display: none;" required>
	        </div>
	    </div>
	    <button class="margintime" type="submit" value="Submit" style="width: 20%;">Submit</button>
	     <div class="col text-center">
     		<a href="admin" style="margin:20px 0px;" class="text-center btn btn-primary btn-lg active" role="button" aria-pressed="true">Back to Admin Page</a>
    	</div>
	    
	  </form>
	  
	</div>
	<script>
  src="https://code.jquery.com/jquery-3.6.0.slim.js"
  integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
  crossorigin="anonymous"></script>
	<script>
	$("#choices").change(function () {
		  var selected_option = $('#choices').val();

		  if (selected_option === 'CM') {
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
		  if (selected_option === 'LN') {
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
		  if (selected_option === 'TX') {
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
		   frm.reset();  // Reset all form data
		   return false; // Prevent page refresh
		}
	</script>
</body>
</html>