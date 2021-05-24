function onResponse(response) {
    return response.json();
}

function onJSONBanche(json) {
    console.log(json);

    const contenuti = document.querySelector("#contenuti");
    contenuti.innerHTML = '';


    for (let i=0; i<3; i++) {  
        const div = document.createElement("div");  
        const foto = document.createElement("img");
        foto.src = json[i].foto;
        const nome = document.createElement("h1");
        nome.textContent = json[i].nome;
        const descrizione = document.createElement("p");
        descrizione.textContent = json[i].descrizione;
        const sede = document.createElement("strong");
        sede.textContent = "SEDE PRINCIPALE: " + json[i].citta;
        const br = document.createElement("br");
        const codice = document.createElement("strong");
        codice.textContent = "CODICE ABI: " + json[i].codice;

        contenuti.appendChild(div);
        div.appendChild(foto);
        div.appendChild(nome);
        div.appendChild(descrizione);
        div.appendChild(sede);
        div.appendChild(br);
        div.appendChild(codice);

        foto.classList.add("img");
        nome.classList.add("h1");
        descrizione.classList.add("p");
        sede.classList.add("p");
        codice.classList.add("p");
    }

}

fetch("../PHP/fetch_mhw1.php").then(onResponse).then(onJSONBanche);
