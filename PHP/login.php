<?php
    include 'auth.php';
    
    // verifica l'accesso
    if(checkAuth())
    {
        // mi rimanda alla homepage
        header("Location: area_personale.php");
        exit;
    }
    
    // Verifica se esistono questi dati
    if(isset($_POST["username"]) && isset($_POST["password"]))
    {
        // Stabilisco la connessione col database
        $conn = mysqli_connect($dbconfig['host'], $dbconfig['user'], $dbconfig['password'], $dbconfig['name']) or die(mysqli_error($conn));
        
        $username = mysqli_real_escape_string($conn, $_POST['username']);
        $password = mysqli_real_escape_string($conn, $_POST['password']);

        // Effettuo la query
        $query = "SELECT * FROM dati_login";
        
        // Esecuzione 
        $res = mysqli_query($conn, $query) or die(mysqli_error($conn));
        
        while ($row=mysqli_fetch_assoc($res)) {
            // Verifica se corrispondono le credenziali
            if($username == $row["username"] && password_verify($password, $row["password"]) == 1)
            {   
                // Imposta la variabile di sessione
                $_SESSION["username"] = $row['username'];
                $_SESSION["id_session"] = $row['id_session']; 
                $_SESSION["id_conto"] = $row['id_conto'];
                
                // Rimanda alla homepage
                header("Location: area_personale.php");
                mysqli_free_result($res);
                mysqli_close($conn);
                exit;
            }
            else {
                $errore = true;
            }
        }
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
        <title>HW - Login - O46002218</title>
        <script src="../JS/login.js" defer></script>
        <link rel="stylesheet" href="../CSS/login.css">
    </head>

    <body>
        <header>
            <div id="logo">idealBank</div>
        </header>
        
        <div id="intro">
            <h1>Benvenuto nel mondo idealBank! <br>
                Accedi con le tue credenziali
            </h1>
        </div>     

        <div class="container">
            <div class="login-content"> 
                <div class="form">
                    <h2><em>LOGIN</em></h2>
                    <?php if(isset($errore)) {
                        echo "<strong>";
                        echo "Errore: username e/o password errati.";
                        echo "</strong>";
                    }
                    ?>
                    <form action="login.php" method='POST' name='form_login'>
                        <div class="inputBox" id="userBox"> 
                            <span id="tag"><strong>Username:</strong></span>
                            <input type="text" name='username' id="username" required>
                            <span class="error">Username non valido<span>
                        </div>
                        <div class="inputBox" id="passBox">
                            <span id="tag"><strong>Password:</strong></span>
                            <input type="password" name='password' required>
                        </div>
                        <div class="inputBox">
                            <input type="submit" value="Accedi">
                        </div>
                        <div class="inputBox">
                            <p>Non hai ancora un account idealBank? <a href="registrazione.php">Registrati!</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>