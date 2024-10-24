<%@page import="com.otz.dao.DbConnection" %>
<%@page import="java.sql.*" %>



<!DOCTYPE html>
<html>

<head>
	
	<title>Medicare</title>
	
	
	<!--Add CSS Files-->
	<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet"  type="text/css" href="resources/font-awesome/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
	
	
</head>
	
<body>

<%@include file="include/header.jsp" %>


<!--		SliderShow Start-->
<div class="" id="slider" style="padding-left:0px !important;padding-right:0px !important;">
		<div class="col-md-12" style="padding-left:0px !important;padding-right:0px !important;">
			<div id="slideshow1" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#slideshow1" data-slide-to="0" class="active"></li>
					<li data-target="#slideshow1" data-slide-to="1"></li>
					<li data-target="#slideshow1" data-slide-to="2"></li>
					<li data-target="#slideshow1" data-slide-to="3"></li>
					<li data-target="#slideshow1" data-slide-to="4"></li>
					<li data-target="#slideshow1" data-slide-to="5"></li>
				</ol>
				<div class="carousel-inner">
		<%
			try{
				String sql = "SELECT * FROM slider ORDER BY sliderId";
				Connection con=DbConnection.getConnection();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(sql);
				int i;
				i=1;
				while(rs.next()){
					String imgLink = rs.getString("sImage");
					if(i==1){
		 %>
					<div class='item active'><img src='admin/resources/img/slideshow/<%= imgLink %> 'class='slideimg'></div>
		 <%
					}else{
						%>
						<div class='item'><img src='admin/resources/img/slideshow/<%= imgLink %> 'class='slideimg'></div>
						<% 			
					}
					i++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
</div>
				<!-- <a class="left carousel-control" href="#slideshow1" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
					<span class="sr-only"> Previous </span> 
				</a>
				<a class="right carousel-control" href="#slideshow1" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
					<span class="sr-only"> Next </span> 
				</a> -->
			</div>
		</div>
	</div>
<!--	Ads Section-->
	<!-- <div id="adbox" style="margin-top:20px !important;">
		
			<div class="same-height-row">
				<?php
					 //displayAds();
				?>
			</div>
		
	</div> -->

<!--Trending Section-->
<div class="trending" style="margin-top:20px;margin-bottom:20px;">
<img src="resources/img/Medicines_banner.png" width="100%" height="150px">
	
</div>


<!--Contents Start-->
<div id="content" class="container">
	<div class="row">
		<div id="products">
		</div>
	</div>
</div>
	


	
<!--Add JavaScript Files-->
	<script src="resources/js/jquery.min.js"></script>	
	<script src="resources/js/bootstrap.min.js"></script>
	<!--Footer Start-->
	<%@include file="include/footer.jsp" %>
</body>
	<script>
  	$(document).ready(function(){
  		event = "event=gp";
  		$.ajax({
  				url:"king",
  				data:event,
  				type:"POST",
  				dataType:"json",
  				success:function(data,textStatus,jqXHR){ 					 
  					//console.log(data);
  					let i=1;
  					 let s="";
  					for (var key in data) {
  						if (data.hasOwnProperty(key)) {
  						  
  						   s+="<div class='col-sm-2 col-sm-6 single'>";
  	 			           s+="<div class='dress-card'>";
  				           s+="<div class='product dress-card-head' >";
  				           s+="<img src='admin/resources/img/product_img/"+data[key].image1+"' class='img-responsive ' style='width:200px;height:200px' alt=''>";
  				           s+="<div class='dress-card-body'>";
  				           s+="<h4 class='dress-card-title'>";
  				           s+="<a href='king?productId="+data[key].productId+"&event=getproductByName'>"+data[key].productName+"</a></h4>";
  				           s+="<p class='dress-card-para'><span class='dress-card-price'> 	&#8377; &nbsp;"+data[key].productPrice+"</p>";
  				           s+="<p class='buttons'>";
  				           s+="<a href='details.jsp?productId="+data[key].productId+"' class='btn btn-warning'>View</a>";
  				           s+="<a href='index.jsp?productId="+data[key].productId+"' class='btn btn-info'>";
  						   s+="<i class='fa fa-shopping-cart'>  </i>";
  						   s+="</a></p></div></div></div></div>";
  						   
  						   
  						}
  					}
  					$('#products').html(s);
  					console.log("success...")
  		  			
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log(jqXHR.responseText);
  					console.log("error...")
  					
  				}
  			
  		});
  	});
  </script>
	
</html>