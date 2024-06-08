<?php
require_once('./config/header.php');
require_once('./config/db.php');
require_once('./config/response.php');

if (isset($_GET["method"])) {
    try {
        //code...
        $method = $_GET["method"];

        if($method == 'login'){
            $body = json_decode(file_get_contents('php://input'), true);
            $email = $body['username'];
            $password = $body['password'];
            $password_hash = md5($password);
            
            $sql = "SELECT users.id, users.username FROM users WHERE users.username='$email' AND users.password_hash='$password_hash'";
            $result = $conn->query($sql);
    
            if($result->num_rows > 0){
                $data = null;
                while($row = $result->fetch_assoc()) {
                    $data = $row;
                }
                $respose = new Response(true, (object)$data);
            }else{
                $respose = new Response(false, (object)array('message' => 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง'));
            }

            echo json_encode($respose);
        }else{
            http_response_code(505);
            echo 'unidentified method';
        }
    } catch (\Throwable $th) {
        //throw $th;
        http_response_code(505);
        echo $th;
    }
}else{
    http_response_code(404);
}



?>
