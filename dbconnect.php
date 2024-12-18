<?php
try{
    $server = 'localhost';
    $user = 'root';
    $password = '';
    $db = 'crud';

    $dbcon = new PDO("mysql:host=$server;dbname=$db",$user,$password);
    $dbcon->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);

}catch(PDOException $e){
    echo 'Error: '.$e->getMessage();
}
?>