// RICERCA
function ricerca(event) {
    var input;
    var filtro;
    var elementi;
    var box;
    var x;
    var i;
    var testo;
    
    input = event.currentTarget;
    filtro = input.value.toUpperCase();
    elementi = document.getElementById("elementi");
    box = elementi.getElementsByTagName("div");
    

    for (i = 0; i < box.length; i++) {
        x = elementi.getElementsByTagName("h1")[i];
        if (x) { 
            testo = x.textContent || x.innerText;
            
            if(testo.toUpperCase().indexOf(filtro) > -1) {
                box[i].style.display = "";
            }    
            else {
                box[i].style.display = "none";
            }    
        }    
    }    
}
const input = document.querySelector("#cerca");
input.addEventListener("keyup", ricerca);


const id_session = document.querySelector("#sessione").value;
// AGGIUNGO AI PREFERITI
function aggiungiPreferiti(event) {
    const e = event.currentTarget;

    // associo la section preferiti
    const secP = document.querySelector("#preferiti");
    secP.classList.remove("hidden");
    secP.classList.add("elementi");
    
    // assegno il titolo preferiti
    const titoloP = document.querySelector("#testoP");
    titoloP.classList.remove("hidden");

    // assegno la foto del preferito aggiunto
    e.src = "../foto/si.ico";

    // creo gli elementi che compongono il box nei preferiti
    const divP = document.createElement("div");
    const nomeP = document.createElement("h1");
    const croceP = document.createElement("img");
    const fotoP = document.createElement("img");
    
    // assegno il CSS al simbolo preferito
    croceP.classList.add("stella");
    croceP.dataset.idCroce = e.dataset.idPreferito;
    divP.id = e.dataset.idPreferito;

    
    fetch("../PHP/fetch_mhw1.php").then(onResponse).then(onJSONPreferiti);
    // for per inserire i box dinamicamente
    function onJSONPreferiti(json) {
        for (let i in json) {
            if (json[i].codice == e.dataset.idPreferito) {
                nomeP.textContent = json[i].nome;
                croceP.src = "../foto/no.ico";
                fotoP.src = json[i].logo;
                fetch("../PHP/fetch_mhw2Preferiti.php?id_session="+id_session+"&idPreferito="+e.dataset.idPreferito);
                // console.log("fetch_mhw2Preferiti.php?id_session="+id_session+"&idPreferito="+e.dataset.idPreferito);
            }
        }
    }   
    // posiziono gli elementi nei giusti posti
    secP.appendChild(divP);
    divP.appendChild(nomeP);
    divP.appendChild(croceP);
    divP.appendChild(fotoP);
    
    // rimuovo l'evento dal simbolo della stella
    e.removeEventListener("click", aggiungiPreferiti);

    // assegno la funzione RimuoviPreferiti al simbolo della X
    croceP.addEventListener("click", rimuoviPreferiti);
}

// RIMUOVO DAI PREFERITI
function rimuoviPreferiti(event) {
    const e = event.currentTarget;
    
    // seleziono gli elementi della section preferiti
    const secP = document.querySelector("#preferiti");
    const stella = document.querySelectorAll("[data-id-preferito]");

    // modifico la foto della stella e la rendo di nuovo cliccabile
    for (let i = 0; i<stella.length; i++) {
        if (stella[i].dataset.idPreferito === e.dataset.idCroce) {
            stella[i].src = "../foto/stellavuota.png";
            stella[i].addEventListener("click", aggiungiPreferiti);
            fetch("../PHP/fetch_mhw2PreferitiRemove.php?id_session="+id_session+"&idPreferito="+stella[i].dataset.idPreferito);
        }
    }    
    
    // mi conto quanti elementi figli ci sono dentro la section dei preferiti
    const conta = secP.childElementCount;

    // seleziono gli elementi che si trovano prima della stella (e), cioè il div
    const scatola = e.parentNode;

    // se è l'ultimo box ad essere rimasto nei preferiti allora 
    // quando verrà tolto devo nascondere tutta la section preferiti
    if (conta==1) {
        scatola.remove("div");
        const secP = document.querySelector("#preferiti");
        secP.classList.add("hidden");
        const titoloP = document.querySelector("#testoP");
        titoloP.classList.add("hidden");
    }
    // se non è l'ultimo box lo rimuovo solamente e la sezione rimane visibile
    else {
        scatola.remove("div");
    }
}

