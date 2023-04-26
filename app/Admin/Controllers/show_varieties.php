<?php

include('db_con.php');

$k = $_POST['id'];
$k = trim($k);

$db = Database::getInstance();
$mysqli = $db->getConnection();

$q = "SELECT * FROM `assignments` WHERE `id`='{$k}'";

$res = mysqli_query($mysqli, $q);

while($rows = mysqli_fetch_array($res)){
    ?>
    <tr>
        <td><?php echo $rows['assignment_number']; ?></td>
        <td><?php echo $rows['characters']; ?></td>
        <td>
            <?php if ($rows['status'] =='Available') { ?>
                <b class="text text-success"><?php echo $rows['status']; ?></b>
            <?php } else {?>
                <b class="text text-danger"><?php echo $rows['status']; ?></b>
            <?php }?>
        </td>
        <td>
            <?php if ($rows['attempted'] =='1') { ?>
                <b>YES</b> <i class="fa fa-check-circle text-success"></i>
            <?php } else {?>
                <b>NO</b> <i class="fa fa-check-circle text-danger"></i>
            <?php }?>
        </td>

        <td><?php echo $rows['attempt_duration']; ?> mins</td>
        <td><?php echo $rows['attempt_duration']; ?> SCORE</td>
        <td><?php echo $rows['start_time']; ?></td>
        <td><?php echo $rows['end_time']; ?></td>
    </tr>
    <?php
}
?>