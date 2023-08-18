<?php
    function emailExists($conn, $email){
        $sql = 'SELECT * FROM user WHERE email = ?;';
        $stmt = mysqli_stmt_init($conn);

        if(mysqli_stmt_prepare($stmt,$sql)){
            mysqli_stmt_bind_param($stmt,'s',$email);
            mysqli_stmt_execute($stmt);

            $resultdata = mysqli_stmt_get_result($stmt);

            if($row = mysqli_fetch_assoc($resultdata)){
                return $row;
            }
            else{
                return false;
            }
        }        
        mysqli_stmt_close($stmt);
    }