// DETTAGLI 
function maggioriDettagli(event) {
    const a = event.currentTarget;
    a.querySelector("a").textContent = "Meno informazioni";
    a.removeEventListener("click", maggioriDettagli);
    a.addEventListener("click", minoriDettagli);
    const e = a.querySelector("p");
    e.classList.remove("hidden");
    e.classList.add("mostra");
}    

function minoriDettagli(event) {
    const a = event.currentTarget;
    a.querySelector("a").textContent = "Maggiori informazioni";
    a.removeEventListener("click", minoriDettagli);
    a.addEventListener("click", maggioriDettagli);
    const e = a.querySelector("p");
    e.classList.remove("mostra");
    e.classList.add("hidden");
}    


// CARICAMENTO DINAMICO
fetch("../PHP/fetch_mhw1.php").then(onResponse).then(onJSONCaricamento);
// fetch("fetch_mhw2.php").then(onResponse).then(onJSONCaricamento);


function onResponse(response) {
    return response.json();
}

function onJSONCaricamento(json) {
    console.log(json);

    for (let i=0;i<json.length;i++) {
        // creo tutti gli elementi che servono per creare i box
        const sec = document.querySelector(".elementi");
        const div = document.createElement("div");
        const nome = document.createElement("h1");
        const stella = document.createElement("img");
        const foto = document.createElement("img");
        const tasto = document.createElement("span");
        const testo = document.createElement("p");
        const info = document.createElement("a");

        // assegno l'id ai tasti "maggioriInformazioni" e alla stella per associarla ad ogni box
        tasto.dataset.id = i;
        stella.dataset.idPreferito = json[i].codice;

        // carico tutti i dettagli di ogni BOX da costant.js
        nome.textContent = json[i].nome;
        stella.src = "../foto/stellavuota.png";   
        foto.src = json[i].logo;
        info.textContent = "Maggiori informazioni";
        testo.textContent = json[i].descrizione;

        // associo le funzioni al tasto "maggioriInformazioni" e "stella"
        tasto.addEventListener("click", maggioriDettagli);

        const log = document.querySelector("#log").value;
        console.log(log);
        if (log == true) {
            stella.removeEventListener("click", allert);
            stella.addEventListener("click", aggiungiPreferiti);
        }
        else {
            stella.addEventListener("click", allert);
        }

        // assegno il CSS e le classi ad ogni elemento
        stella.classList.add("stella");
        testo.classList.add("hidden");  // in partenza la descrizione (p) è nascosta
        tasto.classList.add("tasto");
        info.classList.add("info");

        // inserisco ogni elemento al giusto posto
        sec.appendChild(div);
        div.appendChild(nome);
        div.appendChild(stella);
        div.appendChild(foto);
        div.appendChild(tasto);
        tasto.appendChild(testo);
        tasto.appendChild(info);
    }
    fetch("../PHP/caricaPreferiti.php?id_session="+id_session).then(onResponse).then(onJSONCaricaPreferiti);
}

function allert() {
    alert("Effettua l'accesso per poter aggiungere i preferiti");
}

function onJSONCaricaPreferiti(json) {
    if (json.length!==0) {
        console.log(json);

        // associo la section preferiti
        const secP = document.querySelector("#preferiti");
        secP.classList.remove("hidden");
        secP.classList.add("elementi");

        const titoloP = document.querySelector("#testoP");
        titoloP.classList.remove("hidden");

        for (i=0;i<json.length;i++) {
            const divP = document.createElement("div");
            const nomeP = document.createElement("h1");
            const croceP = document.createElement("img");
            const fotoP = document.createElement("img");

            croceP.classList.add("stella");
            croceP.dataset.idCroce = json[i].idPreferito;
            divP.id = json[i].idPreferito;
            croceP.src = "../foto/no.ico";
            nomeP.textContent = json[i].nome;
            fotoP.src = json[i].logo;

            secP.appendChild(divP);
            divP.appendChild(nomeP);
            divP.appendChild(croceP);
            divP.appendChild(fotoP);

            json[i].id_pref;

            const stella = document.querySelector("[data-id-preferito='"+json[i].idPreferito+"']");
            console.log(stella);
            if(stella.dataset.idPreferito === json[i].idPreferito) {
                stella.removeEventListener("click", aggiungiPreferiti);
                stella.src = "../foto/si.ico";
            }
            croceP.addEventListener("click", rimuoviPreferiti);
        }
    }    
}