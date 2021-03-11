<?php
// Imports
include_once('inc/constants.inc.php');
include_once('inc/dbconnect.inc.php');
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
    <h1>Ajouter/Modifier un hôtel</h1>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.php">Accueil</a></li>
            <li class="breadcrumb-item"><a href="hotels.php">Hôtels</a></li>
            <li class="breadcrumb-item active" aria-current="page">Ajout/Modification Hôtel</li>
        </ol>
    </nav>

    <form action="hotels_save.php" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="hno">ID</label>
            <input type="number" name="hno" id="hno" class="form-control">
        </div>
        <div class="form-group">
            <label for="name">Nom</label>
            <input type="text" name="name" id="name" class="form-control">
        </div>
        <div class="form-group">
            <label for="address">Adresse</label>
            <textarea name="address" id="address" cols="30" rows="3" class="form-control"></textarea>
        </div>
        <div class="form-group">
            <label for="zip">Ville</label>
            <select name="zip" id="zip" class="form-control">
                <option value="">--- Choisir une ville ---</option>
                <?php
                $sql =
                    "SELECT zip, CONCAT(name, ' (', zip, ')') AS city
                    FROM cities
                    ORDER BY city";
                $qry = $cnn->query($sql);
                $html = '';
                // Ajoute une OPTION pour chaque ligne lue dans le DATASET
                while ($row = $qry->fetch()) {
                    $html .= '<option value="' . $row['zip'] . '">' . $row['city'] . '</option>';
                }
                echo $html;
                unset($cnn);
                ?>
            </select>
        </div>
        <div class="form-group">
            <label for="photo">Photo</label>
            <input type="file" name="photo" id="photo" class="form-control">
            <input type="hidden" name="MAX_FILE_SIZE" value="1048576">
        </div>
        <input type="submit" class="btn btn-info">
    </form>
</body>

</html>