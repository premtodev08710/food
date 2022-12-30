<?php include('partials/menu.php'); ?>

<div class="main-content">
    <div class="wrapper">
        <h1>จัดการคําสั่งซื้อ</h1>

        <br /><br /><br />

        <?php
        if (isset($_SESSION['update'])) {
            echo $_SESSION['update'];
            unset($_SESSION['update']);
        }
        ?>
        <br><br>

        <table width="100%" class="">
            <tr>
                <th>ลำดับ</th>
                <th>อาหาร</th>
                <th>ราคา</th>
                <th>จำนวน</th>
                <th>รวม</th>
                <th>สั่งวันที่</th>
                <th>สถาณะ</th>
                <th>ชื่อลูกค้า</th>
                <th>ติดต่อลูกค้า</th>
                <!-- <th>Email</th> -->
                <th>ที่อยู่</th>
                <th>จัดการ</th>
            </tr>

            <?php
            //Get all the orders from database
            $sql = "SELECT * FROM tbl_order ORDER BY id DESC"; // DIsplay the Latest Order at First
            //Execute Query
            $res = mysqli_query($conn, $sql);
            //Count the Rows
            $count = mysqli_num_rows($res);

            $sn = 1; //Create a Serial Number and set its initail value as 1


            if ($count > 0) {
                //Order Available
                while ($row = mysqli_fetch_assoc($res)) {
                    //Get all the order details
                    $id = $row['id'];
                    $food = $row['food'];
                    $price = $row['price'];
                    $qty = $row['qty'];
                    $total = $row['total'];
                    $order_date = $row['order_time'];
                    $status = $row['status'];
                    $customer_name = $row['customer_name'];
                    $customer_contact = $row['customer_contact'];
                    $customer_email = $row['customer_email'];
                    $customer_address = $row['customer_address'];

            ?>

                    <tr>
                        <td><?php echo $sn++; ?>. </td>
                        <td><?php echo $food; ?></td>
                        <td><?php echo $price; ?></td>
                        <td><?php echo $qty; ?></td>
                        <td><?php echo $total; ?></td>
                        <td><?php echo $order_date; ?></td>

                        <td>
                            <?php
                            // Ordered, On Delivery, Delivered, Cancelled

                            if ($status == "Ordered") {
                                echo "<label>สั่ง</label>";
                            } elseif ($status == "On Delivery") {
                                echo "<label style='color: orange;'>กำลังจัดส่ง</label>";
                            } elseif ($status == "Delivered") {
                                echo "<label style='color: green;'>ส่ง</label>";
                            } elseif ($status == "Cancelled") {
                                echo "<label style='color: red;'>ยกเลิก</label>";
                            }
                            ?>
                        </td>

                        <td><?php echo $customer_name; ?></td>
                        <td><?php echo $customer_contact; ?></td>
                        <!-- <td><?php echo $customer_email; ?></td> -->
                        <td><?php echo $customer_address; ?></td>
                        <td>
                            <a href="<?php echo SITEURL; ?>admin/update-order.php?id=<?php echo $id; ?>" class="btn btn-secondary">แก้ไข</a>
                        </td>
                    </tr>

            <?php

                }
            } else {
                //Order not Available
                echo "<tr><td colspan='12' class='error'>Orders not Available</td></tr>";
            }
            ?>


        </table>
    </div>

</div>

<?php include('partials/footer.php'); ?>