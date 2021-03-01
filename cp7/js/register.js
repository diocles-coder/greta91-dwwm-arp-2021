// Requête AJAX n°1
document.addEventListener(
    'DOMContentLoaded',
    function () {
        // Step 1 : instancie XMLHttpRequest
        let xhr = new XMLHttpRequest();
        // Step 2 : ouvre la requête AJAX
        xhr.open('get', 'https://restcountries.eu/rest/v2/all?fields=translations;alpha2Code', true);
        // Step 3 : envoie la requête
        xhr.send();
        // Step 4 : branche un écouteur sur le changement d'état de la requête
        xhr.addEventListener(
            'readystatechange',
            function () {
                if (xhr.readyState === 4 && (xhr.status === 0 || xhr.status === 200)) {
                    // Transforme le texte en objet JSON : désérialisation
                    let data = JSON.parse(xhr.responseText);
                    // Pour chaque pays de DATA, création d'une OPTION dans le SELECT
                    let opt;
                    for (let i = 0; i < data.length; i++) {
                        opt = document.createElement('option');
                        // opt.setAttribute('value', data[i].alpha2Code);
                        opt.value = data[i].alpha2Code;
                        opt.textContent = data[i].translations.fr;
                        document.getElementById('land').appendChild(opt);
                    }
                } else {
                    console.log(xhr.readyState)
                }
            },
            false
        );
    },
    false
);

// Requête AJAX n°2

getZip = function () {
    let zip = document.getElementById('zip').value;
    let land = document.getElementById('land').value;
    let url = 'http://api.zippopotam.us/' + land + '/' + zip;
    let xhr = new XMLHttpRequest();
    xhr.open('get', url, true);
    xhr.send();
    xhr.addEventListener(
        'readystatechange',
        function () {
            if (xhr.readyState === 4 && (xhr.status === 0 || xhr.status === 200)) {
                document.getElementById('city').value = '';
                let data = JSON.parse(xhr.responseText);
                // Récupère le nom de la première commune
                if (data) {
                    document.getElementById('city').value = data.places[0]['place name'];
                }
            }
        },
        false
    );
};

document.getElementById('land').addEventListener(
    'change',
    getZip,
    false
);

document.getElementById('zip').addEventListener(
    'blur',
    getZip,
    false
);




