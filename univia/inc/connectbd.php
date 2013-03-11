<?php

$host = 'localhost';
$usuario = 'eliezerj_univia';
$senha = '1qaz@WSX';
$db = 'eliezerj_univia';


mysql_connect($host,$usuario,$senha) or die(mysql_error());
mysql_select_db($db) or die(mysql_error());
