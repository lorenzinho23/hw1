function onResponse(response) {
    return response.json();
}

function onJSONSaldo(json) {
    console.log(json);

    const sezione = document.querySelector("#contenuti");
    sezione.innerHTML='';
    
    const titolo = document.createElement("h1");
    titolo.textContent = "Il saldo del tuo conto è: ";
    const saldo = document.createElement("p");
    saldo.textContent = "€ " + json.Saldo.saldo;
    const foto = document.createElement("img");
    foto.src = "../foto/finance.svg";

    sezione.appendChild(titolo);
    sezione.appendChild(saldo);
    sezione.appendChild(foto);

    titolo.classList.add("titolo");
    saldo.classList.add("titolo")
    foto.classList.add("img");
}

function onJSONOperazioni(json) {
    console.log(json);

    const sezione = document.querySelector("#contenuti");
    sezione.innerHTML='';

    const titolo = document.createElement("h1");
    titolo.textContent = "Numero totale operazioni effettuate: ";
    const numero = document.createElement("p");
    numero.textContent = json.Numero_tot.numero;

    sezione.appendChild(titolo);
    sezione.appendChild(numero);

    titolo.classList.add("titolo");
    numero.classList.add("titolo");
}


function mostraSaldo(event) {
    const s = event.currentTarget;
    const saldo = document.querySelector("#contenuti");
    saldo.classList.remove("hidden");
    saldo.classList.add("mostra");
    fetch("../PHP/fetch_areaPersonale.php").then(onResponse).then(onJSONSaldo);
}

function mostraOperazioni(event) {
    const o = event.currentTarget;
    const operazioni = document.querySelector("#contenuti");
    operazioni.classList.remove("hidden");
    operazioni.classList.add("mostra");
    fetch("../PHP/fetch_areaPersonale.php").then(onResponse).then(onJSONOperazioni);
}

function effettuaOperazione(event) {
    const e = event.currentTarget;

    const operazioni = document.querySelector("#contenuti");
    operazioni.innerHTML='';
    
    operazioni.classList.remove("hidden");
    operazioni.classList.add("mostra");
    
    const titolo = document.createElement("p");
    titolo.textContent = "Importo da versare:";
    const valore = document.createElement("input");
    valore.type = "text";
    const effettua = document.createElement("button");
    effettua.textContent = "Effettua";
    effettua.addEventListener("click", inviaOperazione);
    
    operazioni.append(titolo);
    operazioni.append(valore);
    operazioni.append(effettua);
    
}

function inviaOperazione() {
    const importo = document.querySelector("input").value;
    console.log(importo);
    const pattern = /^[0-9]+$/;
    
    if(!pattern.test(importo)) {
        alert("Importo non valido");
    }
    else {
        fetch("../PHP/fetch_areaPersonale2.php?importo=" +importo);

        alert("Versamento effettuato");
        window.location.replace('../PHP/area_personale.php');
    }
    
}


const mio_saldo = document.querySelector("#mio_saldo");
mio_saldo.addEventListener("click", mostraSaldo);

const mie_operazioni = document.querySelector("#mie_operazioni");
mie_operazioni.addEventListener("click", mostraOperazioni);

const effettua_operazione = document.querySelector("#effettua");
effettua_operazione.addEventListener("click", effettuaOperazione);

