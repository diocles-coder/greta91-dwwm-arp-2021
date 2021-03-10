<?php
include_once('inc/constants.inc.php');
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
</body>

</html>