<?php

$name = $_GET["client_name"];
$email = $_GET["client_email"];
$phone_number = $_GET["client_number"];
$message_box = $_GET["client_message"];
$venue_name = $_GET["venue_name"];


$message_combined = 'Name: ' . $name . "\r\n" .
        'Email Address: ' . $email . "\r\n" .
        'Phone Number: ' . $phone_number . "\r\n" .
        'Message: ' . $message_box;


$to      = 'matthewmarji@gmail.com';
$subject = $venue_name . " for " . $name;
$message = $message_combined;
$headers = 'From: boothandbottle@gmail.com' . "\r\n" .
    'Reply-To: boothandbottle@gmail.com' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

mail($to, $subject, $message, $headers);

?>
