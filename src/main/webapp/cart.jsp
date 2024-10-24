<%@page import="com.otz.dao.DbConnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>

    <head>
        <title>MEDICARE</title>
        <!--Add CSS Files-->
        <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="resources/font-awesome/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
    </head>

    <body>
       <%@include file="include/header.jsp" %>
        <div id="content">
            <div class="container">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            <a href="cart.jsp">Cart</a>
                        </li>
                    </ul>
                </div>
                <!--	Cart.php Codes Start-->
                <div class="col-md-9" id="cart">
                    <div class="box">
                        <form action="cart.jsp" method="post" enctype="multipart/form-data">
                            <h1>Cart</h1>
                           
                            <p class="text-muted">
                               
                            </p>
                            <div class="tabel-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th > ProductName</th>
                                            <th>Quantity</th>
                                            <th>Unit Price</th>
                                           
                                            <th>Sub Total</th>
                                             <th colspan=colspan="2">Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody id="cartBody">
                                
                                    </tbody>
                                    <tfoot>
                                        <tr>

                                            <th colspan="4">Total</th>
                                           <th colspan="1">Rs. <span id="subtotal1"></span> </th>
                                             <th colspan=""><a  class="btn btn-danger" id="removeCart">Delete</a> </th>
                                        </tr>
                                    </tfoot>
                                </table><br>
                                <div class="form-inline pull-right">
                                    <div class="form-group">
                                        <!-- <label>Coupon</label>
                                        <input type="text" name="couponcode" class="form-control"> -->
                                    </div>
                                    <!-- <input type="submit" name="coupon" value="Apply" class="btn btn-success"> -->
                                </div><br>
                            </div>
                            <div class="box-footer">
                                <div class="pull-left">
                                    <a href="index.php" class="btn btn-default">
                                        <i class="fa fa-chevron-left"></i> Continue Shopping
                                    </a>
                                </div>
                                <div class="pull-right">
                                    <button class="btn btn-default" type="submit" name="update" value="Update">
                                        <i class="fa fa-refresh"></i> Update
                                    </button>
                                    <!--  action="pgRedirect.php" -->
                                    <a href="checkOut.jsp" class="btn btn-info">
                                        Checkout <i class="fa fa-chevron-right"></i>
                                    </a>
                                </div>
                            </div>
                           
                        </form>
                    </div>
                    <div id="row same-height-row">
                        <div class="col-md-3 col-sm-6">
                            <div class="box same-height headline">
                                <h3 class="text-center">Check this products out</h3>
                            </div>
                        </div>
                     
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="box" id="order-details">
                        <div class="box-header">
                            <h3>Summary</h3>
                        </div>
                        <p class="">
                            Your all costs are calculated here
                        </p>
                        <div class="tabel-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>
                                            SubTotal
                                        </td>
                                        <th id="subtotal"></th>
                                    </tr>
                                    <tr>
                                        <td>
                                            Delivery Cost
                                        </td>
                                        <td> Free</td>
                                    </tr>
                                    <tr class="total">
                                        <td>Total</td>
                                        <th>Rs. <span id="nettotal"></span> </th>
                                       
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>



            </div>
        </div>
       
        <!--Add JavaScript Files-->
        <script src="resources/js/jquery.min.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
         <!--Footer Start-->
       <%@include file="include/footer.jsp" %>
        <script>
			 $(document).ready(function() {
	        	let event = "event=viewCartIteam";
				$.ajax({
	    			url:"cart",
	    			data:event,
	    			type:"POST",
	    			dataType:"json",
	    			success:function(data,textStatus,jqXHR){ 					 
	    				let s="";
	    				let i=1;
	    				let subtotal=0;
	    				for (var key in data) {
	    					if (data.hasOwnProperty(key)) {
	    					  let total=(parseInt(data[key].cartQty)*parseInt(data[key].cartPrice));
	    					  subtotal+=total;
	    					  s+="<tr>";
	    					  s+="<td>"+i+"</td>";
	    					  s+="<td><input type='hidden' val='"+data[key].productId+"' id='hdnPid'/>";
	    					  s+=data[key].productName+"</td>";
	    					  s+="<td><input type='number' style='width:50px' value='"+data[key].cartQty+"'/></td>";
	    					  s+="<td>"+data[key].cartPrice+"</td>";
	    					  s+="<td>"+total+"</td>";
	    			          s+="<td><input type='checkbox' name='chkCart' value='"+data[key].productId+"'></td></tr>";
	    			          i++;
	    					}
	    				} 
	    				$('#cartBody').html(s);
	    				$('#subtotal').html(subtotal);
	    				$('#nettotal').html(subtotal);
	    				$('#subtotal1').html(subtotal);
	    			},
	    		error:function(jqXHR,textStatus,errorThrown){
	    			console.log(jqXHR.responseText);
	    			}
	    	});
	        });
	     </script>
	     <script>
				 $(document).on('click', '#removeCart', function() {
					 var chkstatus=false; 
					 var sList = "";
					 $('input[type=checkbox]').each(function () {
					     if(this.checked)
					     {
					    	sList+= $(this).val()+",";
					    	chkstatus=true;
					    }
					 });
					 if(chkstatus==false)
				     {
						 alert("No item selected !!!!");
				     }else{
					 sList = sList.replace(/(\s*,?\s*)*$/, "");
					 
                	  if (confirm('Are you sure you want to delete this?')) {
              $.ajax({
				    type:'POST',
				    url:'cart',
					data:{'event':'cart_delete','productids':sList},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						location.reload(true);
						
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  		  			$('#msg').html(errorThrown);
  		  			}
				    });	
                	} //confirm end   
				     }
				 });
				 
             </script>
    </body>

</html>



