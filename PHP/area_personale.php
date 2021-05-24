<?php
    require_once 'auth.php';
    if(!$id_session = checkAuth()) {
        header("Location: login.php");
        exit;
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Acme&family=Lobster&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&family=Josefin+Sans:ital,wght@1,600&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@700&display=swap" rel="stylesheet">
        <title>Area Personale - O46002218</title>
        <link rel="stylesheet" href="../CSS/area_personale.css">
        <script src="../JS/fetch_areaPersonale.js" defer></script>
    </head>
    <body>
        <header>   
            <div id="logo">
                idealBank
            </div>
            <div id="links">
                <a href="mhw1.php">Home</a>
                <a href="mhw2.php">Info</a>
                <a href="mhw3.php">Servizi</a>
                <a href="#footer">Contatti</a>
                <b class="bottone" href="area_personale.php">Area personale</b>
                <a href="logout.php">Logout</a>
            </div>
        </header>
        
        <article>
            <section id="benvenuto">
                <div id="illustrazione">
                    <img src="../foto/Money-back guarantee.svg">
                </div>

                <div id="testo">
                    <h1>
                        Benvenuto/a, <?php echo $_SESSION['username']?> <br>
                        Accesso effettuato correttamente! <br>
                        Questa è la tua area personale di idealBank!
                    </h1>
                    <p>Il codice del tuo conto è: <strong><?php echo $_SESSION['id_conto'] ?></strong><br>
                        Qui puoi avere informazioni sui tuoi movimenti, <br>
                        verificare il tuo saldo ed effettuare un versamento
                    </p>
                    <div id="menu">
                        <a id="mie_operazioni">Le mie operazioni</a>
                        <a id="mio_saldo">Il mio saldo</a>
                        <a id="effettua">Effettua versamento</a>
                    </div>
                </div>                
            </section>

            <section id="contenuti" class="hidden">
                <img src="../foto/E-BANKING.svg">
            </section> 
        </article>
        
        <footer id="footer">
            <address>Gestione di banche e filiali</address>
            <p>Lorenzo Tomasello<br/>
            O460022018<br/> 
            Ingegneria Informatica - Canale M-Z<br/>
            Università degli Studi di Catania</p>
        </footer>
    </body>
</html>