<%@page import="com.otz.dao.DbConnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
	
<title>MEDICARE- Product Details</title>
	
	
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
					<li>
						<a href="store.jsp?category=1" id="bc_cat"></a>
					</li>
					<li>
						<a href="store.jsp?manufacture=<?php echo $productManu;?>"></a>
					</li>
				</ul>
			</div>
			<div class="col-md-3">
				<%@include file="include/side.jsp" %>
			</div>
			<div class="col-md-9">
				<div class="row" id="productarea">
					<div class="col-sm-6">
						<div id="imgMain">
							<div id="productSlideShow" class="carousel slide" data-ride="carousel">
								<ol class="carousel-indicators">
									<li data-target="#productSlideShow" data-slide-to="0" class="active"></li>
									<li data-target="#productSlideShow" data-slide-to="1"></li>
									<li data-target="#productSlideShow" data-slide-to="2"></li>
									<li data-target="#productSlideShow" data-slide-to="3"></li>
								</ol>
								<div class="carousel-inner">
									<div class="item active">
										
											<img src="" id="img1" alt="" class="img-responsive" width="100%">
										
									</div>
									<div class="item">
									
											<img src="" id="img2" alt="" class="img-responsive">
									
									</div>
									<div class="item">
									
											<img src="" id="img3" alt="" class="img-responsive">
									
									</div>
									<div class="item">
									
											<img src="" id="img4" alt="" class="img-responsive">
									
									</div>
								</div>
								
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="box">
							<h2 class="text-center" id="productName"></h2>
							
							<hr>
							<form  method="post" class="form-horizontal" id="myform">
								<div class="form-group">
									<input type="hidden" name="productId" id="productId" value="<% out.print(request.getParameter("productId"));%>" >
									<input type="hidden" name="event" value="addToCart">
								</div>
								<div class="form-group">
									<label for="" class="col-md-5 control-label">
										Quantity
									</label>
									<div class="col-md-7">
										<input type="number" name="qty" id="qty" class="form-control" min="1" value="1"/>
											
									</div>
								</div>
								
								
								<p class="price">Rs. <span id="productPrice"></span> <input type="hidden" name="unitprice" id="unitprice" value=""></p>
								<p class="text-center buttons">
									<button class="btn btn-info" type="submit" name="addCart" id="addCart">
										<i class="fa fa-shopping-cart"></i> Add to Cart
									</button>
									
								</p>
							</form>
						</div>
						<div class="row" id="thumbs">
<!--						One Image Side-->
							<div class="col-xs-3">
								<a href="#" class="thumb">
									<img src="" id="thumbImg1" alt="" class="img-responsive">
								</a>
							</div>
<!--							One Image Side End-->
<!--						One Image Side-->
							<div class="col-xs-3">
								<a href="#" class="thumb">
									<img src="" id="thumbImg2"alt="" class="img-responsive">
								</a>
							</div>
<!--							One Image Side End-->
<!--						One Image Side-->
							<div class="col-xs-3">
								<a href="#" class="thumb">
									<img src="" id="thumbImg3" alt="" class="img-responsive">
								</a>
							</div>
<!--							One Image Side End-->
<!--						One Image Side-->
							<div class="col-xs-3">
								<a href="#" class="thumb">
									<img src="" id="thumbImg4" alt="" class="img-responsive">
								</a>
							</div>
<!--							One Image Side End-->
						</div>
					</div>
				</div>
				<div class="box" id="details">
					<h4><b>Description</b></h4>
					<hr>
					<p id="productDec"></p>
					<hr>
				</div>
				<div id="row ">
					<div class="col-md-3 col-sm-6">
						<div class="box  headline">
							<h5 class="text-center">Check this products out</h5>
						</div>
					</div>
 						<div id="suggestedProducts">
 						
 						</div>
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
  		suggestProducts();
  		
  		$("#qty").change(function () {
  			
  			const price=$('#unitprice').val();
  			$('#productPrice').html(($(this).val()*price));
  		 
  		});
  	});
  	
  	function getProducts()
  	{
  		
  		productId=<% out.print(request.getParameter("productId"));%>
  		$.ajax({
				url:"king",
				data:{event:'getProductById',productId:productId},
				type:"POST",
				dataType:"json",
				success:function(data,textStatus,jqXHR){ 					 
					//console.log(data);
						 $("#productName").html(data.productName);
						 $("#img1").attr('src','admin/resources/img/product_img/'+data.image1);
						 $("#img2").attr('src','admin/resources/img/product_img/'+data.image2);
						 $("#img3").attr('src','admin/resources/img/product_img/'+data.image3);
						 $("#img4").attr('src','admin/resources/img/product_img/'+data.image4);
						 $("#thumbImg1").attr('src','admin/resources/img/product_img/'+data.image1);
						 $("#thumbImg2").attr('src','admin/resources/img/product_img/'+data.image2);
						 $("#thumbImg3").attr('src','admin/resources/img/product_img/'+data.image3);
						 $("#thumbImg4").attr('src','admin/resources/img/product_img/'+data.image4);
						 $("#productPrice").html(data.productPrice);
						 $("#productDec").html(data.productDetails);
						 $("#unitprice").val(data.productPrice);
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
				//console.log(data);
				
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
				//console.log(data);
				
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
						   s+="<a href='details.jsp?productId="+data[key].productId+"'>";
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
					   s+="<div class='product same-height'>";
					   s+="<a href='details.jsp?productId="+data[key].productId+"'>";
					   s+="<img src='admin/resources/img/product_img/"+data[key].image1+"' class='img-responsive' alt=''></a>";
					   s+="<div class='text'><h4><a href='details.jsp?productId="+data[key].productId+"'>"+data[key].productName+"</a></h4>";
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
  	function suggestProducts()
  	{
  		$.ajax({
				url:"king",
				data:{event:'getSuggestedProduct'},
				type:"POST",
				dataType:"json",
				success:function(data,textStatus,jqXHR){ 					 
				console.log(data);
				 let s="";
					for (var key in data) {
						if (data.hasOwnProperty(key)) {
							
						   s+="<div class='center-responsive col-md-3 col-sm-6'>";
						   s+="<div class='product' >";
						   s+="<a href='details.jsp?productId="+data[key].productId+"'>";
						   s+="<img src='admin/resources/img/product_img/"+data[key].image1+"' class='img-responsive' alt=''></a>";
						   s+="<div class='text'><h4><a href='details.jsp?productId="+data[key].productId+"'>"+data[key].productName+"</a></h4>";
						   s+="<p class='price'>Rs"+data[key].productPrice+"</p></div></div></div>";     
						}
					}
					$('#suggestedProducts').html(s);
					console.log("success...")
				},
			error:function(jqXHR,textStatus,errorThrown){
				console.log(jqXHR.responseText);
					console.log("error...")
					
				}
			
		});
  	}
  	
  	
  </script>
  <script>
  	$(document).ready(function(){
  		$("#myform").on('submit',function(event){
  			event.preventDefault();
			var f=$(this).serialize();
			
  			$.ajax({
  				url:"cart",
  				data:f,
  				type:'POST',
  				success:function(data,textStatus,jqXHR){
  					if(data=="nocart"){
  						window.location.href ="login.jsp"; 
  					}
  					else{
  						
  						var o = JSON.parse(data);
  						$('#cartCounter').html(o.length); 
  					   
  					}
  						
  				},
				error:function(jqXHR,textStatus,errorThrown){
					
  					console.log("error...")
  					
  				}
  			})
  		})
  	})
  </script>
</body>
</html>
<?php
	addWishList();
?>