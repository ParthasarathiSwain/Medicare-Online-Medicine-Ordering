
<!DOCTYPE html>
<html>
	<head>
		<title> View Admin - Azone Kurunegala</title>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / View Admin
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
							<i class="fa fa-list"></i> View Admin
						</div>
					</div>
					<h4 id="msg" class=""style="text-align:center"></h4>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead>
									<tr>
										<th>Id</th>
										<th>Admin Name</th>
										<th>Admin Email</th>
										<th>Admin Password</th>
										<th>Admin Image</th>
										<th>Admin PNo</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="adminBody">
									
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
        <h5 class="modal-title" id="exampleModalLabel">Edit Admin</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="../admin" method="post" >
							
							<div class="form-group">
							<label for="" class="col-md-3 control-label">Admin Name</label>
							<div class="col-md-6">
									<input type="text" name="admminName" class="form-control" id="adminNmae" required>
										<input type="hidden" name="event" value="updateAdmin">
										<input type="hidden" id="adminid" name="adminId" value="">
								</div>
							</div>
							<div class="form-group">
							<label for="" class="col-md-3 control-label">Admin Email</label>
							<div class="col-md-6">
									<input type="text" name="adminEmail" class="form-control" id="adminEmail" required>
								</div>
							</div>
							<div class="form-group">
							<label for="" class="col-md-3 control-label">Admin password</label>
							<div class="col-md-6">
									<input type="text" name="adminpsw" class="form-control" id="adminPsw" required>
								</div>
							</div>
							<div class="form-group">
							<label for="" class="col-md-3 control-label">Admin Phone</label>
							<div class="col-md-6">
									<input type="text" name="phone" class="form-control" id="AdminPhone" required>
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="updateAdmin" value="Update" class="btn btn-success form-control">
								</div>
							</div>
						</form>
      </div>
    </div>
  </div>
</div>	
		<!--Add JavaScript Files-->
		<%@include file="include/Resources.jsp" %>
		
		<script>
		$(document).ready(function() {
			getData();
			function getData(){
	        	let event = "event=viewAdmin";
	        	$.ajax({
	    			url:"../admin",
	    			data:event,
	    			type:"POST",
	    			dataType:"json",
	    			success:function(data,textStatus,jqXHR){ 					 
	    				console.log(data);
	    				
	    				 let s="";
	    				for (var key in data) {
	    					if (data.hasOwnProperty(key)) {
	    					  s+="<tr>";
	    					  s+="<td>"+data[key].adminId+"</td>";
	    					  s+="<td>"+data[key].adminName+"</td>";
	    					  s+="<td>"+data[key].adminEmail+"</td>";
	    					  s+="<td>"+data[key].adminPassword+"</td>";
	    					  s+="<td><img src='resources/img/adminImg/"+data[key].adminPhoto+"' style='width:15%;height:13%'>"+data[key].adminPhoto+"</td>";
	    					  s+="<td>"+data[key].adminPNum+"</td>";
	    					  s+="<td><a href='#'class='btn btn-info btn-block admin_edit' data-id='"+data[key].adminId+"' id='"+data[key].adminId+"'>Edit</a>";
	    					  s+="<a href='#'class='btn btn-danger btn-block admin_delete' data-id='"+data[key].adminId+"' id='"+data[key].adminId+"'>Delete</a></td></tr>";
	    					   
	    					}
	    				}
	    				$('#adminBody').html(s);
	    				console.log("success...")
	    	  			
	    			},
	    		error:function(jqXHR,textStatus,errorThrown){
	    			console.log(jqXHR.responseText);
	    				console.log("error...")
	    				
	    			}
	   		   });
			 }
			
            $(document).on('click', '.admin_delete', function() {
           	 admin_Id = $(this).attr('id');
           	
           	  if (confirm('Are you sure you want to delete this?')) {
           		  
			$.ajax({
			    type:'POST',
			    url:'../admin',
				data:{'admin_Id':admin_Id,'event':'delete_admin'},
				method:'POST',
				dataType:'JSON',
				success:function(data,textStatus,jqXHR){
						if(data.trim() ==='done'){
 		  				$('#msg').html("Successfully Deleted!");
 		  				$('#adminBody').html('');
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
				  $(document).on('click', '.admin_edit', function() {
					  admin_Id = $(this).attr('id');
                	 
                	$("#editModal").modal("show");
				$.ajax({
				    type:'POST',
				    url:'../admin',
					data:{'admin_Id':admin_Id,'event':'fatchAdminByAdminId'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						console.log(data);
						$("#adminid").val(data[0].adminId);
	    				$("#adminNmae").val(data[0].adminName);
	    				$("#adminEmail").val(data[0].adminEmail);
	    				$("#adminPsw").val(data[0].adminPassword);
	    				$("#AdminPhone").val(data[0].adminPNum);
	    				
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  					}
				    });	
                	   
				 });
           </script>
        
	</body>
</html>
