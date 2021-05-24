<?php
    require_once 'auth.php';

    if(checkAuth()==0) {
        exit;
    }
    $id_session = $_GET['id_session'];
    $idPreferito = $_GET['idPreferito'];

    $conn = mysqli_connect($dbconfig['host'],$dbconfig['user'], $dbconfig['password'], $dbconfig['name']) or die("errore:" .mysqli_connect_error());

    $userid = mysqli_real_escape_string($conn, $userid);

    $query = "  DELETE FROM PREFERITI WHERE id_session =".$id_session ." AND id_preferito =" .$idPreferito ."    ";
    
    $res = mysqli_query($conn, $query);
?>