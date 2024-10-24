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
										<th>Name</th>
										<th>Action</th>
										
									</tr>
								</thead>
								<tbody id="catBody">
								
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
<!--Edit Modal Category-->
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
        <form class="form-horizontal" action="../category" method="post" >
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Category Name</label>
							<div class="col-md-6">
									<input type="text" name="catName" class="form-control" id="catname" required>
									<input type="hidden" name="event" value="updateCategory">
									<input type="hidden" id="catId" name="categoryId" value="">
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="updateDept" value="Update" class="btn btn-success form-control">
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
        	let event = "event=getCategory";
        	$.ajax({
    			url:"../category",
    			data:event,
    			type:"POST",
    			dataType:"json",
    			success:function(data,textStatus,jqXHR){
    				console.log(data);
    				 let s="";
    				for (var key in data) {
    					if (data.hasOwnProperty(key)) {
    					  s+="<tr>";
    					  s+="<td>"+data[key].categoryId+"</td>";
    					  s+="<td>"+data[key].catName+"</td>";
    					  s+="<td><a href='#' class='btn btn-info category_edit' data-id='"+data[key].categoryId+"' id='"+data[key].categoryId+"'>Edit</a>";
    					  s+="&nbsp;&nbsp;<a href='#' class='btn btn-danger category_delete' data-id='"+data[key].categoryId+"' id='"+data[key].categoryId+"'>Delete</a></td></tr>";
    					}
    				}
    				$('#catBody').html(s);
    				console.log("success...")
    	  			
    			},
    		error:function(jqXHR,textStatus,errorThrown){
    			console.log(jqXHR.responseText);
    				console.log("error...")
    			}	
    	      });
	        }
			 $(document).on('click', '.category_delete', function() {
             	category_Id = $(this).attr('id');
             	//alert(category_Id);
             	  if (confirm('Are you sure you want to delete this?')) {
             		  
				$.ajax({
				    type:'POST',
				    url:'../category',
					data:{'category_Id':category_Id,'event':'delete_category'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						if(data.trim() ==='done'){
	  		  				$('#msg').html("Successfully Deleted!");
	  		  			    $('#catBody').html('');
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
		 $(document).on('click', '.category_edit', function() {
                categoryId = $(this).attr('id');
                $("#editModal").modal("show");
				$.ajax({
				    type:'POST',
				    url:'../category',
					data:{'categoryId':categoryId,'event':'fatchCategoryByCatId'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						console.log(data);
						$("#catId").val(data[0].categoryId);
	    				$("#catname").val(data[0].catName);
	    				
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  					}
				    });	
                	   
				 });
                 

			</script>
	</body>
</html>
