<%@page import="com.otz.dao.DbConnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	
	<title>MEDICARE</title>
	
	
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
						<a href="register.jsp">Register</a>
					</li>
				</ul>
			</div>
			<div class="col-md-8" style="background-image:url('resources/img/login.jpg');height:455px;">
			
            </div>
			<div class="col-md-4">
				<div class="box">
					<center><h5 class="pill">LOGIN NOW</h5></center>
					<hr>
					<form  method="post"  id="customer_login" enctype="multipart/form-data">
						<div class="form-group">
						
							<input type="email" class="form-control" name="cus_email" placeholder="Email" required>
							<input type="hidden" name="event" value="loginCustomer">
						</div>
						<div class="form-group">
							
							<input type="password" class="form-control"  placeholder="Password" name="cus_pass" required>
						</div>
						
						<br>
						<div class="text-center">
							<button type="submit" name="customerlogin" class="btn btn-success form-control"  onClick="reload">
								<i class="fa fa-envelope"></i> Login
							</button>
							<br>
							<br>
							<p>Don't Have an Account!!! <a href="register.jsp">Register Here</a></p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<!--Add JavaScript Files-->
	<script src="resources/js/jquery.min.js"></script>	
	<script src="resources/js/bootstrap.min.js"></script>
	
<!--	Google Recaptcha -->
	<script src='https://www.google.com/recaptcha/api.js'></script>
	
<!--Footer Start-->
	<%@include file="include/footer.jsp" %>
	
	<script>
  	$(document).ready(function(){
  		console.log("page is ready .....")
  		
  		$("#customer_login").on('submit',function(event){
  			event.preventDefault();
			var f=$(this).serialize();
			
  			$.ajax({
  				url:"customer",
  				data:f,
  				type:'POST',
  				success:function(data,textStatus,jqXHR){
  					
  					
  					//console.log(typeof(data));
  					var status = JSON.parse(data);
  					
  					if(status==1){
  						alert("login Successful");
  						//alert(status);
  						/*$('#cartCounter').html(o.length);*/
  		  			    window.location.href = 'index.jsp';
  		  			}else{
  		  			alert("login failed");
  		  				$('#msg').html("Something went wrong on server!")
  		  				$('#msg').addClass('red-text')
  		  			}
  				},
				error:function(jqXHR,textStatus,errorThrown){
					//console.log(jqXHR.responseText);
  					console.log("error...")
  					
  		  			$('#msg').html("Something went wrong on server!")
  		  			$('#msg').addClass('red-text')
  				}
  			})
  		})
  	})
  </script>
	
</body>
</html>