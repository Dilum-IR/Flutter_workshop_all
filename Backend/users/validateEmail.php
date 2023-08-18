<?php
    if (isset($_POST['submit']) == "true") {
        
        $email = $_POST['user_email'];

        require_once 'functions.php';
        require_once '../dbh.php';

        $emailExists = emailExists($conn, $email);

        if ($emailExists == false) {
            echo json_encode(array("emailFound" => false));
            exit();
        } else {
            echo json_encode(array("emailFound" => true));
            exit();
        }
    }