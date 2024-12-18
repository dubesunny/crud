<?php
    include('dbconnect.php');
    if(isset($_POST['submit'])){
        $name = $_POST['name'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        $selectedOptions = $_POST['hobby'];
        $gender = $_POST['Gender'];
        $address = $_POST['address'];
        $hobby = implode(",",$selectedOptions);

        $image = rand(1111,9999).'_'.$_FILES['photo']['name'];
        move_uploaded_file($_FILES['photo']['tmp_name'],'uploads/'.$image);

        $check_exist = "select * from user where name = :name";
        $stmt = $dbcon->prepare($check_exist);
        $stmt->execute(['name'=>$name]);

        if($stmt->rowCount() > 0){
            echo "User Already Registered.";
        }else{
            $insert_query = "insert into user (name,photo,email,phone,hobby,gender,address) values(?,?,?,?,?,?,?)";
            $stmt = $dbcon->prepare($insert_query);
            $res = $stmt->execute([$name,$image,$email,$phone,$hobby,$gender,$address]);    
            if($res){
                echo "Insert Successfully";
            }else{
                echo "Data Not Inserted";
            }
        }
    }else if(isset($_POST['update'])){
        $id = $_POST['id'];
        $name = $_POST['name'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        $selectedOptions = $_POST['hobby'];
        $gender = $_POST['Gender'];
        $address = $_POST['address'];
        $hobby = implode(",",$selectedOptions);

        if(isset($id) && $id != ''){
            if($_FILES['photo']['tmp_name'] != ''){
                $image = rand(1111,9999).'_'.$_FILES['photo']['name'];
                move_uploaded_file($_FILES['photo']['tmp_name'],'uploads/'.$image);

                $sql = "UPDATE user SET name = :name, photo = :photo, email = :email, phone = :phone, hobby = :hobby, 
                    gender = :gender, address = :address WHERE id = :id";

                $stmt = $dbcon->prepare($sql);
                $res = $stmt->execute(['name'=>$name,'photo'=>$image,'email'=>$email,'phone'=>$phone,'hobby'=>$hobby,
                    'gender'=>$gender,'address'=>$address,'id'=>$id]);
                if($res){
                    echo "Data updated";
                }else{
                    echo "Data not updated";
                }
            }else{
                $sql = "UPDATE user SET name = :name, email = :email, phone = :phone, hobby = :hobby, 
                    gender = :gender, address = :address WHERE id = :id";
                $stmt = $dbcon->prepare($sql);
                $res = $stmt->execute(['name'=>$name,'email'=>$email,'phone'=>$phone,'hobby'=>$hobby,
                    'gender'=>$gender,'address'=>$address,'id'=>$id]);
                if($res){
                    echo "Data updated";
                }else{
                    echo "Data not updated";
                }
            }
                

        }else{
            echo "Something went wrong";
        }

    }
?>