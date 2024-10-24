
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
		
			<div class="col-md-7" >
                 <img src="resources/img/register.jpg" width="100%" height="100%"/>
            </div>
			<div class="col-md-5">
				<div class="box">
				<center><h5 class="badge badge-info">REGISTER NOW</h5></center>
				<h5 id="msg"class="center-align"></h5>
					<hr>
					<form action="register.jsp" method="post" enctype="multipart/form-data" id="myform">
						<div class="form-group">
							
							<input type="text" class="form-control" name="cus_name" placeholder="Name" required>
						</div>
						<div class="form-group">
							
							<input type="email" class="form-control" name="cus_email" placeholder="Email" required>
						</div>
						<div class="form-group">
						
							<input type="password" class="form-control" id="cpass" placeholder="Password" name="cus_pass"   required>
						</div>
						<div class="form-group">
						
							<input type="password" class="form-control" id="ccpass" name="cus_cpass" placeholder="Confirm Password"  required>
						</div>
						<div id="showErrorccpass">
							
						</div>
						<div class="form-group">
							
							<!-- <input type="text" pattern="[0]{1}[0-9]{9}" length="10" class="form-control" placeholder="Phone Number" name="cus_pno"  onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Phone is not valid, Please enter a valid phone number' : ''); if(this.checkValidity()) form.cus_cpass.pattern = this.value;" required> -->
							<input type="text"  length="10" class="form-control" placeholder="Phone Number" name="cus_pno"  onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Phone is not valid, Please enter a valid phone number' : '');" required>
						</div>
						<div class="form-group">
							
							<input type="text" class="form-control" name="cus_address" placeholder="Address" required>
						</div>
						<div class="form-group">
							
							<input type="text" class="form-control" name="cus_city" placeholder="City" required>
						</div>
						<div class="form-group">
						
							<input type="file" accept="image/*" class="form-control" palceholder="Profile Picture"  name="cus_dp" >
						</div>
						<!-- <center>
							<div class="g-recaptcha" data-sitekey="6LdScHYUAAAAAE9U_bKNKWJacA5WvGEIetd3lhbV"></div>
						</center> -->
						<br>
						<div class="text-center">
							<button type="submit" name="register" class="btn btn-success">
								<i class="fa fa-envelope"></i> Register
							</button>
							<button type="reset" name="clear" class="btn btn-danger">
								<i class="fa fa-trash"></i> Clear
							</button>
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
<!--	Google Recaptcha -->
	<script src='https://www.google.com/recaptcha/api.js'></script>


 <script>
  	$(document).ready(function(){
  		console.log("page is ready .....")
  		
  		$("#myform").on('submit',function(event){
  			event.preventDefault();
			var f=$(this).serialize();
			
  			$.ajax({
  				url:"register",
  				data:f,
  				type:'POST',
  				success:function(data,textStatus,jqXHR){
  					 
  				if(data.trim() ==='done'){
  		  				$('#msg').html("Successfully Registred!")
  		  				$('#msg').addClass('green-text')
  		  			}else{
  		  				$('#msg').html("Something went wrong on server!")
  		  				$('#msg').addClass('red-text')
  		  			}
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log(data);
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


