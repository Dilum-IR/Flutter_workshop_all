<?php
    if (isset($_POST['submit']) == "true") {

        $email = $_POST['user_email'];
        $password = $_POST['user_password'];

        require_once 'functions.php';
        require_once '../dbh.php';

        $result = login($conn, $email, $password);

        if ($result != false) {
            echo json_encode(array("login_success" => true, "user" => $result));
        } else {
            echo json_encode(array("login_success" => false));
        }
    }