
<!DOCTYPE html>
<html>
	<head>
		<title> View Category - Azone Kurunegala</title>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / View Category
					</li>
				</ol>
			</div>
		</div>
			</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">
							<i class="fa fa-list"></i> View Category
						</div>
					</div>
					<h4 id="msg" class="" style="text-align:center"></h4>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead>
									<tr>
										<th>Id</th>
										<th>Title</th>
										<th>Price</th>
										<th>Code</th>
										<th>Product Id</th>
										<th>Available</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="couponBody">
									
								</tbody>
							</table>
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
        <h5 class="modal-title" id="exampleModalLabel">Edit Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="../coupon" method="post" >
							
							<div class="form-group">
							<label for="" class="col-md-3 control-label">Coupon Name</label>
							<div class="col-md-6">
									<input type="text" name="couponName" class="form-control" id="couponNmae" required>
										<input type="hidden" name="event" value="updateCoupon">
										<input type="hidden" id="couId" name="coupId" value="">
								</div>
							</div>
							<div class="form-group">
							<label for="" class="col-md-3 control-label">Price</label>
							<div class="col-md-6">
									<input type="text" name="couponPrice" class="form-control" id="couPrice" required>
								</div>
							</div>
							<div class="form-group">
							<label for="" class="col-md-3 control-label">Code</label>
							<div class="col-md-6">
									<input type="text" name="couponCode" class="form-control" id="couCode" required>
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="updateMan" value="Update" class="btn btn-success form-control">
								</div>
							</div>
						</form>
      </div>
    </div>
  </div>
</div>
		<!--Add JavaScript Files-->
		<%@include file="include/Resources.jsp" %>
		
	<script type="text/javascript">
		$(document).ready(function() {
				getData();
				function getData(){
	        	let event ="event=getCoupon";
	        	$.ajax({
	    			url:"../coupon",
	    			data:event,
	    			type:"POST",
	    			dataType:"json",
	    			success:function(data,textStatus,jqXHR){ 					 
	    				console.log(data);
	    				
	    				 let s="";
	    				for (var key in data) {
	    					if (data.hasOwnProperty(key)) {
	    					  s+="<tr>";
	    					  s+="<td>"+data[key].couponId+"</td>";
	    					  s+="<td>"+data[key].couponTitle+"</td>";
	    					  s+="<td>"+data[key].couponPrice+"</td>";
	    					  s+="<td>"+data[key].couponCode+"</td>";
	    					  s+="<td>"+data[key].productId+"</td>";
	    					  s+="<td>"+data[key].uses+"</td>";
	    					  s+="<td><a  href='#' class='btn btn-info coupon_edit' data-id='"+data[key].couponId+"' id='"+data[key].couponId+"'>Edit</a>";
	    					  s+="&nbsp;<a  href='#' class='btn btn-danger coupon_delete' data-id='"+data[key].couponId+"' id='"+data[key].couponId+"'>Delete</a></td></tr>";
	    					}
	    				}
	    				$('#couponBody').html(s);
	    				console.log("success...")
	    	  		},
	    		error:function(jqXHR,textStatus,errorThrown){
	    			console.log(jqXHR.responseText);
	    				console.log("error...")
	    			}
	    	    });
			  }
				 $(document).on('click', '.coupon_delete', function() {
	                 coupon_Id = $(this).attr('id');
	                 if (confirm('Are you sure you want to delete this?')) {
	              $.ajax({
					    type:'POST',
					    url:'../coupon',
						data:{'coupon_Id':coupon_Id,'event':'coupon_delete'},
						method:'POST',
						dataType:'JSON',
						success:function(data,textStatus,jqXHR){
	  						if(data.trim() ==='done'){
		  		  				$('#msg').html("Successfully Deleted!");
		  		  			    $('#couponBody').html('');
		  		  			    getData();
	  		  				}else{
		  		  				$('#msg').html("Something went wrong on server!");
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
				  $(document).on('click', '.coupon_edit', function() {
                	 couponId = $(this).attr('id');
                	 
                	$("#editModal").modal("show");
				$.ajax({
				    type:'POST',
				    url:'../coupon',
					data:{'couponId':couponId,'event':'fatchCouponByCouId'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						console.log(data);
						$("#couId").val(data[0].couponId);
	    				$("#couponNmae").val(data[0].couponTitle);
	    				$("#couPrice").val(data[0].couponPrice);
	    				$("#couCode").val(data[0].couponCode);
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  					}
				    });	
                	   
				 });
           </script>
	</body>
</html>
