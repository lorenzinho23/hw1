<?php
    require_once 'auth.php';

    if(checkAuth()==0) {
        exit;
    }

    $id_session = $_GET['id_session'];

    $conn = mysqli_connect($dbconfig['host'],$dbconfig['user'], $dbconfig['password'], $dbconfig['name']) or die("errore:" .mysqli_connect_error());

    $query = "SELECT P.id_preferito as idPreferito, B.nome as Nome, B.codice_abi as Codice, B.immagine as Foto, B.descrizione as Descrizione, B.logo as Logo
            FROM PREFERITI P JOIN BANCA B on P.id_preferito = B.codice_abi
            WHERE id_session =" .$id_session;

    $res = mysqli_query($conn, $query) or die(mysqli_error($conn));

    $array = array();

    while($row=mysqli_fetch_assoc($res)) {
        $array[] = array(
            'idPreferito' =>$row['idPreferito'],
            'nome' =>$row['Nome'],
            'codice' =>$row['Codice'],
            'descrizione' =>$row['Descrizione'],
            'foto' =>$row['Foto'],
            'logo' =>$row['Logo'],
        );
    }
    
    echo json_encode($array);
?>