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
		<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  		<script>tinymce.init({ selector:'textarea' });</script>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / Add Product
					</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">
							<i class="fa fa-plus"></i> Add Medicine
						</div>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" action="../king" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Name</label>
								<div class="col-md-6">
									<input type="text" name="productName" class="form-control" required>
									<input type="hidden" name="event" value="addProducts">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Custom Url</label>
								<div class="col-md-6">
									<input type="text" name="productUrl" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Image</label>
								<div class="col-md-6">
									<input type="file" name="productimg1" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Image</label>
								<div class="col-md-6">
									<input type="file" name="productimg2" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Image</label>
								<div class="col-md-6">
									<input type="file" name="productimg3" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Image</label>
								<div class="col-md-6">
									<input type="file" name="productimg4" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Price</label>
								<div class="col-md-6">
									<input type="text" name="productPrice" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Discount</label>
								<div class="col-md-6">
									<input type="text" name="productDiscount" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Description</label>
								<div class="col-md-6">
									<textarea name="productDes" class="form-control" cols="19" rows="6"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Manufacturer</label>
								<div class="col-md-6">
									<select name="productManuf"  class="form-control" id="">
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
									<select name="productCateg"  class="form-control "id="">
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
								<label for="" class="col-md-3 control-label">Medicine Keyword</label>
								<div class="col-md-6">
									<input type="text" name="productKeyword" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Product Features</label>
								<div class="col-md-6">
									<textarea name="productFea" class="form-control" cols="19" rows="6"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Product Availability</label>
								<div class="col-md-6">
									<select name="productAva" class="form-control" id="">
										<option> Choose Availability</option>
										<option  value="0">Comming Soon</option>
										<option value="1">Available</option>
										<option  value="2">Out of Stock</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Expiredate</label>
								<div class="col-md-6">
									<input type="date" name="productExpDate" class="form-control" id="">
										
									
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Medicine Stock</label>
								<div class="col-md-6">
									<input type="text" name="productstock" class="form-control" id="">
										
									
								</div>
							</div>

							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="addnewproduct" value="Add Product" class="btn btn-success form-control">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		<!--Add JavaScript Files-->
		<%@include file="include/Resources.jsp" %>
	</div>
	</body>
</html>
