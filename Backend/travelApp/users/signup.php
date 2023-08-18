<?php
    if (isset($_POST['submit']) == "true") {

        $firstName = $_POST['user_firstname'];
        $email = $_POST['user_email'];
        $phone = $_POST['user_phone'];
        $password = $_POST['user_password'];

        require_once 'functions.php';
        require_once '../dbh.php';

        $result = createUser($conn, $firstName, $email, $phone, $password);
        
        if ($result === true) {
            echo json_encode(array("success" => true));
        } else {
            echo json_encode(array("success" => false));
        }
        exit();
    }