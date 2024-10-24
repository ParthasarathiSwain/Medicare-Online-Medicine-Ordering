<%@page import="com.otz.dao.DbConnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <title> Add Product - Online Medicine</title>
		
		<!--Add CSS Files-->
		<link rel="stylesheet" type="text/css" href="resources/css/adminstyle.css">
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<link rel="stylesheet"  type="text/css" href="resources/font-awesome/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
		
		
	</head>
	<body>
	<div id="wrapper">
	<%@include file="include/sidepanel.jsp" %>
		<div id="page-wrapper">
			<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<br>
				<br>
				<ol class="breadcrumb">
					<li class="active">
						<i class="fa fa-dashboard"></i> Dashboard / View Product
					</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">
							<i class="fa fa-list"></i> View Products
						</div>
					</div>
					<h4 id="msg" class="" style="text-align:center"></h4>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead>
									<tr>
										<th>Id</th>
										<th>Date</th>
										<th>Name</th>
										<th>Custom URL</th>
										<th>Image</th>
										<th>Image</th>
										<th>Image</th>
										<th>Image</th>
										<th>Price</th>
										<th>Discount</th>
<!--									<th>Details</th>-->
										<th>Manufacture</th>
										<th>Category</th>
										<th>Keyword</th>
<!--									<th>Features</th>-->
										<th>Availability</th>
										<th>Expire Date</th>
										<th>Stock</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody id="viewProductsBody">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
	<!--Edit Modal dept-->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       		<form class="form-horizontal" action="../king" method="post" >
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Name</label>
								<div class="col-md-6">
									<input type="text" id="prodtName" name="productName" class="form-control" required>
									<input type="hidden" name="event" value="updateProducts">
									<input type="hidden" id="prodId" name="productId" value="updateProducts">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Custom Url</label>
								<div class="col-md-6">
									<input type="text" id="prodtUrl" name="productUrl" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Price</label>
								<div class="col-md-6">
									<input type="text" id="prodtPrice" name="productPrice" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Discount</label>
								<div class="col-md-6">
									<input type="text" id="productDiscount" name="productDiscount" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Description</label>
								<div class="col-md-6">
									<textarea id="prodtDes" name="productDes" class="form-control" cols="19" rows="6"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Manufacturer</label>
								<div class="col-md-6">
									<select  name="productManuf" class="form-control" id="prdtManu">
										<option>Choose Manufacturer</option>
									
										<%
										Connection con = DbConnection.getConnection();
									    String sql="SELECT * FROM manufacture";
									    PreparedStatement ps=con.prepareStatement(sql);  
									    
									    ResultSet rs=ps.executeQuery();  
									    while(rs.next())
									    {
									    	%>
									    	<option   value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
									    	<% 
									    }
									    %>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Category </label>
								<div class="col-md-6">
									<select name="productCateg" class="form-control "id="prodtCat">
										<option>Choose Category</option>
										<%
										Connection con2 = DbConnection.getConnection();
									    String sql2="SELECT * FROM Category";
									    PreparedStatement ps2=con2.prepareStatement(sql2);  
									    
									    ResultSet rs2=ps2.executeQuery();  
									    while(rs2.next())
									    {
									    	%>
									    	<option name="catId" value="<%=rs2.getInt(1) %>"><%=rs2.getString(2) %></option>
									    	<% 
									    }
									    %>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Product Availability</label>
								<div class="col-md-6">
									<select name="productAva" class="form-control" id="prodtAvilab">
										<option> Choose Availability</option>
										<option  value="0">Comming Soon</option>
										<option value="1">Available</option>
										<option  value="2">Out of Stock</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Expier Date</label>
								<div class="col-md-6">
									<input type="date" id="productExDate" name="prodExDate" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Keyword</label>
								<div class="col-md-6">
									<input type="text" id="productKey" name="productKeyword" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Product Stock</label>
								<div class="col-md-6">
									<input type="text" id="productStk" name="productStock" class="form-control" required>
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="Updateproduct" value="Update Product" class="btn btn-success form-control">
								</div>
							</div>
						</form>
      </div>
    </div>
  </div>
