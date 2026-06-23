<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Libreria</title>

    <link rel="stylesheet" href="../public/assets/css/style.css">
</head>

<body>
    <?php require "../src/views/header.php"; ?>
    <div class="main_content">

        <h1>Tu librería digital</h1>
        <p class="subtitle">Todo un mundo de libros al alcance de un clic.</p>

        <div class="menu">

            <a href="../public/authors.php" class="menu_card">
                <h2>Autores</h2>
                <p>Explora autores y sus obras</p>
                <p class="comment">Versión síncrona</p>
            </a>

            <a href="../public/books.php" class="menu_card">
                <h2>Libros</h2>
                <p>Descubre todos los libros disponibles</p>
                <p class="comment">Versión síncrona</p>
            </a>

            <a href="../public/genres.php" class="menu_card">
                <h2>Géneros</h2>
                <p>Explora los diferentes géneros literarios</p>
                <p class="comment">Versión asíncrona</p>
            </a>

            <a href="../public/authors_async.php" class="menu_card">
                <h2>Autores</h2>
                <p>Explora los diferentes géneros literarios</p>
                <p class="comment">Versión asíncrona</p>
            </a>

        </div>

    </div>
    <?php require "../src/views/footer.php"; ?>

</body>
</html>