<?php
include('dbconnect.php');
$id = $_GET['id'];
$query = "select * from user where id = :id";
$stmt = $dbcon->prepare($query);
$stmt->execute(['id'=>$id]);

if($stmt->rowCount() > 0){
    $result = $stmt->fetch();
    $hobby = explode(",",$result['hobby']);
    $current_image = $result['photo'];
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
</head>

<body>
    <div class="container">
        <div class="header">
            <h2>NEW EMPLOYEE</h2>
        </div>
        <form action="authcode.php" id="addEmployee" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<?=$id?>">
            <div class="form-element">
                <label for="" class="important">Name</label>
                <input type="text" name="name" id="name" value="<?=$result['name']?>">
                <div class="field-error"></div>
            </div>
            <div class="form-element">
                <label for="" class="important">Photo</label>
                <input type="file" name="photo" id="photo"> 
                <?php
                if(isset($current_image)){
                    ?>
                        <img src="uploads/<?=$current_image?>" alt="photo" class="w-100" height="80px">
                    <?php
                }
            ?>
                <div class="field-error"></div>
            </div>
            <div class="form-element">
                <label for="" class="important">Email</label>
                <input type="email" value="<?=$result['email']?>" name="email" id="email">
                <div class="field-error"></div>
            </div>
            <div class="form-element">
                <label for="" class="important">Phone</label>
                <input type="tel" name="phone" value="<?=$result['phone']?>" id="phone">
                <div class="field-error"></div>
            </div>
            <div class="form-element">
                <label for="">Hobby</label>
                <div class="checkbox-group">
                    <label for="cricket">
                        
                        <input type="checkbox" name="hobby[]" value="cricket" <?php
                          if(in_array("cricket",$hobby)) echo "checked"
                          ?>>Cricket
                    </label>
                    <label for="singing">
                        <input type="checkbox" name="hobby[]" value="singing" <?php
                          if(in_array("singing",$hobby)) echo "checked"
                          ?>>Singing
                    </label>
                    <label for="dancing">
                        <input type="checkbox" name="hobby[]" value="dancing" <?php
                          if(in_array("dancing",$hobby)) echo "checked"
                          ?>>Dancing
                    </label>
                </div>
                <div class="field-error"></div>
            </div>
            <div class="form-element" class="important">
                <label for="">Gender</label>
                <div class="radio-group">
                    <label for="male">
                        <input type="radio" name="Gender" value="male" <?php if($result['gender'] === "male") echo "checked"?>>Male
                    </label>
                    <label for="female">
                        <input type="radio" name="Gender" value="female" <?php if($result['gender'] === "female") echo "checked"?>>Female
                    </label>
                </div>
                <div class="field-error"></div>
            </div>
            <div class="form-element">
                <label for="" class="important">Address</label>
                <textarea name="address"  id="" cols="30" rows="10"><?=$result['address']?></textarea>
                <div class="field-error"></div>
            </div>
            <center>
                <input type="submit" value="UPDATE EMPLOYEE" name="update">
            </center>
        </form>
    </div>
    <?php
}else{
    echo "User with this creditionals not available";
}

?>
    <script src="script.js"></script>
    <script>
         alertify.set('notifier','position', 'top-right');
         alertify.success('Current position : ' + alertify.get('notifier','position'));
    </script>
   
</body>

</html>