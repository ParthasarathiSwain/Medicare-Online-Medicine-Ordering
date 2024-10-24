<%@page import="com.otz.dao.DbConnection" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>

<head>
	
	<title>MEDICARE</title>
	
	
	<!--Add CSS Files-->
	<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet"  type="text/css" href="resources/font-awesome/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
	<script>tinymce.init({ selector:'textarea' });</script>
	
</head>
	
<body>
	
<%@include file="include/header.jsp" %>
	
	
	<div id="content">
		<div class="container">
			<div class="col-md-12">
				<ul class="breadcrumb">
					<li>
						<a href="index.php">Home</a>
					</li>
					<li>
						<a href="shop.php">Contact Us</a>
					</li>
				</ul>
			</div>
			<div class="col-md-8">
				<div class="box">
					<div class="box-header" style="background-color:#111957;color:#FFFFFF">
						<center>
							<h2>Contact Us</h2>
							
						</center>
					</div>
					<form action="./contact" method="post">
						<div class="form-group">
							<label for="">Department</label>
							<select name="department" class="form-control" id="deptName">
								<option value="account">Billing</option>
								<option value="customer">Products</option>
								<option value="other">Other</option>
							</select>
						</div>
						<div class="form-group">
							<label for="">Your Name</label>
							<input type="text" class="form-control" name="name" required>
							<input type="hidden"  name="event" value="saveContactUs">
						</div>
						<div class="form-group">
							<label for="">Your Email</label>
							<input type="email" class="form-control" name="email" required>
						</div>
	
					
						<div class="form-group">
							<label for="">Subject</label>
							<input type="text" class="form-control" name="subject" required>
						</div>
						<div class="form-group">
							<label for="">Message</label>
							<textarea name="message" class="form-control" cols="19" rows="5"></textarea>
						</div>
						<div class="text-center">
							<input type="submit" name="contactus" value="Send" class="btn btn-success form-control" style="width: 10%;">
							<input type="reset" name="clear" value="Clear" class="btn btn-danger form-control" style="width: 10%;">
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-4">
			<div class="box" style="height:765px;">
					<div>
						
							<h2 class="alert"></h2>
						    <hr>
							<h5 class="alert alert-success">Our Address</h5>
<p>House no. 10, unit-1, Bhubaneswar, Odisha, India</p>
<h5 class="alert alert-success">Phone Number</h5>
<p>+91 70088 33767<p>
<p>+91 98539 11782</p>
<h5 class="alert alert-success">Web Address</h5>
<p>info@medlife.com</p>
<p>medlife570@gmail.com</p>
<p>www.medlife.com</p>
					</div>
				
				</div>
            </div>
		</div>
	</div>
	
	
	

	
<!--Add JavaScript Files-->
	<script src="resources/js/jquery.min.js"></script>	
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  	<script>tinymce.init({ selector:'textarea' });</script>
<!--Footer Start-->
	<%@include file="include/footer.jsp" %>
</body>
</html>


<?php
	@contactUs(); //hiding phpmailer unwanted error msg using @
?>