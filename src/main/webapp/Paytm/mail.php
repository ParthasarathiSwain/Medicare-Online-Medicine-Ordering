<?php
include_once('PHPMailer/src/PHPMailer.php');
include_once('PHPMailer/src/SMTP.php');
include_once('PHPMailer/src/Exception.php');
$mail = new PHPMailer\PHPMailer\PHPMailer();
$msj='<p>We recieved a password reset request. The link to reset your password is below.</p>';
$mail->IsSMTP(); // enable SMTP
$mail->SMTPDebug = 2; // debugging: 1 = errors and messages, 2 = messages only
//authentication SMTP enabled
$mail->SMTPAuth = true; 
$mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for Gmail
$mail->Host = "smtp.gmail.com";
//indico el puerto que usa Gmail 465 or 587
$mail->Port = 465; 
$mail->Username = "jaydevsamal160@gmail.com";
$mail->Password = "Sagar@15071998";
$mail->SetFrom("info@opentechz.com","Opentechz");
$mail->AddReplyTo("bib.mhnt@gmail.com","Bibhu");
$mail->Subject = "Inquiry received successfully";
$mail->MsgHTML($msj);
$mail->AddAddress("bib.mhnt@gmail.com");


if(!$mail->Send()) {
    echo "Mailer Error: " . $mail->ErrorInfo;
 } else {
    echo "Message has been sent";
 }

