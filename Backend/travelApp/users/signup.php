<?php

    include "../dbh.php";

    $firstName = $_POST['user_firstname'];
    $email = $_POST['user_email'];
    $phone = $_POST['user_phone'];
    $password = $_POST['user_password'];
    $encryptPassword = md5($password);

    $dbQuary = "INSERT INTO user (first_name,email,phone,password) VALUES ('$firstName','$email','$phone','$encryptPassword')";
    
    $result = mysqli_query($conn,$dbQuary);

    if ($result)
        echo json_encode(array("success"=>true));
    else
        echo json_encode(array("success"=>false));

    ?>