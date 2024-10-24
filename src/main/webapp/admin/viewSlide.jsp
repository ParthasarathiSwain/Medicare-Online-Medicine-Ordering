
<!DOCTYPE html>
<html>
	<head>
		<title> View Slide - Azone Kurunegala</title>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / View Slide
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
							<i class="fa fa-list"></i> View Slide
						</div>
					</div>
					<h4 id="msg" class="" style="text-align:center"></h4>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead>
									<tr>
										<th>Id</th>
										<th>Slide Name</th>
										<th>Slide</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody id="sliderBody">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
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
	        	let event = "event=getSlider";
	        	$.ajax({
	    			url:"../slider",
	    			data:event,
	    			type:"POST",
	    			dataType:"json",
	    			success:function(data,textStatus,jqXHR){ 					 
	    				console.log(data);
	    				
	    				 let s="";
	    				for (var key in data) {
	    					if (data.hasOwnProperty(key)) {
	    					  s+="<tr>";
	    					  s+="<td>"+data[key].sliderId+"</td>";
	    					  s+="<td>"+data[key].sName+"</td>";
	    					  s+="<td><img src='resources/img/slideshow/"+data[key].sImage+"' style='width:10%;height:10%'></td>";
	    					  s+="<td><a  href='#' class='btn btn-danger slider_delete' data-id='"+data[key].sliderId+"' id='"+data[key].sliderId+"'>Delete</a></td></tr>";
	    					  
	    					}
	    				}
	    				$('#sliderBody').html(s);
	    				console.log("success...")
	    	  			
	    			},
	    		error:function(jqXHR,textStatus,errorThrown){
	    			console.log(jqXHR.responseText);
	    				console.log("error...")
	    				
	    			}
	   		   });
	        }
		 $(document).on('click', '.slider_delete', function() {
        	 slider_Id = $(this).attr('id');
        	
        	  if (confirm('Are you sure you want to delete this?')) {
        		  
		$.ajax({
		    type:'POST',
		    url:'../slider',
			data:{'slider_Id':slider_Id,'event':'delete_slider'},
			method:'POST',
			dataType:'JSON',
			success:function(data,textStatus,jqXHR){
					if(data.trim() ==='done'){
		  				$('#msg').html("Successfully Deleted!");
		  				$('#sliderBody').html('');
		  				getData();
	  				}else{
		  				$('#msg').html("Something went wrong on server!");
		  				$('#msg').addClass('red-text');
	  				}
			},
		error:function(jqXHR,textStatus,errorThrown){
			console.log("error...");
	  			$('#msg').html(errorThrown);
	  			$('#msg').addClass('red-text');
				}
		    });	
        	} //confirm end   
		 });
		});
		</script>
		
	</body>
</html>
