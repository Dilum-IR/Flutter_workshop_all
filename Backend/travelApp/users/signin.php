<?php

if(isset($_POST['submit']) == "true"){

    include "../dbh.php";

    $email = $_POST['user_email'];
    $password = $_POST['user_password'];

    $encryptPassword = md5($password);
    $dbQuary = "SELECT * FROM user WHERE email = '$email' and password = '$encryptPassword'";

    $result = mysqli_query($conn,$dbQuary);

    // get user's name
    $userDatails = mysqli_fetch_assoc($result);
    $name = $userDatails["first_name"];

    //echo $name;

    if ($result->num_rows ==1) {
        echo json_encode(array("login_success"=>true,"user"=>$name));
    }
    else{
        echo json_encode(array("login_success"=>false));
    }

}