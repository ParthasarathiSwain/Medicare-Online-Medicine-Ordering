<div id="foot">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-6">
				<h4>Menu</h4>
				<hr>
				<ul>
					<li><a href="store.jsp">Store</a></li>
					<li><a href="cart.jsp">Cart</a></li>
					<li><a href="myAccount.jsp">My Account</a></li>
					<li><a href="contactUs.jsp">Contact</a></li>
				</ul>
			</div>
			<div class="col-md-3 col-sm-6">
				<h4>Companies</h4>
				<hr>
				<ul id="manufacturerlist">
					
				</ul>
			</div>
			<div class="col-md-3 col-sm-6">
				<h4>Location</h4>
				<hr>
				<address>
					Bhubaneswar
				</address>
				<a href="contact.php">Any Query ?</a>
				<hr class="hidden-md hidden-lg">
			</div>
			<div class="col-md-3 col-sm-6">
				<h4>News Letter</h4>
				<hr>
				<p>Get latest offers and discounts</p>
				<form method="post" action="">
					<div class="input-group">
						<input type="text" class="form-control" name="email">
						<span class="input-group-btn">
							<input type="submit" value="Subscribe" class="btn btn-info ">
						</span>
					</div>
				</form>
				<hr>
				<h4>Social Media</h4>
				<p class="social">
					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-google-plus"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="#"><i class="fa fa-instagram"></i></a>
				</p>
			</div>
		</div>
	</div>
</div>


<div id="cright">
	<div class="container">
		<div class="col-md-6">
		

				<p class="stext-107 cl6 txt-center">
				
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved 


				</p>
		</div>
		<div class="col-md-6">
			<p class="pull-right"><a href="#">Designed by *******</a></p>
		</div>
	
	</div>
</div>
<script>
$(document).ready(function(){
	getManufacturer();
	});
function getManufacturer()
	{
		event = "event=getManufacturers";
		$.ajax({
		url:"manufacturer",
		data:event,
		type:"POST",
		dataType:"json",
		success:function(data,textStatus,jqXHR){ 					 
			console.log(data);
			
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
</script>