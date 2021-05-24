<?php
    // Controllo che l'username sia unico andando a vedere se gia presente nel database
    require 'dbconfig.php';

    if (!isset($_GET["q"])) {
        echo "Non dovresti essere qui";
        exit;
    }

    header("Content-Type: application/json");

    // Ci intefacciamo al database
    $conn = mysqli_connect($dbconfig['host'], $dbconfig['user'], $dbconfig['password'], $dbconfig['name']);

    $codice = mysqli_real_escape_string($conn, $_GET['q']);

    $query = "SELECT codice FROM CLIENTE WHERE codice = '$codice'";

    $res = mysqli_query($conn, $query) or die(mysqli_error($conn));

    echo json_encode(array('exists' => mysqli_num_rows($res) > 0 ? true : false));

    mysqli_close($conn);

?>