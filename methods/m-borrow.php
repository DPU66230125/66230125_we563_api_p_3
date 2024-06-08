<?php

function addItem($conn, $body)
{
    $name = $body['name'];
    $image = $body['image'];
    $stock_qty = (int)$body['stock_qty'];

    $sql = "INSERT INTO `items`(`name`, `image`, `stock_qty`) 
            VALUES ('$name', '$image', $stock_qty)";

    $result = $conn->query($sql);

    if ($result == TRUE) {
        $last_id = $conn->insert_id;
        $response = new Response(true, array('ID' => $last_id));
        return $response;
    } else {
        $response = new Response(false, array('message' => 'เกิดข้อผิดพลาดไม่สามารถบันทึกการยืมได้'));
        return $response;
    }
}

function getAvailableItems($conn)
{
    $sql = "SELECT * FROM `items` WHERE `stock_qty` > 0";
    $result = $conn->query($sql);

    $arr = [];
    if ($result == TRUE) {
        while ($row = $result->fetch_assoc()) {
            $data = (object)$row;

            array_push($arr, $data);
        }
        $response = new Response(true, $arr);
        return $response;
    } else {
        $response = new Response(false, array('message' => 'เกิดข้อผิดพลาดไม่สามารถโหลดข้อมูลสิ่งของได้'));
        return $response;
    }
}

function getItem($conn, $id)
{
    $sql = "SELECT * FROM `items` WHERE `ID`=$id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $data = null;
        while ($row = $result->fetch_assoc()) {
            $data = (object)$row;
        }
        $response = new Response(true, $data);
        return $response;
    } else {
        $response = new Response(false, array('message' => 'เกิดข้อผิดพลาดไม่สามารถโหลดข้อมูลสิ่งของ'));
        return $response;
    }
}

function updateItem($conn, $body)
{
    $ID = $body['ID'];
    $name = $body['name'];
    $stock_qty = $body['stock_qty'];
    $image = $body['image'];

    $sql = "UPDATE `items` SET `name`='$name', `stock_qty`=$stock_qty, `image`='$image'
            WHERE `ID`='$ID'";

    $result = $conn->query($sql);

    if ($result == TRUE) {
        $response = new Response(true, array());
        return $response;
    } else {
        $response = new Response(false, array('message' => 'เกิดข้อผิดพลาดไม่สามารถแก้ไขสิ่งของได้'));
        return $response;
    }
}

function borrowItem($conn, $body)
{
    $item_id = $body['item_id'];
    $user_id = $body['user_id'];
    $qty = (int)$body['qty'];

    $res1 = getItem($conn, $item_id);
    if ($res1->success) {
        $item = $res1->data;
        if ($item->stock_qty > $qty) {
            //OK
            $item->stock_qty = $item->stock_qty - $qty;
            updateItem($conn, (array)$item);

            $response = createRecord($conn, $body);
        } else {
            $response = new Response(false, array('message' => 'จำนวนที่ต้องการยืมมีมากกว่าของที่อยู่ในคลัง'));
        }
    } else {
        $response = $res1;
    }
    return $response;
}

function createRecord($conn, $body)
{
    $item_id = $body['item_id'];
    $user_id = $body['user_id'];
    $qty = (int)$body['qty'];
    $borrow_date = $body['borrow_date'];
    $return_date = $body['return_date'];

    $sql = "INSERT INTO `records`(`item_id`, `user_id`, `qty`, `borrow_date`, `return_date`) 
            VALUES ('$item_id','$user_id', $qty, '$borrow_date', '$return_date')";

    $result = $conn->query($sql);

    if ($result == TRUE) {
        $last_id = $conn->insert_id;
        $response = new Response(true, array('ID' => $last_id));
        return $response;
    } else {
        $response = new Response(false, array('message' => 'เกิดข้อผิดพลาดไม่สามารถบันทึกการยืมได้'));
        return $response;
    }
}

function returnItem($conn, $body)
{
    $record_id = $body['record_id'];

    $res1 = getRecord($conn, $record_id);
    if ($res1->success) {
        $record = $res1->data;
        $res2 = getItem($conn, $record->item_id);
        if ($res2->success) {
            $item = $res2->data;
            $item->stock_qty += $record->qty;
            updateItem($conn, (array)$item);
            createArchive($conn, (array)$record);
            $response = deleteRecord($conn, $record_id);
        } else {
            $response = $res2;
        }
    } else {
        $response = $res1;
    }
    return $response;
}

function getRecord($conn, $id)
{
    $sql = "SELECT * FROM `records` WHERE `ID`=$id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $data = null;
        while ($row = $result->fetch_assoc()) {
            $data = (object)$row;
        }
        $response = new Response(true, $data);
        return $response;
    } else {
        $response = new Response(false, array('message' => 'เกิดข้อผิดพลาดไม่สามารถโหลดรายการยืมได้'));
        return $response;
    }
}

function deleteRecord($conn, $record_id)
{
    $sql = "DELETE FROM `records` WHERE `ID`=$record_id";

    $result = $conn->query($sql);

    if ($result == TRUE) {
        $response = new Response(true, array());
        return $response;
    } else {
        $response = new Response(false, array('message' => 'เกิดข้อผิดพลาดไม่สามารถลบรายการยืมได้'));
        return $response;
    }
}

function createArchive($conn, $body)
{
    $item_id = $body['item_id'];
    $user_id = $body['user_id'];
    $qty = (int)$body['qty'];
    $borrow_date = $body['borrow_date'];
    $return_date = $body['return_date'];

    $sql = "INSERT INTO `archives`(`item_id`, `user_id`, `qty`, `borrow_date`, `return_date`) 
            VALUES ('$item_id','$user_id', $qty, '$borrow_date', '$return_date')";

    $result = $conn->query($sql);

    if ($result == TRUE) {
        $last_id = $conn->insert_id;
        $response = new Response(true, array('ID' => $last_id));
        return $response;
    } else {
        $response = new Response(false, array('message' => 'เกิดข้อผิดพลาดไม่สามารถบันทึกประวัติยืมคืนได้'));
        return $response;
    }
}

function myRecords($conn, $user_id){
    $sql = "SELECT * FROM `records` WHERE `user_id`=$user_id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $arr = [];
        while ($row = $result->fetch_assoc()) {
            array_push($arr, (object)$row);
        }
        $response = new Response(true, $arr);
        return $response;
    } else {
        $response = new Response(false, array('message' => 'เกิดข้อผิดพลาดไม่สามารถโหลดรายการยืมของได้'));
        return $response;
    }
}

function getArchives($conn)
{
    $sql = "SELECT archives.*, users.username FROM `archives` INNER JOIN `users` ON archives.user_id=users.ID";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $arr = [];
        while ($row = $result->fetch_assoc()) {
            array_push($arr, (object)$row);
        }
        $response = new Response(true, $arr);
        return $response;
    } else {
        $response = new Response(false, array('message' => 'เกิดข้อผิดพลาดไม่สามารถโหลดรายการยืมของได้'));
        return $response;
    }
}
