<?php
    require_once 'auth.php';
    if (!$userid = checkAuth()) exit;

    if (isset($_GET["importo"])) {
        $conn = mysqli_connect($dbconfig['host'],$dbconfig['user'], $dbconfig['password'], $dbconfig['name']) or die("errore:" .mysqli_connect_error());

        $userid = mysqli_real_escape_string($conn, $userid);
        
        $queryP = "SELECT id_conto FROM dati_login WHERE id_session =". $userid;
        
        $res_1 = mysqli_query($conn, $queryP);
        
        $row3 = mysqli_fetch_assoc($res_1);
        
        $idConto = $row3['id_conto'];

        $importo = $_GET['importo'];

        $numero_operazione = rand(20,999);
        $query5 = "INSERT INTO VERSAMENTO (numero_operazione, id_conto, importo)VALUES ($numero_operazione, $idConto, $importo)";
        $res5 = mysqli_query($conn, $query5) or die(mysqli_error($conn));
    }
    
    header('Content-Type: application/json');

?>