<?php
include_once('inc/constants.inc.php');
include_once('inc/team.inc.php');
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo APP_NAME; ?></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>

<body class="container">
    <div class="jumbotron mt-5">
        <h1 class="display-4"><?php echo APP_NAME; ?></h1>
        <?php
        // Calcule l'écart entre le 12/11/2020 et aujourd'hui
        $start = strtotime('2020-11-12');
        $today = strtotime(date('Y-m-d'));
        $gap = ($today - $start) / 60 / 60 / 24;
        ?>
        <p class="lead">Cette application a pour but de vous aider à réserver une chambre dans l'un de nos XXX hôtels. Elle a été créée par une équipe de jeunes développeur.euse.s, dans le cadre du TP DWWM démarré il y a <?php echo $gap; ?> jours.</p>
        <hr class="my-4">
        <p>Vous pouvez vous inscrire en cliquant sur le bouton ci-dessous ou vous connecter pour accéder au Back-Office.</p>
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#register">Inscription</button>
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#login">Connexion</button>
    </div>

    <div class="btn-group mb-3">
        <a href="cities.php" class="btn btn-primary">Villes</a>
        <a href="hotels.php" class="btn btn-primary">Hôtels</a>
        <a href="rooms.php" class="btn btn-primary">Chambres</a>
        <a href="booking.php" class="btn btn-primary">Réservations</a>
        <a href="customers.php" class="btn btn-primary">Clients</a>
    </div>

    <h2>Nos dirigeant.e.s</h2>
    <section id="team" class="d-flex flex-wrap justify-content-around">
        <div class="card my-3" style="width:15rem">
            <img src="pics/face.jpg" alt="photo du dirigeant" class="card-img-top">
            <div class="card-body">
                <h5>Lesly</h5>
                <p class="card-text"><strong>Hôtel : </strong>Hôtel de police</p>
                <p class="card-text"><strong>Lieu : </strong>Arpajon, France</p>
                <p class="card-text"><strong>Capacité : </strong>15 chambres</p>
            </div>
        </div>
        <?php
        // Template HTML
        $card =
            '<div class="card my-3" style="width:15rem">
            <img src="%s" alt="photo du dirigeant" class="card-img-top">
            <div class="card-body">
            <h5>%s</h5>
            <p class="card-text"><strong>Hôtel : </strong>%s</p>
            <p class="card-text"><strong>Lieu : </strong>%s</p>
            <p class="card-text"><strong>Capacité : </strong>%d chambres</p>
            </div>
            </div>';
        $html = '';
        // Affiche la liste de tous les dirigeants issus de l'array TEAM
        foreach ($team as $boss) {
            if (array_key_exists('photo', $boss)) {
                // Si la clé 'photo' existe alors assigner la valeur de cette clé à la variable '$photo'
                $photo = $boss['photo'];
            } else {
                // Sinon assigner la valeur 'pics/face.jpg' à la variable '$photo'
                $photo = 'pics/face.jpg';
            }
            // ou bien
            $photo = array_key_exists('photo', $boss) ? $boss['photo'] : 'pics/face.jpg';
            $html .= sprintf($card, $photo, $boss['fname'], $boss['hotel'], $boss['loc'], $boss['rooms']);
        }
        echo $html;
        ?>
    </section>
</body>

</html>