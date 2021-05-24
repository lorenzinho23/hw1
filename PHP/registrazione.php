<?php
    require_once 'auth.php';

    // verifica l'accesso
    if(checkAuth())
    {
        // mi rimanda alla homepage
        header("Location: area_personale.php");
        exit;
    }
    
    // Verifica se esistono questi dati
    if(isset($_POST["username"]) && isset($_POST["password"]) 
       && isset($_POST["codice"]) && isset($_POST["citta"])
       && isset($_POST["regione"]) && isset($_POST["data_nascita"])) 
    {
        $error = array();
        // Stabilisco la connessione col database
        $conn = mysqli_connect($dbconfig['host'], $dbconfig['user'], $dbconfig['password'], $dbconfig['name']) or die(mysqli_connect_error());
       
        $username = mysqli_real_escape_string($conn, $_POST['username']);
        $password = mysqli_real_escape_string($conn, $_POST['password']);
        $codice = mysqli_real_escape_string($conn, $_POST['codice']);        
        $citta = mysqli_real_escape_string($conn, $_POST['citta']);
        $regione = mysqli_real_escape_string($conn, $_POST['regione']);
        $data_nascita = mysqli_real_escape_string($conn, $_POST['data_nascita']);
        //$idConto = mysqli_real_escape_string($conn, $_POST['id_conto']);
        $idConto = rand(100,999);
        
        // Controllo requisiti username
        if(strlen($username) < 5 ) {
            $error[] = "Username troppo corta (min 5 caratteri)";
        }
        else {
            // Effettuo la query
            $query = "SELECT username FROM dati_login WHERE username = '$username'";
            $res = mysqli_query($conn, $query);
            if (mysqli_num_rows($res) > 0) {
                $error[] = "Username gia usato";
            }
        }
        $pattern = '/^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[_.\-()?#;:!@])[0-9A-Za-z_.\-()?#;:!@]{8,20}$/';
        if(!preg_match($pattern, $password)) {
            $error[] = "La password non contiene i caratteri richiesti";
        }
        $password = password_hash($password, PASSWORD_BCRYPT);
        // else {
            // $codice = mysqli_real_escape_string($conn, $_POST['codice']);   
            if (count($error) == 0) {
                $query3 = "SELECT id FROM CONTO WHERE '$idConto' = id";
                $query2 = "SELECT codice_citta FROM CITTA WHERE '$citta' = codice_citta";
                $query1 = "SELECT codice FROM CLIENTE WHERE '$codice' = codice";
                $res3 = mysqli_query($conn,$query3) or die(mysqli_error($conn));
                $res2 = mysqli_query($conn,$query2) or die(mysqli_error($conn));
                $res = mysqli_query($conn,$query1) or die(mysqli_error($conn));
                
                
                // Creo le date casuali per le query
                $year= mt_rand(date("Y")+1, 2055);
                
                $month= mt_rand(1, 12);
                
                $day= mt_rand(1, 28);
                
                $randomDate = $year . "-" . $month . "-" . $day;    
                
                          
                // variabile con la data di nascita
                $data_di_nascita = new DateTime($_POST['data_nascita']);
                $data_oggi = new DateTime(date("Y-m-d")); 
                
                // Mi calcolo l'età tramite le due date inserite
                $diff = $data_oggi->diff($data_di_nascita);
                $eta = $diff->y;
                
                if(mysqli_num_rows($res3)==0) {
                    $query3 = "INSERT INTO CONTO VALUES('$idConto', 0, '$randomDate')";
                    mysqli_query($conn, $query3) or die (mysqli_error($conn));
                }  
                echo "ERRORE";
                if(mysqli_num_rows($res2)==0) {
                    $query2 = "INSERT INTO CITTA VALUES('$regione', '$citta', 0)";
                    mysqli_query($conn, $query2) or die (mysqli_error($conn));
                }                
                if(mysqli_num_rows($res)==0) {
                    $query = "INSERT INTO CLIENTE VALUES('$codice', '$eta', '$data_nascita', '$citta', '$idConto')";
                    mysqli_query($conn, $query) or die (mysqli_error($conn));    
                }
                
                $query = "INSERT INTO dati_login(username,password,codice,citta,id_conto) VALUES('$username','$password','$codice','$citta','$idConto')";
                

                if (mysqli_query($conn, $query)) {
                    $_SESSION["username"] = $username;
                    $_SESSION["id_session"] = mysqli_insert_id($conn);
                    $_SESSION["id_conto"] = $idConto;
                    mysqli_close($conn);
                    header("Location: area_personale.php");
                    exit;
                } else {
                    $error[] = "Errore connessione al database";
                }
            }
        // }
        mysqli_close($conn);            
    }
