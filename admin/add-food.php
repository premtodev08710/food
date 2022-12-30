<?php include('partials/menu.php'); ?>

<div class="main-content">
    <div class="wrapper">
        <h1>เพิ่มรายการอาหาร</h1>

        <br><br>

        <?php
        if (isset($_SESSION['upload'])) {
            echo $_SESSION['upload'];
            unset($_SESSION['upload']);
        }
        ?>
<div align ="center">
        <form action="" method="POST" enctype="multipart/form-data">

            <table class="tbl-150">

                <tr>
                    <td>ชื่ออาหาร : </td>
                    <td>
                        <input type="text" name="title" placeholder="ชื่ออาหาร">
                    </td>
                </tr>

                <tr>
                    <td>คําอธิบาย :</td>
                    <td>
                        <textarea name="description" cols="30" rows="5" placeholder="คําอธิบาย"></textarea>
                    </td>
                </tr>

                <tr>
                    <td>ราคา : </td>
                    <td>
                        <input type="number" name="price">
                    </td>
                </tr>

                <tr>
                    <td>เลือกรูป : </td>
                    <td>
                        <input type="file" name="image">
                    </td>
                </tr>

                <tr>
                    <td>หมวดหมู่ : </td>
                    <td>
                        <select name="category">

                            <?php
                            $sql = "SELECT * FROM tbl_category WHERE active='Yes'";

                            $res = mysqli_query($conn, $sql);

                            $count = mysqli_num_rows($res);

                            if ($count > 0) {
                                while ($row = mysqli_fetch_assoc($res)) {
                                    $id = $row['id'];
                                    $title = $row['title'];

                            ?>

                                    <option value="<?php echo $id; ?>"><?php echo $title; ?></option>

                                <?php
                                }
                            } else {
                                ?>
                                <option value="0">
                                    ไม่พบหมวดหมู่</option>
                            <?php
                            }


                            ?>

                        </select>
                    </td>
                </tr>

                <tr>
                    <td>แนะนำ: </td>
                    <td>
                        <input type="radio" name="featured" value="Yes"> ใช่
                        <input type="radio" name="featured" value="No">ไม่ใช่
                    </td>
                </tr>

                <tr>
                    <td>ปิด/เปิด: </td>
                    <td>
                        <input type="radio" name="active" value="Yes"> เปิด
                        <input type="radio" name="active" value="No">ปิด
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input type="submit" name="submit" value="เพิ่มอาหาร" class="btn-secondary">
                    </td>
                </tr>

            </table>

        </form>

</div>
        <?php

        if (isset($_POST['submit'])) {

            $title = $_POST['title'];
            $description = $_POST['description'];
            $price = $_POST['price'];
            $category = $_POST['category'];

            if (isset($_POST['featured'])) {
                $featured = $_POST['featured'];
            } else {
            }

            if (isset($_POST['active'])) {
                $active = $_POST['active'];
            } else {
            }

            if (isset($_FILES['image']['name'])) {
                $image_name = $_FILES['image']['name'];

                if ($image_name != "") {
                    $ext = end(explode('.', $image_name));



                    $src = $_FILES['image']['tmp_name'];

                    $dst = "../images/food/" . $image_name;

                    $upload = move_uploaded_file($src, $dst);

                    if ($upload == false) {
                        $_SESSION['upload'] = "<div class='error'>Failed to Upload Image.</div>";
                        header('location:' . SITEURL . 'admin/manage-food.php');
                        die();
                    }
                }
            } else {
            }


            $sql2 = "INSERT INTO tbl_food SET 
                    title = '$title',
                    description = '$description',
                    price = $price,
                    image_name = '$image_name',
                    category_id = $category,
                    featured = '$featured',
                    active = '$active'
                ";

            $res2 = mysqli_query($conn, $sql2);

            if ($res2 == true) {
                $_SESSION['add'] = "<div class='success'>เพิ่มสำเร็จ.</div>";
                echo "<script>
             
                   window.location = 'manage-food.php';
                    </script>";
            } else {
                $_SESSION['add'] = "<div class='error'>ผิดพลาด</div>";
                echo "<script>
             
                    window.location = 'manage-food.php';
                     </script>";
            }
        }

        ?>


    </div>
</div>

<?php include('partials/footer.php'); ?>