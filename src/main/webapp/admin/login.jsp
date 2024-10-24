<%@page import="com.otz.dao.DbConnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Login into MEDICARE - Administrator Panel</title>
    
    <!-- Start - CSS Files Link -->
    <link rel="stylesheet" type="text/css" href="resources/css/main.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
    <!-- End - CSS Files Link -->
    
    <!-- Start - JavaScript Files Link -->
    <script type="text/javascript" src="resources/js/jquery.min.js"></script>
    <!-- End - JavaScript Files Link -->
    
</head>
<body>
<!-- Start - Signup Box-->
<div class="signup-box">    
    <!-- Start Side-->
    <div class="rightside">
    <h5 id="msg"></h5>
       <div class="form-box">
           <form method="POST"  id="admin_login">
              <div class="inputbox">
              	<h1 class="form-head" style="border-bottom: none; font-size: 40px;">MEDICARE</h1>
              	<h2 class="form-head">Admin Login</h2>
              </div>
              <div class="form-warn"></div>
               <div class="inputbox">
                   <input type="email" name="email" class="control" placeholder="Email">
               </div>
               <div class="inputbox">
                   <input type="password" name="password" class="control" placeholder="Password">
               </div>
               <div class="inputbox">
                   <input type="submit" name="adminLogin" class="btn signup-btn " value="Enter">
               </div>
           </form><h2><a style="color:red;" href="../index.jsp">Go to Home Page</a></h2>
       </div>
         
    </div>
   
    <!-- End - Right Side-->
</div>
<script>
  	$(document).ready(function(){
  		console.log("page is ready .....")
  		
  		$("#admin_login").on('submit',function(event){
  			event.preventDefault();
			var f=$(this).serialize();
			
  			$.ajax({
  				url:"../al",
  				data:f,
  				type:'POST',
  				success:function(data,textStatus,jqXHR){
  					if(parseInt(data.trim())==1){
  		  				alert("login Successful");
  		  			    window.location.href = 'index.jsp'; 
  		  			}else{
  		  				alert("login Failed!");
  		  			}
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...")
  					$('#msg').html("Something went wrong on server!")
  		  			$('#msg').addClass('red-text')
  				}
  			})
  		})
  	})
  </script>
<!-- End - Signup Box-->
</body>
</html>