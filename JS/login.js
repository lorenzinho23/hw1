function jsonCheckUsername(json) {
    // Controllo il campo exists ritornato dal JSON
    if (json.exists) {
        document.querySelector('#userBox').classList.remove('errorj');
    } else {
        document.querySelector('#userBox .error').textContent = "Username non trovato";
        document.querySelector('#userBox').classList.add('errorj');
    }
}

function fetchResponse(response) {
    if (!response.ok) return null;
    return response.json();
}


function checkUsername(event) {
    const input = event.currentTarget;
    
    fetch("check_username.php?q="+encodeURIComponent(input.value)).then(fetchResponse).then(jsonCheckUsername);
}    

document.querySelector('.inputBox #username').addEventListener('blur', checkUsername);
