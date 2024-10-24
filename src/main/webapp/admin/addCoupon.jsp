
<!DOCTYPE html>
<html>
	<head>
		<title> Add Coupon - Azone Kurunegala</title>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / Add Coupon
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
							<i class="fa fa-plus"></i> Add Coupon
						</div>
					</div>
					<h4 id="msg" style=" text-align: center;"></h4>
					<div class="panel-body">
						<form class="form-horizontal" action="../coupon" method="post" id="myform">
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Coupon Title</label>
								<div class="col-md-6">
									<input type="text" name="couponTitle" class="form-control" required>
									<input type="hidden" name="event" value="saveCoupon">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Coupon Price</label>
								<div class="col-md-6">
									<input type="text" name="couponPrice" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Coupon Code</label>
								<div class="col-md-6">
									<input type="text" name="couponCode" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Coupon Product</label>
								<div class="col-md-6">
									<input type="text" name="couponProduct" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Coupon Amount</label>
								<div class="col-md-6">
									<input type="text" name="couponAmount" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" id="submitCoupon" name="addcoupon" value="Add Coupon" class="btn btn-success form-control">
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
		<!-- <script>
		 $("#myform").on('submit', function(e){

		     

		  });
        $('#submitCoupon').click(function(e){
        	e.preventDefault();
        	var f=$('#myform').serialize();
        	 console.log(f);
            $.ajax({
  				url:"../coupon",
  				data:f,
  				type:'POST',
  				success:function(data,textStatus,jqXHR){
  					
  					if(data.trim() ==='done'){
  		  				$('#msg').html("Successfully Added!");
  		  			    $('#msg').addClass('green-text');
  		  			    $('#myform').trigger("reset");
  		  			}else{
  		  				$('#msg').html("Something went wrong on server!")
  		  				$('#msg').addClass('red-text')
  		  			}
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...")
  		  			$('#msg').html("Something went wrong on server!")
  		  			$('#msg').addClass('red-text')
  				}
		
	         });
        });
		</script> -->
	</body>
</html>
