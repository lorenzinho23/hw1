<?php
    require_once 'auth.php';
    
    header('Content-Type: application/json');

    $conn = mysqli_connect($dbconfig['host'],$dbconfig['user'], $dbconfig['password'], $dbconfig['name']) or die("errore:" .mysqli_connect_error());
    
    $query = "SELECT B.nome as Nome, S.citta as Citta, B.codice_abi as Codice, B.descrizione as Descrizione, B.immagine as Foto, B.logo as Logo
               FROM SEDE S JOIN BANCA B on S.banca = B.codice_abi";

    $res = mysqli_query($conn, $query) or die(mysqli_error($conn));

    $array = array();

    while($row=mysqli_fetch_assoc($res)) {
        $array[] = array(
            'nome' =>$row['Nome'],
            'citta' =>$row['Citta'],
            'codice' =>$row['Codice'],
            'descrizione' =>$row['Descrizione'],
            'foto' =>$row['Foto'],
            'logo' =>$row['Logo'],
        );
    }
    
    echo json_encode($array);
?>