</div>
<!--edit modal end  -->	
		<%@include file="include/Resources.jsp" %>
		<script>
		
	    $(document).ready(function() {
	    	getData();
			function getData(){
	    	let event = "event=viewProducts";
        	$.ajax({
    			url:"../king",
    			data:event,
    			type:"POST",
    			dataType:"json",
    			success:function(data,textStatus,jqXHR){ 					 
    				console.log(data);
    				
    				 let s2="";
    				for (var key in data) {
    					if (data.hasOwnProperty(key)) {
    					  s2+="<tr>";
    					  s2+="<td>"+data[key].productId+"</td>";
    					  s2+="<td>"+data[key].productDate+"</td>";
    					  s2+="<td>"+data[key].productName+"</td>";
    					  s2+="<td>"+data[key].customUrl+"</td>";
    					  s2+="<td><img src='product_images/"+data[key].image1+"' style='width:100%;height:100%'></td>";
    					  s2+="<td>"+data[key].image2+"</td>";
    					  s2+="<td>"+data[key].image3+"</td>";
    					  s2+="<td>"+data[key].image4+"</td>";
    					  s2+="<td>"+data[key].productPrice+"</td>";
    					  s2+="<td>"+data[key].discount+"</td>";
    					  s2+="<td>"+data[key].manName+"</td>";
    					  s2+="<td>"+data[key].catName+"</td>";
    					  s2+="<td>"+data[key].productKeywords+"</td>";
    					  s2+="<td>"+data[key].availability+"</td>";
    					  s2+="<td>"+data[key].product_expire_date+"</td>";
    					  s2+="<td>"+data[key].product_stock+"</td>";
    					  s2+="<td><a href='#' class='btn btn-info product_edit' data-id='"+data[key].productId+"' id='"+data[key].productId+"'>Edit</a></td>";
    					  s2+="<td><a href='#' class='btn btn-danger product_delete' data-id='"+data[key].productId+"' id='"+data[key].productId+"'>Delete</a></td></tr>";
    					   
    					}
    				}
    				$('#viewProductsBody').html(s2);
    				console.log("success...")
    	  			
    			},
    		error:function(jqXHR,textStatus,errorThrown){
    			console.log(jqXHR.responseText);
    				console.log("error...")
    				
    			}
    		
    	});
	    }
	    $(document).on('click', '.product_delete', function() {
       	 product_Id = $(this).attr('id');
       	
       	  if (confirm('Are you sure you want to delete this?')) {
       		  
		$.ajax({
		    type:'POST',
		    url:'../king',
			data:{'product_Id':product_Id,'event':'delete_product'},
			method:'POST',
			dataType:'JSON',
			success:function(data,textStatus,jqXHR){
					if(data.trim() ==='done'){
		  				$('#msg').html("Successfully Deleted!");
		  				$('#viewProductsBody').html('');
		  				getData();
	  				}else{
		  				$('#msg').html("Something went wrong on server!");
		  				$('#msg').addClass('red-text');
	  				}
			},
		error:function(jqXHR,textStatus,errorThrown){
			console.log("error...");
	  			$('#msg').html(errorThrown);
	  		
				}
		    });	
       	} //confirm end   
		 });
		});
		</script>
		 
             <script>
					
                 $(document).on('click', '.product_edit', function() {
                	 productId = $(this).attr('id');
                	$("#editModal").modal("show");
				$.ajax({
				    type:'POST',
				    url:'../king',
					data:{'productId':productId,'event':'fetchProductByProdId'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						console.log(data);
						$("#prodId").val(data[0].productId);
	    				$("#prodtName").val(data[0].productName);
	    				$("#prodtUrl").val(data[0].customUrl);
	    				$("#prodtPrice").val(data[0].productPrice);
	    				$("#productDiscount").val(data[0].discount);
	    				$("#prodtDes").val(data[0].productDetails);
	    				$("#prdtManu").val(data[0].manufactureId);
	    				$("#prodtCat").val(data[0].categoryId);
	    				$("#prodtAvilab").val(data[0].availability);
	    				$("#productExDate").val(data[0].product_expire_date);
	    				$("#productKey").val(data[0].productKeywords);
	    				$("#productStk").val(data[0].product_stock);
	    				
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  					}
				    });	
                	   
				 });
                 

			</script>
	</body>
</html>
