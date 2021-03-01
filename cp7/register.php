<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AJAX</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>

<body class="container">
    <h1>Inscription</h1>
    <form action="register_save.php" method="post">
        <div class="form-group">
            <label for="fname">Prénom</label>
            <input type="text" name="fname" id="fname" class="form-control" pattern="[A-Za-z \-]{1,30}" required>
        </div>
        <div class="form-group">
            <label for="land">Pays</label>
            <select name="land" id="land" class="form-control"></select>
        </div>
        <div class="form-group">
            <label for="zip">Code postal</label>
            <input type="text" name="zip" id="zip" class="form-control">
        </div>
        <div class="form-group">
            <label for="city">Ville</label>
            <input type="text" name="city" id="city" class="form-control">
        </div>
        <input type="submit" class="btn btn-primary">
    </form>

    <script src="js/register.js"></script>
</body>

</html>