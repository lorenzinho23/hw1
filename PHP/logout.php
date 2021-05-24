<?php
    include 'dbconfig.php';

    require_once 'auth.php';
    
    if(!$id_session = checkAuth()) {
        // Se non è settata alcuna credenziale rimando al login
        header("Location: login.php");
        exit;
    }
    else {
        // Distruggo la sessione esistente
        session_start();
        session_destroy();
    
        header('Location: mhw1.php');
    }
    

    
?>