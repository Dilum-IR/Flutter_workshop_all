<?php
    function emailExists($conn, $email)
    {
        $sql = 'SELECT * FROM user WHERE email = ?;';
        $stmt = mysqli_stmt_init($conn);

        if (mysqli_stmt_prepare($stmt, $sql)) {
            mysqli_stmt_bind_param($stmt, 's', $email);
            mysqli_stmt_execute($stmt);

            $resultdata = mysqli_stmt_get_result($stmt);

            if ($row = mysqli_fetch_assoc($resultdata)) {
                return $row;
            } else {
                return false;
            }
        }
        mysqli_stmt_close($stmt);
        exit();
    }

    function createUser($conn, $firstName, $email, $phone, $password)
    {
        $sql = "INSERT INTO user (first_name,email,phone,password) VALUES (?,?,?,?);";
        $stmt = mysqli_stmt_init($conn);

        if (mysqli_stmt_prepare($stmt, $sql)) {
            $hashPwd = password_hash($password, PASSWORD_DEFAULT);
            mysqli_stmt_bind_param($stmt, 'ssss', $firstName, $email, $phone, $hashPwd);
            mysqli_stmt_execute($stmt);
            mysqli_stmt_close($stmt);
            return true;
        } else {
            return false;
        }
    }

    function login($conn, $email, $password)
    {
        $row = emailExists($conn, $email);
        if ($row != false) {
            $pwdHashed = $row['password'];
            $pwdCheck = password_verify($password, $pwdHashed);

            if($pwdCheck == true)
                return $row['first_name'];
        }
        return false;
    }