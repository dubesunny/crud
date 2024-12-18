<?php
include('dbconnect.php');
$query = "select * from `user`";
$stmt = $dbcon->prepare($query);
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PHP CRUD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
</head>

<body>
    <div class="py-5">
        <div class="container justify-content-center shadow">
            <div class="display-6 fw-bold py-3">Employees Details <a href="addEmployee.php"
                    class="p-2 btn btn-success float-end" style="font-size: 18px;"><i class="fa fa-add"></i> Add New
                    Employees </a></div>
            <div class="py-3">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Photo</th>
                            <th scope="col">Email</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Hobby</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Address</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                                foreach($result as $item){
                            ?>
                        <tr>
                            <th scope="row"><?php echo $item['id']?></th>
                            <td><?php echo $item['name']?></td>
                            <td><img src="uploads/<?php echo $item['photo']?>" class="w-80 m-2" height="50px" alt="image">
                            </td>
                            <td><?php echo $item['email']?></td>
                            <td><?php echo $item['phone']?></td>
                            <td><?php echo $item['hobby']?></td>
                            <td><?php echo $item['gender']?></td>
                            <td><?php echo $item['address']?></td>
                            <td> <a href="?id=<?=$item['id']?>" class="mx-1 btn-info view-btn" data-id=<?=$item['id']?>
                                    data-bs-toggle="modal" data-bs-target="#employeeDetails"><i
                                        class="fa fa-eye"></i></a> <a href="update.php?id=<?=$item['id']?>"
                                    class="mx-1"><i class="fa fa-pencil"></i></a> <a
                                    href="delete.php?id=<?=$item['id']?>" class="mx-1"><i class="fa fa-trash"></i></a>
                            </td>
                        </tr>
                        <?php
                                }?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="employeeDetails" tabindex="-1" aria-labelledby="employeeDetailsLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">User Details</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="py-2 text-center">
                    <img id="empPhoto" src="" class="img-thumbnail mb-3" style="max-width: 100px;" alt="User Photo">
                        <hr class="my-2">
                        <div class="row">
                            <div class="col-md-12">
                                <p><strong>Name:</strong> <span id="empName"></span></p>
                                <p><strong>Email:</strong> <span id="empEmail"></span></p>
                                <p><strong>Phone:</strong> <span id="empPhone"></span></p>
                                <p><strong>Hobby:</strong> <span id="empHobby"></span></p>
                                <p><strong>Gender:</strong> <span id="empGender"></span></p>
                                <p><strong>Address:</strong> <span id="empAddress"></span></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.view-btn').forEach(a => {
            a.addEventListener('click', function() {
                const employee_id = this.getAttribute('data-id');
                fetch('fetch-employee.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: 'id=' + employee_id
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.error) {
                            alert(data.error);
                        } else {
                            document.getElementById('empName').innerText = data.name;
                            document.getElementById('empPhoto').src = 'uploads/'+data.photo;
                            document.getElementById('empEmail').innerText = data.email;
                            document.getElementById('empPhone').innerText = data.phone;
                            document.getElementById('empHobby').innerText = data.hobby;
                            document.getElementById('empGender').innerText = data.gender;
                            document.getElementById('empAddress').innerText = data.address;
                        }
                    })
                    .catch(error => console.error('Error Fetching Data', error))
            })
        })
    })
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous">
    </script>
</body>

</html>