
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
	<h3 style="text-transform: uppercase; font-weight: 700;">Change Password</h3>
	<p class="text-info">Change your password, use strong password</p>
	<hr>
</center>
<form action="./customer" id="changePasswordForm" method="post" >
			<div class="form-group">
				<label for="">Current Password</label>
				<input type="password" class="form-control" name="old_pass" required>
				<input type="hidden"  name="event" value="change_password" >
			</div>
			<div class="form-group">
				<label for="">Password</label>
				<input type="password" class="form-control" id="txtNewPassword" name="new_pass" required>
			</div>
			<div class="form-group">
				<label for="">Confirm Password</label>
				<input type="password" class="form-control" name="new_cpass" id="txtCnfPassword" required>
			</div>
			<div class="text-center">
				<input type="submit" id="changePsw" name="changepassword" class="btn btn-success">
					<i class="fa fa-edit"></i>
				
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
	   $(document).ready(function(){
	    	$('#txtCnfPassword').change(function(){
	    		let pass=$('#txtNewPassword').val();
	    		let newpass=$(this).val();
	    		if(pass!=newpass)
	    			{
	    			alert("password and confirm password is not same");
	    			$(this).focus();
	    			}
	    	});
	    });

	</script>
	
</body>
	
	
</html>


