<?php
require_once('./config/header.php');
require_once('./config/db.php');
require_once('./config/response.php');
require_once('./methods/m-borrow.php');

if (isset($_GET["method"])) {
    try {
        $method = $_GET["method"];
        $body = json_decode(file_get_contents('php://input'), true);
        $response = NULL;

        switch ($method) {
            case 'add-item': #เพิ่มรายการของ
                $response = addItem($conn, $body);
                break;
            case 'update-item': #อัพเดทรายการของ
                $response = updateItem($conn, $body);
                break;
            case 'available-items': #ดึงข้อมูลของที่สามารถใช้ยืมได้ (stock มีค่ามากกว่า 0)
                $response = getAvailableItems($conn);
                break;
            case 'borrow-item': #ยืมของ (สร้าง record และหักลบจำนวนใน stock)
                $response = borrowItem($conn, $body);
                break;
            case 'return-item': #คืนของ (สร้าง archive + ลบ record และบวกเพิ่มใน stock)
                $response = returnItem($conn, $body);
                break;
            case 'my-records': #รายการยืมของฉัน
                # code...
                if(isset($_GET['user_id'])){
                    $user_id = $_GET['user_id'];
                    $response = myRecords($conn, $user_id);
                }else{
                    $response = new Response(false, array('message' => 'unidentified user_id'));
                }
                break;
            case 'archives': #ประวัติการยืมคืน
                $response = getArchives($conn);
                break;
            default:
                $response = new Response(false, array('message' => 'unidentified method'));
                break;
        }

        echo json_encode($response);
    }catch (\Throwable $th) {
        //throw $th;
        http_response_code(500);
        echo $th;
    }
}else{
    http_response_code(404);
}