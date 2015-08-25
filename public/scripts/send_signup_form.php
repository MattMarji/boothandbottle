<?php

$email = $_GET["client_email"];

$message_combined = 'EMAIL: ' . $email;


$to      = 'matthewmarji@gmail.com';
$subject = "USER SIGNUP";
$message = $message_combined;
$headers = 'From: admin@boothandbottle.com' . "\r\n" .
    'Reply-To: admin@boothandbottle.com' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

mail($to, $subject, $message, $headers);

?>
