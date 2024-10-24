

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{

    background-color: #eee;
}

.form-control {
    border-bottom: 2px solid #eee !important;
    border: none;
    font-weight: 600
}

.form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #8bbafe;
    outline: 0;
    box-shadow: none;
    border-radius: 0px;
    border-bottom: 2px solid blue !important;
}



.inputbox {
    position: relative;
    margin-bottom: 20px;
    width: 100%
}

.inputbox span {
    position: absolute;
    top: 7px;
    left: 11px;
    transition: 0.5s;
   
}

.inputbox i {
    position: absolute;
    top: 13px;
    right: 8px;
    transition: 0.5s;
    color: #3F51B5;
     z-index:1;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0
}

.inputbox input:focus~span {
    transform: translateX(-0px) translateY(-15px);
    font-size: 12px
}

.inputbox input:valid~span {
    transform: translateX(-0px) translateY(-15px);
    font-size: 12px
}

.card-blue{
 	border-radius: 10px;
    background-color: #1DC3EC ;
    padding: 10px;
}

.hightlight{

    background-color: #398597 ;
    padding: 10px;
    border-radius: 10px;
    margin-top: 15px;
    font-size: 14px;
}

.yellow{

    color: #fdcc49; 
}

.decoration{

    text-decoration: none;
    font-size: 14px;
}

.btn-success {
    color: #fff;
    background-color: #492bc4;
    border-color:#492bc4;
}

.btn-success:hover {
    color: #fff;
    background-color:#492bc4;
    border-color: #492bc4;
}


.decoration:hover{

    text-decoration: none;
    color: #fdcc49; 
}
</style>
<!--Add CSS Files-->
	<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet"  type="text/css" href="resources/font-awesome/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
	<script>tinymce.init({ selector:'textarea' });</script>
</head>
<body>
	
<%@include file="include/header.jsp" %>
<div class="container mt-5 px-5">

            <div class="mb-4">

                <h2>Confirm order and pay</h2>
            <span>please make the payment, after that you can enjoy all the features and benefits.</span>
                
            </div>

        <div class="row">

            <div class="col-md-8">
                

                <div class="card p-3">
						<div class="mt-4 mb-4">

                        <h6 class="text-uppercase">Billing Address</h6>

						  <div class="row mt-3">

                            <div class="col-md-6">

                                <div class="inputbox mt-3 mr-2"> <input type="text" name="name" class="form-control" required="required"> <span>Street Address</span> </div>
                            </div>
					   <div class="col-md-6">

                                <div class="inputbox mt-3 mr-2"> <input type="text" name="name" class="form-control" required="required"> <span>City</span> </div>
                            </div>

							  </div>

							<div class="row mt-2">

                            <div class="col-md-6">

                                <div class="inputbox mt-3 mr-2"> <input type="text" name="name" class="form-control" required="required"> <span>State/Province</span> </div>
                             </div>
							 <div class="col-md-6">
								 <div class="inputbox mt-3 mr-2"> <input type="text" name="name" class="form-control" required="required"> <span>Zip code</span> </div>
                             </div>

						  </div>
					</div>

                </div>

			 

            </div>

            <div class="col-md-4">

                <div class="card card-blue p-3 text-white mb-3">

                   <span>You have to pay</span>
                    <div class="d-flex flex-row align-items-end mb-3">
                        <h1 class="mb-0 yellow" id="subtotal"></h1> 
                    </div>

                    <span>Enjoy all the features and perk after you complete the payment</span>
                    <a href="#" class="yellow decoration">Know all the features</a>

                    <div class="hightlight">

                        <span>100% Guaranteed support and update for the next 5 years.</span>
                        

                    </div>
                    
                </div>
                <br>
            </div>
        <div class="container">
   		 <div class="row">
       		 <div class="col-md-11 bg-light text-right">
          		<a type="button" class="btn btn-success">Pay</a>
       		 </div>
    	  </div>
		</div>
        </div>
         <br>
		
      </div>
      <!--Add JavaScript Files-->
	<script src="resources/js/jquery.min.js"></script>	
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  	<script>tinymce.init({ selector:'textarea' });</script>
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
	    					}
	    				} 
	    				
	    				$('#subtotal').html(subtotal);
	    				$('#nettotal').html(subtotal);
	    				
	    			},
	    		error:function(jqXHR,textStatus,errorThrown){
	    			console.log(jqXHR.responseText);
	    			}
	    	});
	        });
	     </script>
</body>
</html>