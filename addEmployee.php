<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css" />
</head>

<body>
    <div class="container">
        <div class="header">
            <h2>NEW EMPLOYEE</h2>
        </div>
        <form name="myform" onsubmit="return validation()" action="authcode.php" id="addEmployee" method="post" enctype="multipart/form-data">
            <!-- Name Field -->
            <div class="form-element">
                <label for="name" class="important">Name</label>
                <input type="text" name="name" id="name">
                <span class="field-error"></span>
            </div>

            <!-- Photo Field -->
            <div class="form-element">
                <label for="photo" class="important">Photo</label>
                <input type="file" name="photo" id="photo">
                <span class="field-error"></span>
            </div>

            <!-- Email Field -->
            <div class="form-element">
                <label for="email" class="important">Email</label>
                <input type="email" name="email" id="email">
                <span class="field-error"></span>
            </div>

            <!-- Phone Field -->
            <div class="form-element">
                <label for="phone" class="important">Phone</label>
                <input type="tel" name="phone" id="phone">
                <span class="field-error"></span>
            </div>

            <!-- Hobby Field -->
            <div class="form-element">
                <label for="hobby">Hobby</label>
                <div class="checkbox-group">
                    <label>
                        <input type="checkbox" name="hobby[]" value="cricket"> Cricket
                    </label>
                    <label>
                        <input type="checkbox" name="hobby[]" value="singing"> Singing
                    </label>
                    <label>
                        <input type="checkbox" name="hobby[]" value="dancing"> Dancing
                    </label>
                </div>
            </div>

            <!-- Gender Field -->
            <div class="form-element">
                <label class="important">Gender</label>
                <div class="radio-group">
                    <label>
                        <input type="radio" name="Gender" value="male"> Male
                    </label>
                    <label>
                        <input type="radio" name="Gender" value="female"> Female
                    </label>
                </div>
            </div>

            <!-- Address Field -->
            <div class="form-element">
                <label for="address" class="important">Address</label>
                <textarea name="address" id="address" cols="30" rows="10"></textarea>
                <span class="field-error"></span>
            </div>

            <!-- Submit Button -->
            <center>
                <input type="submit" value="ADD EMPLOYEE" name="submit">
            </center>
        </form>
    </div>
    <script src="script.js"></script>
</body>

</html>
