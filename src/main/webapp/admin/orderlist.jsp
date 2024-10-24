
<!DOCTYPE html>
<html>
	<head>
		<title> View Orders</title>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / View Orders
					</li>
				</ol>
			</div>
		</div>
		</div>
		</div>
		<div id="page-wrapper">
			<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">
							<i class="fa fa-truck"></i> View Orders
						</div>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
									    <th>#</th>
									    <th>Customer Name</th>
										<th>Order No</th>
										<th>Date</th>
                                        <th>Order Amount</th>
										<th>Order Status</th>
										<th>Order Details</th>
									</tr>
								</thead>
								<tbody id="orderBody">
									
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
		<!--Add JavaScript Files-->
		<%@include file="include/Resources.jsp" %>
		<!-- Modal -->
			<div class="modal fade" id="modal_order_detils" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Order Details</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<div class="table-responsive">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
									    <th>#</th>
									    <th>Order#</th>
										<th>Product Name</th>
										<th>Unit Price </th>
                                        <th>Quantity</th>
										<th>Total Price</th>
										
									</tr>
								</thead>
								<tbody id="bind_order_details">
								   
								</tbody>
								
							</table>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					
				</div>
				</div>
			</div>
			</div>
			<script>
			  
			 $(document).ready(function() {
	        	
	        	let event = "event=getallOrders";
	        	$.ajax({
	    			url:"../orders",
	    			data:event,
	    			type:"POST",
	    			dataType:"json",
	    			success:function(data,textStatus,jqXHR){ 					 
	    				console.log(data);
	    				
	    				 let s="";
	    				for (var key in data) {
	    					if (data.hasOwnProperty(key)) {
	    					  s+="<tr>";
	    					  s+="<td>"+data[key].orderId+"</td>";
	    					  s+="<td>"+data[key].cusName+"</td>";
	    					  s+="<td>"+data[key].invoiceNumber+"</td>";
	    					  s+="<td>"+data[key].date+"</td>";
	    					  s+="<td>"+data[key].orderAmount+"</td>";
	    					  s+="<td>"+data[key].status+"</td>";
	    					  s+="<td><a href='#' class='btn btn-info order_id' data-id='"+data[key].orderId+"' id='"+data[key].orderId+"' data-toggle='modal' data-target='#modal_order_detils'>View Details</a></td>"; 
	    					}
	    				}
	    				$('#orderBody').html(s);
	    				/* console.log("success...") */
	    	  			
	    			},
	    		error:function(jqXHR,textStatus,errorThrown){
	    			console.log(jqXHR.responseText);
	    				console.log("error...")
	    				
	    			}
	    		
	    	});
	        });
	     
			</script>
			 <script>
					
                 $(document).on('click', '.order_id', function() {
					order_id = $(this).attr('data-id');
	
					$.ajax({
				    type: 'POST',
				    url:'../orders',
					data: {'order_id':order_id,'event':'order_details'},
					method: 'POST',
					dataType:'JSON',
					success:function(result){
					    // console.log("Test"+result);
					     //console.log(result["id"]);
					     let s1="";
					     let i=1;
		    				for (var key in result) {
		    					if (result.hasOwnProperty(key)) {
		    						s1+="<tr>";
		    						s1+="<td>"+i+"</td>";
		    						s1+="<td>"+result[key].fk_order_id+"</td>";
		    						s1+="<td>"+result[key].productName+"</td>";
		    						s1+="<td>"+result[key].unit_price+"</td>";
		    						s1+="<td>"+result[key].qty+"</td>";
		    						s1+="<td>"+result[key].total_price+"</td>";
		    						s1+="</tr>";
		    					}
		    					i++;
		    				}
						 $('#bind_order_details').html(s1);
						}
				    });	   	
				 });
		
			</script>
	</body>
</html>