?>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css2?family=Acme&family=Lobster&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Kanit:ital@0;1&display=swap" rel="stylesheet">
        <title>HW - registrazione - O46002218</title>
        <script src="../JS/registrazione.js" defer></script>
        <link rel="stylesheet" href="../CSS/login.css">
    </head>

    <body>
        <header>
            <div id="logo">idealBank</div>
        </header>
        
        <div id="intro">
            <h1>Benvenuto nel mondo idealBank! <br>
                Registrati per scoprire i nostri servizi
            </h1>
        </div>     

        <div class="container">
            <div class="info-content">
                <div class="box">
                    <img src="../foto/currency.svg">
                    <h1>Currency Exchange <br> e Currency Conversion</h1>
                </div>
                <div class="box">
                    <img src="../foto/pay.svg">
                    <h1>Confronto tra le <br> principali banche</h1>
                </div>
                <div class="box">
                    <img src="../foto/undraw_Investing_re_bov7.svg">
                    <h1>Dati finanziari <br> in tempo reale</h1>
                </div>
            </div>

            <div class="login-content">
                <div class="form">
                    <?php
                        if(isset($error)) {
                            echo '<pre>';
                            print_r($error);
                            echo '</pre>';
                        }
                    ?>
                    <h2><em>REGISTRATI</em></h2>
                    <form action="registrazione.php" method='POST'>
                        <div class="inputBox" id="userBox"> 
                            <span id="tag"><strong>Username:</strong></span>
                            <input type="text" name="username" id="username" required>
                            <span class="error">Username non valido<span>
                        </div>
                        <div class="inputBox" id="passBox">
                            <span id="tag"><strong>Password:</strong></span>
                            <input type="password" name="password" id="password" required>
                            <span class="error">Password non valida</span>
                        </div>
                        <div class="inputBox" id="codBox">
                            <span id="tag"><strong>Codice:</strong></span>
                            <input type="text" name="codice" id="codice" required>
                            <span class="error">Codice non valido</span>
                        </div>
                        <div class="inputBox" id="cittaBox">
                            <span id="tag"><strong>Città:</strong></span>
                            <input type="text" name="citta" id="citta" required>
                            <span class="error">Citta non valida</span>
                        </div>
                        <div class="inputBox" id="regBox">
                            <span id="tag"><strong>Regione:</strong></span>
                            <input type="text" name="regione" id="regione" required>
                            <span class="error">Regione non valida</span>
                        </div>
                        <div class="inputBox" id="dataBox">
                            <span id="tag"><strong>Data di nascita (AAAA-MM-GG):</strong></span>
                            <input type="text" name="data_nascita" id="data" required>
                            <span class="error">Formato data non valido</span>
                        </div>
                        <!-- <div class="inputBox">
                            <span><strong>Id Conto:</strong></span>
                            <input type="text" name="id_conto" required>
                        </div> -->
                        <div class="requisiti_password">
                            <img src="../foto/mostra.png" id="mostra">
                            <span>Requisiti password</span>
                        </div>
                        <div class="hidden" id="requisiti">
                            <p>La password deve rispettare i seguenti requisiti:</p>
                            <ul>
                                <li>Lunghezza compresa tra 8 e 20</li>
                                <li>Almeno una lettera maiuscola</li>
                                <li>Almeno un numero e un simbolo</li>
                            </ul>
                        </div>
                        <div class="inputBox">
                            <input type="submit" value="Registrati" id="submit">
                        </div>
                        <div class="inputBox">
                            <p>Possiedi già un account su idealBank? <a href="login.php">Accedi!</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>