<?php
session_start();
include("../include/dbcon.php");
include("../include/function.php");
include_once('PHPMailer/src/PHPMailer.php');
include_once('PHPMailer/src/SMTP.php');
include_once('PHPMailer/src/Exception.php');
?>
<!DOCTYPE html>
<html>

    <head>
        <title>Online Medicine</title>
        <link rel="stylesheet" type="text/css" href="../resources/css/styles.css">
        <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../resources/font-awesome/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
        <style type="text/css">
        body {
            background: #f2f2f2;
        }

        .container {
            margin-top: 120px;
        }

        .payment {
            border: 1px solid #f2f2f2;

            border-radius: 20px;
            background: #fff;
        }

        .payment_header-failure {
            background: red;
            padding: 20px;
            border-radius: 20px 20px 0px 0px;

        }

        .payment_header-success {
            background: green;
            padding: 20px;
            border-radius: 20px 20px 0px 0px;

        }

        .check {
            margin: 0px auto;
            width: 50px;
            height: 50px;
            border-radius: 100%;
            background: #fff;
            text-align: center;
        }

        .check i {
            vertical-align: middle;
            line-height: 50px;
            font-size: 30px;
        }

        .content {
            text-align: center;
        }

        .content h1 {
            font-size: 25px;
            padding-top: 25px;
        }

        .content a {
            width: 200px;
            height: 35px;
            color: #fff;
            border-radius: 30px;
            padding: 5px 10px;
            background: rgba(255, 102, 0, 1);
            transition: all ease-in-out 0.3s;
        }

        .content a:hover {
            text-decoration: none;
            background: #000;
        }

        </style>
    </head>

    <body>
        <?php
	header("Pragma: no-cache");
	header("Cache-Control: no-cache");
	header("Expires: 0");


	// following files need to be included
	require_once("./lib/config_paytm.php");
	require_once("./lib/encdec_paytm.php");

	$paytmChecksum = "";
	$paramList = array();
	$isValidChecksum = "FALSE";

	$paramList = $_POST;
	$paytmChecksum = isset($_POST["CHECKSUMHASH"]) ? $_POST["CHECKSUMHASH"] : ""; //Sent by Paytm pg

	//Verify all parameters received from Paytm pg to your application. Like MID received from paytm pg is same as your application�s MID, TXN_AMOUNT and ORDER_ID are same as what was sent by you to Paytm PG for initiating transaction etc.
	$isValidChecksum = verifychecksum_e($paramList, PAYTM_MERCHANT_KEY, $paytmChecksum); //will return TRUE or FALSE string.


	if ($isValidChecksum == "TRUE") {
		/* echo "<b>Checksum matched and following are the transaction details:</b>" . "<br/>"; */
		if ($_POST["STATUS"] == "TXN_SUCCESS") {

			$query = "UPDATE tbl_order set order_status=1 WHERE order_id = '" . $_POST['ORDERID'] . "'";
			$result = mysqli_query($conn, $query) or die("Error : " . mysqli_error($link));

			$pInvoiceNum = rand();
			if ($result == 1) {
				$save_payment = "INSERT INTO  payement(customerId,pInvoiceNum,txn_id,order_id,txn_status,amount,payMethod) VALUES (0,'$pInvoiceNum','" . $_POST['TXNID'] . "','" . $_POST['ORDERID'] . "','" . $_POST['STATUS'] . "','" . $_POST['TXNAMOUNT'] . "','Online')";
				$save_payment_res = mysqli_query($conn, $save_payment);

				$delete_cart = "DELETE FROM cart";
				mysqli_query($conn, $delete_cart) or die("Error : " . mysqli_error($link));
			}
			/* 	echo "<b>Transaction status is success</b>" . "<br/>"; */
			echo '<div class="container justify-content-center mt-5">
			<div class="row">
			   <div class="col-md-12 mx-auto mt-5">
				  <div class="payment">
					 <div class="payment_header-success">
						<div class="check"><i class="fa fa-check" aria-hidden="true"></i></div>
					 </div>
					 <div class="content">
						<h1>Payment Success !</h1>
						<p>Payment Successfully Done . Details Transaction Information are given below. </p>
						<a href="../index.php">Go to Home</a>
					';

			//Process your transaction here as success transaction.
			//Verify amount & order id received from Payment gateway with your application's order id and amount.
		} else {
			$query = "UPDATE tbl_order set order_status=0 WHERE order_id = '" . $_POST['ORDERID'] . "'";
			$result = mysqli_query($conn, $query) or die("Error : " . mysqli_error($link));
			$pInvoiceNum = rand();
			if ($result == 1) {
				$save_payment = "INSERT INTO  payement(customerId,pInvoiceNum,txn_id,order_id,txn_status,amount,payMethod,date) VALUES (" . returnCustomerId() . ",'$pInvoiceNum','" . $_POST['TXNID'] . "','" . $_POST['ORDERID'] . "','" . $_POST['STATUS'] . "','" . $_POST['TXNAMOUNT'] . "','Online')";
				$save_order_res = mysqli_query($conn, $save_payment);
			}
			/* echo "<b>Transaction status is failure</b>" . "<br/>"; */
			echo '<div class="container justify-content-center">
			<div class="row">
			   <div class="col-md-12 mx-auto mt-5">
				  <div class="payment">
					 <div class="payment_header-failure">
						<div class="check"><i class="fa fa-times" aria-hidden="true"></i></div>
					 </div>
					 <div class="content">
						<h1>Payment Fail !</h1>
						<p>Opps Payment Failed due to technical Issue. Please try again few moments later. Sorry for inconvenience. </p>
						<a href="#">Go to Home</a>
					 ';
		}

		if (isset($_POST) && count($_POST) > 0) {


			echo '<div><h3>Transaction Amount:' . $_POST['TXNAMOUNT'] . '</h3>';
			echo '<h3>Order Id' . $_POST['ORDERID'] . '</h3>';
			echo '<h3>Transaction Id:' . $_POST['TXNID'] . '</h3></div>';
			/* foreach ($_POST as $paramName => $paramValue) {
				echo "<br/>" . $paramName . " = " . $paramValue;
			} */

			/********SEND EMAIL*************/
			  $sql = "Select a.cusEmail ,a.cusName,a.cusPNum,b.order_id,b.order_date,b.order_amount from customer a inner join tbl_order b on a.cusId=b.cust_id and b.order_id ='".$_POST['ORDERID']."'";
			  $getOrder = mysqli_query($connF,$sql);
			  $cusName = '';
			  $cusEmail = '';
			  $orderDate = '';
			  $order_amount = 0;
			  $cusPNum ='';
	            while($rowOrder = mysqli_fetch_array($getOrder)){
				$cusName = $rowOrder['cusName'];
				$cusEmail = $rowOrder['cusEmail'];
				$orderDate = $rowOrder['order_date'];
				$order_amount = number_format($rowOrder['order_amount'],2);
				$cusPNum = $rowOrder['cusPNum'];
			   }
			    $msg ="<html><body style='background-color:#e2e1e0;font-family: Open Sans, sans-serif;font-size:100%;font-weight:400;line-height:1.4;color:#000;'>";
				$msg .="<table style='max-width:670px;margin:50px auto 10px;background-color:#fff;padding:50px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;-webkit-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);-moz-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24); border-top: solid 10px green;'><thead>";
				$msg .="<tr><th style='text-align:left;'>MedPlus</th><th style='text-align:right;font-weight:400;'></th></tr>";
				$msg .="<tbody>";
				$msg .="<tr><td style='height:35px;'></td></tr>";
				$msg .="<tr><td colspan='2 style='border: solid 1px #ddd; padding:10px 20px;'><p style='font-size:14px;margin:0 0 6px 0;'><span style='font-weight:bold;display:inline-block;min-width:150px'>Order status</span><b style='color:green;font-weight:normal;margin:0'>".$_POST["STATUS"]."</b></p><p style='font-size:14px;margin:0 0 6px 0;'><span style='font-weight:bold;display:inline-block;min-width:146px'>Transaction ID</span>".$_POST['TXNID']."</p><p style='font-size:14px;margin:0 0 0 0;'><span style='font-weight:bold;display:inline-block;min-width:146px'>Order amount</span> Rs. ".$order_amount."</p></td></tr>";
				$msg .="<tr><td style='height:35px;'></td></tr>";
				$msg .="<tr><td style='width:50%;padding:20px;vertical-align:top'><p style='margin:0 0 10px 0;padding:0;font-size:14px;'><span style='display:block;font-weight:bold;font-size:13px'>Name</span>".$cusName."</p><p style='margin:0 0 10px 0;padding:0;font-size:14px;'><span style='display:block;font-weight:bold;font-size:13px;'>Email</span>".$cusEmail."</p><p style='margin:0 0 10px 0;padding:0;font-size:14px;'><span style='display:block;font-weight:bold;font-size:13px;'>Phone</span> +91-".$cusPNum."</p><p style='margin:0 0 10px 0;padding:0;font-size:14px;'></td></tr>";
				
				$msg .=" <tr><td colspan='2' style='font-size:20px;padding:30px 15px 0 15px;'>Items</td></tr>";
				$msg .="<tr><td colspan='2' style='padding:15px;'>";
                $sql = "SELECT a.productName,b.unit_price,b.qty,b.total_price from product a inner join tbl_order_details b on a.productId = b.product_id and b.fk_order_id = (select id from tbl_order where order_id='".$_POST['ORDERID']."')"; 
				$getOrderDetails = mysqli_query($connF,$sql);
			    while($rowOrder = mysqli_fetch_array($getOrderDetails)){
					$msg .="<p style='font-size:14px;margin:0;padding:10px;border:solid 1px #ddd;font-weight:bold;'><span style='display:block;font-size:13px;font-weight:normal;'>".$rowOrder['productName']."</span><span style='display:block;font-size:13px;font-weight:normal;'>".$rowOrder['unit_price']."</span><span style='display:block;font-size:13px;font-weight:normal;'>".$rowOrder['qty']."</span><span style='display:block;font-size:13px;font-weight:normal;'>".$rowOrder['total_price']."</span></p>";	
			    }
				
				$msg .="</td></tr>";
				$msg .=" </tbody><tfooter><tr><td colspan='2' style='font-size:14px;padding:50px 15px 0 15px;'>";
				$msg .="<strong style='display:block;margin:0 0 10px 0;'>Regards</strong> Medplus<br><b>Email:</b> medplus@gmail.com </td></tr></tfooter></table></body></html>";
			
			   

				
            	$mail = new PHPMailer\PHPMailer\PHPMailer();
				
				$mail->IsSMTP(); // enable SMTP
				//$mail->SMTPDebug = 2; // debugging: 1 = errors and messages, 2 = messages only
				//authentication SMTP enabled
				$mail->SMTPAuth = true; 
				$mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for Gmail
				$mail->Host = "smtp.gmail.com";
				// Gmail 465 or 587
				$mail->Port = 465; 
				$mail->Username = "medlife570@gmail.com";
				$mail->Password = "Medlife17";
				$mail->SetFrom("medlife570@gmail.com","Medplus");
				$mail->AddReplyTo($cusEmail,$cusName);
				$mail->Subject = "Your Order Details at Medplus";
				$mail->MsgHTML($msg);
				$mail->AddAddress($cusEmail);
                if(!$mail->Send()) {
					echo "Mailer Error: " . $mail->ErrorInfo;
				}else{
					echo "Message has been sent";
				}

            /******************************/
		}
		echo '</div>
					 
		</div>
	  </div>
	 </div>
	</div>';
	} else {
		echo "<b>Checksum mismatched.</b>";
		//Process transaction as suspicious.
	} ?>
        <!--Add JavaScript Files-->
        <script src="../resources/js/jquery.min.js"></script>
        <script src="../resources/js/bootstrap.min.js"></script>
        <!--	Google Recaptcha -->
        <script src='https://www.google.com/recaptcha/api.js'></script>
    </body>


</html>
