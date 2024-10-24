
<%@page import="com.otz.dao.DbConnection" %>
<%@page import="java.sql.*" %>
<%
if (session.getAttribute("username") == null || session.getAttribute("username").equals(""))
{
	response.sendRedirect("login.jsp");
}%>
<!DOCTYPE html>
<html>

<head>
	
	<title></title>
	
	
	<!--Add CSS Files-->
	<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet"  type="text/css" href="resources/font-awesome/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
	
	
</head>
	
<body>
	
<%@include file="include/header.jsp" %>
	
	
	<div id="content">
		<div class="container">
			<div class="col-md-12">
				<ul class="breadcrumb">
					<li>
						<a href="index.jsp">Home</a>
					</li>
					<li>
						<a href="myAccount.jsp">My Account</a>
					</li>
				</ul>
			</div>
<!--			Profile Panel Start	-->
			<div class="col-md-3">
<%@include file="include/sideProfile.jsp" %>
			</div>
			<div class="col-md-9">
				<div class="box">
		<center>
			<h3 style="text-transform: uppercase; font-weight: 700;">Edit Your Profile</h3>
			<p class="text-info">Edit your account details</p>
			<hr>
		</center>
		<form action="./customer" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="">Name</label>
						<input type="text" id="cusName" class="form-control" name="cus_name"  required>
						<input type="hidden" name="event" value="UpdateProfile">
					</div>
					<div class="form-group">
						<label for="">Email</label>
						<input type="email" id="cusEmail" class="form-control" name="cus_email"  required>
					</div>
					<div class="form-group">
						<label for="">Phone Number</label>
						<input type="text" id="phNumber" class="form-control" name="cus_pno"  required>
					</div>
					<div class="form-group">
						<label for="">Address</label>
						<input type="text" id="cusAddress" class="form-control" name="cus_address"  required>
					</div>
					<div class="form-group">
						<label for="">City</label>
						<input type="text" id="cusCity" class="form-control" name="cus_city"  required>
					</div>
					<div class="form-group">
						<label for="">Profile Picture</label>
						<input type="file" id="profileImg" class="form-control" name="cus_dp" required>
					</div>
					<div class="text-center">
						<input type="submit" name="editprofile" value="Update" class="btn btn-success">
							
					</div>
		</form>
		
		
							
				</div>
			</div>
		</div>
	</div>


	
<!--Add JavaScript Files-->
	<script src="resources/js/jquery.min.js"></script>	
	<script src="resources/js/bootstrap.min.js"></script>
	<!--Footer Start-->
	<%@include file="include/footer.jsp" %>
	
	
	 <script>
			$(document).ready(function() {
                	
              $.ajax({
				    type:'POST',
				    url:'customer',
					data:{'event':'fatchCustomerById'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						
						$("#cusName").val(data[0].cusName);
	    				$("#cusEmail").val(data[0].cusEmail);
	    				$("#phNumber").val(data[0].cusPNum);
	    				$("#cusAddress").val(data[0].cusAddress);
	    				$("#cusCity").val(data[0].cusCity);
	    				$("#profileImg").val(data[0].cusImage);
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  					}
				    });	
                	   
				 });
           </script>
</body>
	
	
</html>



