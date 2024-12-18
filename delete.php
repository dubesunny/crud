<?php
include("dbconnect.php");
if(isset($_GET['id'])){
    $id = $_GET['id'];
    $query = "delete from user where id = :id";
    $stmt = $dbcon->prepare($query);
    $stmt->execute(['id'=>$id]);
    if($stmt){
        echo "1 row deleted";
        header('location:index.php');
    }else{
        echo "not deleted";
    }
}
?>