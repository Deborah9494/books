<?php
    // fetch/mod003_logica.php
    require __DIR__ . "/../mod002_accesoadatos.php";
    
    function mod003_searchBooks( $searchQuery ){
		$data = mod002_getData(
			"searchBooksByNameAndAuthorFullName",
			[
				"searchQuery" => trim($searchQuery)
			]
		);
		return $data;
	}
    
    function mod003_getGenres() {
        $genres = mod002_getData(
            "getGenres",
            []
        );
        return $genres;
    }

    function mod003_updateGenre( $genre_id, $genre_name ) {
        $genre_name = str_replace("'", "\'", $genre_name);
        $query = "UPDATE genres SET 
                    genre_name = '$genre_name' 
                    WHERE genre_id = $genre_id";
        return mod002_writeQuery( $query );
    }

    function mod003_addGenre($genre_name){
        $query = "INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES (NULL, '$genre_name');";
        return mod002_writeQuery( $query );
    }

    function mod003_deleteGenre( $genre_id ) {
        // En la base de datos las clave ajenas que apuntan a genres tienen on DELETE CASCADE 
        $query = "DELETE FROM genres WHERE `genres`.`genre_id` = $genre_id";

        return mod002_writeQuery( $query );
    }

    function mod003_getBooksGenre( $genre_id ){
        $books = mod002_getData(
            "getBooksByGenreID",
            ["genre_id" => $genre_id]
        );
        return $books;
    }

    function mod003_getBooksNotInGenre( $genre_id ){
        $books = mod002_getData(
            "getBooksNotInGenre",
            ["genre_id" => $genre_id]
        );
        return $books;
    }

    function mod003_addBookToGenre( $genre_id, $book_id ){
        $query = "INSERT INTO `books_genres` (`book_id`, `genre_id`) VALUES ($book_id, $genre_id);";
        return mod002_writeQuery( $query );
    }

    function mod003_removeBookFromGenre($genre_id, $book_id){
        $query = "DELETE FROM `books_genres` WHERE `books_genres`.`book_id` = $book_id AND `books_genres`.`genre_id` = $genre_id;";
        return mod002_writeQuery($query);
    }

    function mod003_getAllAuthors() {
        $authors = mod002_getData(
            "getAllAuthors",
            []
        );
        return $authors;
    }

    function mod003_getAllCountries() {
        $countries = mod002_getData(
            "getAllCountries",
            []
        );
        return $countries;
    }

    function mod003_updateAuthor( $author_id, $full_name, $summary, $country_iso3 ) {
        $full_name = str_replace("'", "\'", $full_name);
        $summary = str_replace("'", "\'", $summary);
        $query = "UPDATE authors SET 
                    full_name = '$full_name', 
                    summary = '$summary', 
                    ISO3 = '$country_iso3' 
                    WHERE author_id = $author_id";
        return mod002_writeQuery( $query );
    }

    function mod003_addAuthor( $full_name, $summary, $country_iso3 ) {
        $full_name = str_replace("'", "\'", $full_name);
        $summary = str_replace("'", "\'", $summary);
        $query = "INSERT INTO authors (full_name, summary, ISO3) VALUES ('$full_name', '$summary', '$country_iso3')";
        return mod002_writeQuery( $query );
    }

    function mod003_deleteAuthor( $author_id ) {
        $query = "DELETE FROM authors WHERE `authors`.`author_id` = $author_id";
        return mod002_writeQuery( $query );
    }
