<?php
include("dbconnect.php");
if(isset($_POST['id'])){
    $id = $_POST['id'];
    $query = "select * from user where id = :id";
    $stmt = $dbcon->prepare($query);
    $stmt->execute(["id"=>$id]);

    $record = $stmt->fetch(PDO::FETCH_ASSOC);

    if($record){
        echo json_encode($record);
    }else{
        echo json_encode(['error'=>'No employee find with this ID']);
    }
}
?>