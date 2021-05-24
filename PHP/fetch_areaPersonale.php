<?php
    require_once 'auth.php';
    if (!$userid = checkAuth()) exit;
    
    header('Content-Type: application/json');
    
    $conn = mysqli_connect($dbconfig['host'],$dbconfig['user'], $dbconfig['password'], $dbconfig['name']) or die("errore:" .mysqli_connect_error());
    
    $userid = mysqli_real_escape_string($conn, $userid);

    $queryP = "SELECT id_conto FROM dati_login WHERE id_session =". $userid;
    $res_1 = mysqli_query($conn, $queryP);
    $row3 = mysqli_fetch_assoc($res_1);
    $idConto = $row3['id_conto'];

    $query = "SELECT COUNT(*) as Numero_operazioni
              FROM (CLIENTE C JOIN dati_login dl on C.codice = dl.codice) JOIN OPERAZIONE O on O.id_conto = dl.id_conto
              WHERE dl.id_session =".$userid;

    $query2 = "SELECT CO.saldo as Saldo
              FROM dati_login dl JOIN CONTO CO on dl.id_conto = CO.id
              WHERE dl.id_session =".$userid;


    $res = mysqli_query($conn, $query) or die(mysqli_error($conn));
    $res2 = mysqli_query($conn, $query2) or die(mysqli_error($conn));
    

    $array = array();

    while($row=mysqli_fetch_assoc($res)) {
        $array['Numero_tot'] = array(
            'numero' =>$row['Numero_operazioni'],
        );
    }

    while($row1=mysqli_fetch_assoc($res2)) {
        $array['Saldo'] = array(
            'saldo' =>$row1['Saldo'],
        );
    }

    echo json_encode($array);
?>