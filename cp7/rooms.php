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
    <h1>Nos chambres</h1>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.php">Accueil</a></li>
            <li class="breadcrumb-item active" aria-current="page">Chambres</li>
        </ol>
    </nav>

    <table class="table table-striped">
        <thead class="thead-dark">
            <tr>
                <?php
                try {
                    // Tentative d'exécution d'une requête SQL
                    $sql =
                        "SELECT h.name AS hotel, 
                        h.address, 
                        h.zip, 
                        c.name AS city, 
                        c.land, 
                        r.rno AS romm_nb, 
                        r.type, 
                        r.price*1.19 AS price_dollar
                        FROM cities c JOIN hotels h JOIN rooms r
                        ON c.zip = h.zip AND h.hno = r.hno
                        ORDER BY r.price";
                    $qry = $cnn->query($sql);
                    // Affiche le nom des colonnes ---> TODO : GETCOLUMNMETA FOR PHP8
                    $html = '';
                    for ($i = 0; $i < $qry->columnCount(); $i++) {
                        $meta = $qry->getColumnMeta($i);
                        $html .= "<th>" . strtoupper($meta['name']) . "</th>";
                    }
                    echo $html;
                } catch (PDOException $err) {
                    // Si erreur exécution requête
                    echo '<p class="alert alert-danger">' . $err->getMessage() . '</p>';
                }
                ?>
            </tr>
        </thead>
        <tbody>
            <?php
            // Boucle sur chaque ligne trouvée dans le résultat de la requête
            $html = '';
            while ($row = $qry->fetch()) {
                $html .= '<tr>';
                foreach ($row as $val) {
                    $html .= '<td>' . $val . '</td>';
                }
                $html .= '</tr>';
            }
            echo $html;
            // Déconnexion = suppression de la variable en mémoire
            unset($cnn);
            ?>
        </tbody>
    </table>
</body>

</html>