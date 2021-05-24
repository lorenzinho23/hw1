function mostraRequisiti(event) {
    const a = event.currentTarget;
    
    const p = document.querySelector("#requisiti");
    p.classList.remove("hidden");
    
    a.removeEventListener("click", mostraRequisiti);
    a.addEventListener("click", nascondiRequisiti);
    a.src = "../foto/nascondi.png";
}

function nascondiRequisiti(event) {
    const a = event.currentTarget;
    
    const p = document.querySelector("#requisiti");
    p.classList.add("hidden");

    a.removeEventListener("click", nascondiRequisiti);
    a.addEventListener("click", mostraRequisiti);
    a.src = "../foto/mostra.png";
}

const requisiti = document.querySelector('#mostra');
requisiti.addEventListener("click", mostraRequisiti);


function jsonCheckUsername(json) {
    // Controllo il campo exists ritornato dal JSON
    if (formStatus.username =! json.exists) {
        document.querySelector('#userBox').classList.remove('errorj');
        document.querySelector('#submit').disabled = true;
    } else {
        document.querySelector('#userBox .error').textContent = "Username già utilizzato";
        document.querySelector('#userBox').classList.add('errorj');
    }
    checkForm();
}

function jsonCheckCodice(json) {
    // Controllo il campo exists ritornato dal JSON
    if (formStatus.codice =! json.exists) {
        document.querySelector('#codBox').classList.remove('errorj');
    } else {
        document.querySelector('#codBox .error').textContent = "Codice già utilizzato";
        document.querySelector('#codBox').classList.add('errorj');
    }
    checkForm();
}

function fetchResponse(response) {
    if (!response.ok) return null;
    return response.json();
}

function checkUsername(event) {
    const input = event.currentTarget;

    if(!/^[a-zA-Z0-9_]{5,15}$/.test(input.value)) {
        input.parentNode.querySelector('#userBox .error').textContent = "Sono ammesse lettere, numeri e underscore. Min 15";
        input.parentNode.classList.add('errorj');
        formStatus.username = false;
        checkForm();
    } else {
        fetch("check_username.php?q="+encodeURIComponent(input.value)).then(fetchResponse).then(jsonCheckUsername);
    }    
}

function checkPassword(event) {
    const passwordInput = event.currentTarget;
    // const pattern = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[!-.@#$%^&*])[a-zA-Z0-9!-.@#$%^&*]{8,20}$/;
    const pattern = /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[_.\-()?#;:!@])[0-9A-Za-z_.\-()?#;:!@]{8,20}$/;

    if (!pattern.test(passwordInput.value)) {
        document.querySelector('#passBox').classList.add('errorj');
        passwordInput.parentNode.querySelector('#passBox .error').textContent = "Password non valida";
        formStatus.password = false;
    } else {
        formStatus.password = true;
        document.querySelector('#passBox').classList.remove('errorj');
    }
    checkForm();
}

function checkCodice(event) {
    const inputCodice = event.currentTarget;
    const pattern = /^[0-9]{1,3}$/;

    if (!pattern.test(inputCodice.value)) {
        inputCodice.parentNode.querySelector('#codBox .error').textContent = "Il codice deve essere di due cifre";
        inputCodice.parentNode.classList.add('errorj');
        formStatus.codice = false;
        checkForm();
    } else {
        fetch("check_codice.php?q="+encodeURIComponent(inputCodice.value)).then(fetchResponse).then(jsonCheckCodice);
    }
}

function checkCitta(event) {
    const inputCitta = event.currentTarget;
    const pattern = /^[a-zA-Z]{1,2}$/;

    if (!pattern.test(inputCitta.value)) {
        document.querySelector('#cittaBox').classList.add('errorj');
        formStatus.citta = false;
    } else {
        formStatus.citta = true;
        document.querySelector('#cittaBox').classList.remove('errorj');
        checkForm();
    }
    
}

function checkRegione(event) {
    const inputRegione = event.currentTarget;
    const pattern = /[a-zA-Z]+/;

    if (!pattern.test(inputRegione.value)) {
        document.querySelector('#regBox').classList.add('errorj');     
        formStatus.regione = false;   
    } else {
        formStatus.regione = true;
        document.querySelector('#regBox').classList.remove('errorj');
        checkForm();
    }
}

function checkData(event){
    const inputData = event.currentTarget;
    const index = /^\d{4}[-](0?[1-9]|1[012])[-](0?[1-9]|[12][0-9]|3[01])$/;
    
    if (formStatus[inputData.name] = index.test(inputData.value)) {
        document.querySelector('#dataBox').classList.remove('errorj');
    } else {
        document.querySelector('#dataBox').classList.add('errorj');
        formStatus.data_nascita = false;
    }
    checkForm();
}

function checkForm() {
    console.log(formStatus);
    // Controlla che tutti i campi siano pieni
    if(Object.keys(formStatus).length === 6 && !Object.values(formStatus).includes(false)) {
        document.querySelector("#submit").disabled = false;
    }
    else {
        document.querySelector("#submit").disabled = true;
    }

}

const formStatus = {};
document.querySelector('.inputBox #username').addEventListener('blur', checkUsername);
document.querySelector('.inputBox #password').addEventListener('blur', checkPassword);
document.querySelector('.inputBox #codice').addEventListener('blur', checkCodice);
document.querySelector('.inputBox #citta').addEventListener('blur', checkCitta);
document.querySelector('.inputBox #regione').addEventListener('blur', checkRegione);
document.querySelector('.inputBox #data').addEventListener('blur', checkData);

