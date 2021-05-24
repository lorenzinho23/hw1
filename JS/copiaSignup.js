function jsonCheckUsername(json) {
    // Controllo il campo exists ritornato dal JSON
    if (formStatus.username = !json.exists) {
        document.querySelector('.username').classList.remove('errorj');
    } else {
        document.querySelector('.username span').textContent = "Nome utente già utilizzato";
        document.querySelector('.username').classList.add('errorj');
    }
    checkForm();
}

function fetchResponse(response) {
    if (!response.ok) return null;
    return response.json();
}

function checkUsername(event) {
    // const input = document.querySelector('.inputBox #username');
    const input = event.currentTarget;

    if(!/^[a-zA-Z0-9_]{5,15}$/.test(input.value)) {
        input.parentNode.querySelector('span').textContent = "Sono ammesse lettere, numeri e underscore. Min 15";
        input.parentNode.classList.add('errorj');
        formStatus.username = false;
        checkForm();
    } else {
        fetch("../PHP/check_username.php?q="+encodeURIComponent(input.value)).then(fetchResponse).then(jsonCheckUsername);
    }    
}

function checkPassword(event) {
    // const passwordInput = document.querySelector('.password input');
    const passwordInput = event.currentTarget;

    if (formStatus.password = passwordInput.value.length >= 8) {
        event.parentNode.classList.remove('errorj');
    } else {
        event.parentNode.classList.add('errorj');
    }
    checkForm();
}

function checkCodice(event) {
    // const input = document.querySelector('.username input');
    const inputCodice = event.currentTarget;

    if (formStatus.codice = inputCodice.value.length !=2) {
        event.parentNode.classList.remove('errorj');
    } else {
        event.parentNode.classList.add('errorj');
    }
    checkForm();
}

function checkCitta(event) {
    const inputCitta = event.currentTarget;

    if (formStatus.citta = inputCitta.value.length !=2) {
        event.parentNode.classList.remove('errorj');
    } else {
        event.parentNode.classList.add('errorj');
    }
    checkForm();
}

function checkRegione(event) {
    const inputRegione = event.currentTarget;

    if (!/^[a-zA-Z0-9_]{5,15}$/.test(inputRegione.value)) {
        input.parentNode.classList.add('errorj');
    } else {
        formStatus.regione = false;
        checkForm();
    }
}

function checkData(event){
    const inputData = event.currentTarget;

    if (formStatus.data = inputData.value.length <= 8) {
        event.parentNode.classList.remove('errorj');
    } else {
        event.parentNode.classList.add('erroj');
    }
    checkForm();
}

function checkForm() {
    // Controlla che tutti i campi siano pieni
    Object.keys(formStatus).length !== 6 || 
    // Controlla che i campi non siano false
    Object.values(formStatus).includes(false);
}

const formStatus = {'upload': true};
document.querySelector('.inputBox #username').addEventListener('blur', checkUsername);
document.querySelector('.inputBox #password').addEventListener('blur', checkPassword);
document.querySelector('.inputBox #codice').addEventListener('blur', checkCodice);
document.querySelector('.inputBox #citta').addEventListener('blur', checkCitta);
document.querySelector('.inputBox #regione').addEventListener('blur', checkRegione);
document.querySelector('.inputBox #data').addEventListener('blur', checkData);


if (document.querySelector('.error') !== null) {
    checkUsername(); checkPassword(); 
    document.querySelector('.inputBox #username').dispatchEvent(new Event('blur'));
    document.querySelector('.inputBox #password').dispatchEvent(new Event('blur'));
}