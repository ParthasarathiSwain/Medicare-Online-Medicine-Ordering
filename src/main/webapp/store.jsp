<%@page import="com.otz.dao.DbConnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
	
	<title>Store</title>
	
	
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
						<a href="store.jsp">Shop</a>
					</li>
				</ul>
			</div>
			<div class="col-md-3">
				<%@include file="include/side.jsp" %>
			</div>
			<div class="col-md-9">
				
				<div class="row">
				    	<div id="products">
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
  		
  		getProducts();
  		getManufacturers();
  		getCategory();
  	});
  	
  	function getProducts()
  	{
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
						   
						   s+="<div class='col-sm-4 col-sm-6 center-responsive'>";
						   s+="<div class='product' >";
					   s+="<a href='king?productId="+data[key].productId+"'>";
					   s+="<img src='admin/resources/img/product_img/"+data[key].image1+"' class='img-responsive' alt=''></a>";
					   s+="<div class='text'><h4><a href='king?productId="+data[key].productId+"'>"+data[key].productName+"</a></h4>";
					   s+="<p class='price'>Rs"+data[key].productPrice+"</p>";
					   s+="<p class='buttons'>";
					   s+="<a href='details.jsp?productId="+data[key].productId+"' class='btn btn-warning'>More</a>";
					   s+="<a href='details.jsp?productId="+data[key].productId+"' class='btn btn-info'>";
					   s+="<i class='fa fa-shopping-cart'> Add to Cart</i></a></p></div></div></div>";
						   
						   
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
  	}
  	
  	function getManufacturers()
  	{
  		event = "event=getManufacturers";
  		$.ajax({
			url:"manufacturer",
			data:event,
			type:"POST",
			dataType:"json",
			success:function(data,textStatus,jqXHR){ 					 
				 let s="";
				for (var key in data) {
					if (data.hasOwnProperty(key)) {
					  s+="<li><a href='#' id='"+data[key].manufactureId+"' onclick='sortByManufacture(this.id)'>"+data[key].manName+"</a></li>";
					}
				}
				$('#manufacturerlist').html(s);
				console.log("success...")
	  			
			},
		error:function(jqXHR,textStatus,errorThrown){
			console.log(jqXHR.responseText);
				console.log("error...")
				
			}
		
	});
  	}
  	function getCategory()
  	{
  		event = "event=getCategory";
  		$.ajax({
			url:"category",
			data:event,
			type:"POST",
			dataType:"json",
			success:function(data,textStatus,jqXHR){ 					 
				console.log(data);
				
				 let s="";
				for (var key in data) {
					if (data.hasOwnProperty(key)) {
					 
					  s+="<li><a href='#' id='"+data[key].categoryId+"' onclick='sortByCategory(this.id)'>"+data[key].catName+"</a></li>";
					  
					   
					}
				}
				$('#catagorylist').html(s);
				console.log("success...")
	  			
			},
		error:function(jqXHR,textStatus,errorThrown){
			console.log(jqXHR.responseText);
				console.log("error...")
				
			}
		
	});
  		
  	}
  	
  	
  	    function sortByManufacture(mid)
		{
			event = "sortManufacture";
			
	  		$.ajax({
					url:"king",
					data:{"event":event,"mid":mid},
					type:"POST",
					dataType:"json",
					success:function(data,textStatus,jqXHR){ 					 
						//console.log(data);
						let i=1;
						 let s="";
						for (var key in data) {
							if (data.hasOwnProperty(key)) {
							  
							   s+="<div class='col-sm-4 col-sm-6 center-responsive'>";
							s+="<div class='product' >";
						   s+="<a href='king?productId="+data[key].productId+"'>";
						   s+="<img src='admin/resources/img/product_img/"+data[key].image1+"' class='img-responsive' alt=''></a>";
						   s+="<div class='text'><h4><a href='king?productId="+data[key].productId+"'>"+data[key].productName+"</a></h4>";
						   s+="<p class='price'>Rs"+data[key].productPrice+"</p>";
						   s+="<p class='buttons'>";
						   s+="<a href='details.jsp?productId="+data[key].productId+"' class='btn btn-warning'>More</a>";
						   s+="<a href='king?productId="+data[key].productId+"' class='btn btn-info'>";
						   s+="<i class='fa fa-shopping-cart'> Add to Cart</i></a></p></div></div></div>";
							   
							   
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
		}
  	    
  	  function sortByCategory(cid)
  	  {
  		event = "sortByCategory";
  		$.ajax({
				url:"king",
				data:{"event":event,"cid":cid},
				type:"POST",
				dataType:"json",
				success:function(data,textStatus,jqXHR){ 					 
					//console.log(data);
					let i=1;
					 let s="";
					for (var key in data) {
						if (data.hasOwnProperty(key)) {
						   
						   s+="<div class='col-sm-4 col-sm-6 center-responsive'>";
						   s+="<div class='product' >";
					   s+="<a href='king?productId="+data[key].productId+"'>";
					   s+="<img src='admin/resources/img/product_img/"+data[key].image1+"' class='img-responsive' alt=''></a>";
					   s+="<div class='text'><h4><a href='king?productId="+data[key].productId+"'>"+data[key].productName+"</a></h4>";
					   s+="<p class='price'>Rs"+data[key].productPrice+"</p>";
					   s+="<p class='buttons'>";
					   s+="<a href='details.jsp?productId="+data[key].productId+"' class='btn btn-warning'>More</a>";
					   s+="<a href='king?productId="+data[key].productId+"' class='btn btn-info'>";
					   s+="<i class='fa fa-shopping-cart'> Add to Cart</i></a></p></div></div></div>";     
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
  	  }
  </script>
</body>
</html>