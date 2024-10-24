
<!DOCTYPE html>
<html>
	<head>
		<title> View Manufacture - Azone Kurunegala</title>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / View Manufacture
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
							<i class="fa fa-list"></i> View Manufacture
						</div>
					</div>
					<h4 id="msg" class=""style="text-align:center"></h4>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead>
									<tr>
										<th>Id</th>
										<th>Name</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="manBody">
									
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
        <form class="form-horizontal" action="../manufacturer" method="post" >
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Manufacturer Name</label>
							<div class="col-md-6">
									<input type="text" name="manName" class="form-control" id="manname" required>
										<input type="hidden" name="event" value="updateManufacturer">
										<input type="hidden" id="ManId" name="manId" value="">
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
	        	event = "event=getManufacturers";
	        	$.ajax({
	    			url:"../manufacturer",
	    			data:event,
	    			type:"POST",
	    			dataType:"json",
	    			success:function(data,textStatus,jqXHR){ 					 
	    				console.log(data);
	    				 let s="";
	    				for (var key in data) {
	    					if (data.hasOwnProperty(key)) {
	    					  s+="<tr>";
	    					  s+="<td>"+data[key].manufactureId+"</td>";
	    					  s+="<td>"+data[key].manName+"</td>";
	    					  s+="<td><a  href='#' class='btn btn-info manufacturer_edit' data-id='"+data[key].manufactureId+"' id='"+data[key].manufactureId+"'>Edit</a>";
	    					  s+="&nbsp;&nbsp;<a  href='#' class='btn btn-danger manufacturer_delete' data-id='"+data[key].manufactureId+"' id='"+data[key].manufactureId+"'>Delete</a></td></tr>";
	    					}
	    				}
	    				$('#manBody').html(s);
	    				console.log("success...")
	    	  		},
	    		error:function(jqXHR,textStatus,errorThrown){
	    			console.log(jqXHR.responseText);
	    				console.log("error...")
	    			}
	    	});
		   } 	
		$(document).on('click', '.manufacturer_delete', function() {
            manufacturer_Id = $(this).attr('id');
            if (confirm('Are you sure you want to delete this?')) {
            $.ajax({
			    type:'POST',
			    url:'../manufacturer',
				data:{'manufacturer_Id':manufacturer_Id,'event':'manufacturer_delete'},
				method:'POST',
				dataType:'JSON',
				success:function(data,textStatus,jqXHR){
						if(data.trim() ==='done'){
  		  				$('#msg').html("Successfully Deleted!");
  		  		       	$('#manBody').html('');
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
		$(document).on('click', '.manufacturer_edit', function() {
               manufactureId = $(this).attr('id');
               $("#editModal").modal("show");
				$.ajax({
				    type:'POST',
				    url:'../manufacturer',
					data:{'manufactureId':manufactureId,'event':'fatchManuByManId'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						console.log(data);
						$("#ManId").val(data[0].manufactureId);
	    				$("#manname").val(data[0].manName);
	    				
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  					}
				    });	
                	   
				 });
           </script>
	</body>
</html>
<?php } ?>