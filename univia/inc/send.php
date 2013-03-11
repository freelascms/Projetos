<?php
//require_once "connectbd.php";
require_once "../inc/class.phpmailer.php";
//require_once "inc/class.smtp.php";

$name = $_POST["name"];
$mail = $_POST["mail"];
$phone = $_POST["phone"];
$courses = $_POST["courses"];
$comments = $_POST["comments"];

// cadastramento no banco

/*$querySQL = "INSERT INTO tb_cadastroespera (id, nome, email, fone, curso, mensagem, data)";
$querySQL .= " VALUES ('', '".utf8_encode($name)."', '".utf8_encode($mail)."', '".utf8_encode($phone)."', '".utf8_encode($courses)."', '".utf8_encode($comments)."', NOW())";

mysql_query($querySQL) or die("Could not perform select query - " . mysql_error());
*/

// fim do cadastramento no banco

//var_dump($_POST);
//die;

$mailto = "eliezer.junior.adsw@gmail.com";

$body = '
	<strong>Nome: </strong>' . $name . '
	<br/>
	<strong>E-mail: </strong>' . $mail . '
	<br/>
	<strong>Telefone: </strong>' . $phone . '
	<br/>
	<strong>Curso: </strong>' . $courses . '
	<br/>
	<strong>Mensagem: </strong>' . $comments . '
	<br/>
';

$mail = new PHPMailer();

//$mail->CharSet = 'utf-8';
$mail->From = "contato@institutounivia.com.br";
$mail->FromName = "Site Instituto Univia";
$mail->AddAddress($mailto);

$mail->Subject = "Contato pelo Site";
$mail->Body = ($body);
$mail->IsHTML(true); 

/*
//freelassmtp@yahoo.com.br 1zqa!ZQA
$mail->Host = SMTP_HOST; // SMTP servers
$mail->Username = SMTP_USER; // SMTP username
$mail->Password = SMTP_SENHA; // SMTP password

$mail->From = SMTP_EMAIL;//$objEmail->emailDe;
$mail->FromName = $objEmail->nomeDe;
$mail->IsSMTP(); 

*/

if ($mail->Send()) {
//var_dump($mail->ErrorInfo);
	print "1";
} else {
	print "0";
}