 <?php
 // mod002_accesoadatos.php
 	require "mod001_kernel.php";
 	// Función generalista que ejecuta una query y obtiene y transforma los datos de la query con el array $arAttributes.
    function mod002_executeQuery( $strSQL, $attributes ) {
        $link = mod001_conectoBD();
        if ( $link === null ) {
            return [
                "status" => [
                    "codError" => "003", // Error conexión BD.
                    "msgError" => "No se pudo conectar a la base de datos. Probablemente nombre incorrecto."
                ]
            ];
        }
 		try {
			if ( $result = $link->query( $strSQL ) ) {
				if ( $result->num_rows !== 0) {
					$arRetorno[ "status" ][ "codError" ] = "000"; // Con datos.
					$arRetorno[ "status" ][ "numRows" ] = $result->num_rows;
					$i = 0;
					while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
						foreach ( $attributes as $element) {
							if (isset($element[2])) {
								if ($element[2] === "bool") {
									$arRetorno["data"][$i][$element[1]] = (bool)$row[$element[0]];
								} else if ($element[2] === "int") {
									if ($row[$element[0]] !== null) {
										$arRetorno["data"][$i][$element[1]] = intval( $row[ $element[ 0 ] ] );
									} else {
										$arRetorno["data"][$i][$element[1]] = null;
									}
								}
							} else {
								$arRetorno["data"][$i][$element[1]] = $row[$element[0]];
							}
						}
						$i++;
					}
				} else {
					$arRetorno["status"]["codError"]    = "001"; // Sin datos.
					$arRetorno["status"]["strSQL"]      = $strSQL;
				}
			}
		} catch (mysqli_sql_exception $e) {
			// Guardar error en log
			error_log($e->getMessage());

			// Mostrar mensaje genérico
			//echo "Ha ocurrido un error. Inténtalo más tarde.";
			$arRetorno["status"]["codError"]        = "002"; // Error Query.
			$arRetorno["status"]["strSQL"]          = $strSQL;
			$arRetorno["status"]["msgError"]        = $e -> getMessage();

		}
		

        mod001_desconectoBD($link);

        return $arRetorno;
    }

	function mod002_writeQuery( $strSQL, $messagesReturn = null ) {
		if ( $messagesReturn === null ) {
			$messagesReturn = [
				"000"   => "Inserción/actualización correctamente realizada.",
				"001"   => "Inserción/actualización no ha producido cambios.",
				"002"   => "Error grave en la inserción/actualización."
			];
		}
		$link = mod001_conectoBD();
		if ( $result = $link -> query( $strSQL ) ) {
			if ( $link -> affected_rows > 0 ) {
				$dataReturn[ "status" ][ "codError" ] = "000"; // Con datos.
				$dataReturn[ "status" ][ "affected_rows" ] = $link -> affected_rows;
				$dataReturn["data"]["insertId"] = $link -> insert_id;
			} else {
				$dataReturn[ "status" ][ "codError" ]   = "001"; // Sin datos.
				$dataReturn[ "status" ][ "strSQL" ]     = $strSQL; // Error en la query.
			}
		} else {
			$dataReturn[ "status" ][ "codError" ]       = "002"; // Error en la query.
			$dataReturn[ "status" ][ "strSQL" ]         = $strSQL; // Error en la query.
		}
		
		
		mod001_desconectoBD( $link );
		
		return $dataReturn;
	}

 	// getDetailData
	function mod002_getDetailQueries($queryName){
		$queries = [
			 // ===== AUTHORS =====
			"getPaginatedAuthors" => [
				"attributes" => [
					[ "author_id", "author_id", "int"],
					[ "full_name","full_name"],
					[ "ISO3","ISO3"],
					[ "summary", "summary"]
				],

				"strSQL" => "SELECT 
					`author_id`, 
					`full_name`, 
					`ISO3`, 
					`summary` 
					FROM `authors` 
					LIMIT {firstItem}, {itemsPerPage}"
			],
			"getAllAuthors" => [
				"attributes" => [
					[ "author_id", "id", "int"],
					[ "full_name","name"],
					[ "ISO3","country"],
					[ "summary", "summary"]
				],

				"strSQL" => "SELECT 
					`author_id`, 
					`full_name`, 
					`ISO3`, 
					`summary` 
					FROM `authors`"
			],
			"getTotalAuthors" => [
				"attributes" => [
					[ "totalAuthors", "totalAuthors", "int"]
				],

				"strSQL" => "SELECT COUNT( * ) AS totalAuthors
				   FROM `authors`"
			],
			"getAuthorsByID" => [
				"attributes" => [
					[ "author_id", "author_id", "int"],
					[ "full_name","full_name"],
					[ "ISO3","ISO3"],
					[ "summary", "summary"]
				],

				"strSQL" => "SELECT 
					`author_id`, 
					`full_name`, 
					`ISO3`, 
					`summary` 
					FROM `authors` 
					WHERE `author_id` = {author_id}"
			],
			"getBooksByAuthorID" => [
				"attributes" => [
					[ "book_id", "book_id", "int"],
					[ "book_name","book_name"],
					[ "isbn13","isbn13"],
					[ "first_publication_date", "first_publication_date"],
					[ "url_file", "url_file"],
					[ "cover_image", "cover_image"],
					[ "summary", "summary"]
				],

				"strSQL" => "SELECT 
					`books`.`book_id`, 
					`books`.`book_name`, 
					`books`.`isbn13`, 
					`books`.`first_publication_date`, 
					`books`.`url_file`, 
					`books`.`cover_image`, 
					`books`.`summary` 
					FROM `books`
					JOIN `books_authors` 
						ON `books`.`book_id` = `books_authors`.`book_id` 
					JOIN `authors` 
						ON `books_authors`.`author_id` = `authors`.`author_id`
					WHERE `authors`.`author_id` = {author_id}"
			],
			
			// ===== BOOKS =====
			"getPaginatedBooks" => [
				"attributes" => [
					[ "book_id", "book_id", "int"],
					[ "book_name","book_name"],
					[ "first_publication_date", "first_publication_date"],
					[ "isbn13", "isbn13"],
					[ "cover_image", "cover_image"],
					[ "summary","summary"],
					[ "shortsummary","shortsummary"]
				],
				"strSQL" => "SELECT 
					`books`.`book_id`, 
					`books`.`book_name`, 
					`books`.`first_publication_date`, 
					`books`.`isbn13`, 
					`books`.`cover_image`,
					`books`.`summary`, 
					`books`.`shortsummary` 
				FROM `books`
				LIMIT {firstItem}, {itemsPerPage}"
			],
			"getTotalBooks" => [
				"attributes" => [
					[ "totalBooks", "totalBooks", "int"]
				],

				"strSQL" => "SELECT COUNT( * ) AS totalBooks
				   FROM `books`"
			],
			"getBookByID" => [
				"attributes" => [
					[ "book_id", "book_id", "int"],
					[ "book_name","book_name"],
					[ "summary","summary"],
					[ "first_publication_date", "first_publication_date"],
					[ "isbn13", "isbn13"],
					[ "cover_image", "cover_image"]
				],

				"strSQL" => "SELECT 
					`books`.`book_id`, 
					`books`.`book_name`, 
					`books`.`summary`, 
					`books`.`first_publication_date`, 
					`books`.`isbn13`, 
					`books`.`cover_image`
					FROM `books`
					WHERE `books`.`book_id` = {book_id}"
			],
			"getBookAuthors" => [
				"attributes" => [
					[ "author_id", "author_id", "int"],
            		[ "full_name","full_name"]
				],

				"strSQL" => "SELECT 
						`authors`.`author_id`, 
						`authors`.`full_name`
					FROM `books`
					INNER JOIN `books_authors` 
						ON `books`.`book_id` = `books_authors`.`book_id`
					INNER JOIN `authors` 
						ON `authors`.`author_id` = `books_authors`.`author_id`
					WHERE `books`.`book_id` = {book_id}"
			],
			"searchBooksByNameAndAuthorFullName" => [
				"attributes" => [
					["book_id", "book_id", "int"],
					["book_name", "book_name"],
					["authors", "authors"]
				],

				"strSQL" => "SELECT 
						`books`.`book_id`, 
						`books`.`book_name`,
						GROUP_CONCAT(`authors`.`full_name` SEPARATOR ', ') AS authors
					FROM `books`
					INNER JOIN `books_authors` 
						ON `books`.`book_id` = `books_authors`.`book_id`
					INNER JOIN `authors` 
						ON `authors`.`author_id` = `books_authors`.`author_id`
					WHERE `books`.`book_name` LIKE '%{searchQuery}%' OR `authors`.`full_name` LIKE '%{searchQuery}%'
					GROUP BY `books`.`book_id`
					" 
			],
			"getGenres" => [
				"attributes" => [
					["genre_id", "genreId", "int"],
					["genre_name", "genreName"]
				],

				"strSQL" => "SELECT 
						`genres`.`genre_id`, 
						`genres`.`genre_name` 
					FROM 
						`genres` 
					ORDER BY 
						`genres`.`genre_name`"
			],
			"getBooksByGenreID"=> [
				"attributes" => [
					[ "book_id", "book_id", "int"],
					[ "book_name","book_name"],
					[ "first_publication_date", "first_publication_date"],
					[ "cover_image", "cover_image"],
					[ "shortsummary","summary"]
				],

				"strSQL" => "
 					SELECT 
						`books`.`book_id`, 
						`books`.`book_name`, 
						`books`.`first_publication_date`,  
						`books`.`cover_image`, 
						`books`.`shortsummary` 
					FROM `genres`
					LEFT JOIN `books_genres` ON `genres`.`genre_id` = `books_genres`.`genre_id` 
					LEFT JOIN `books`  ON `books_genres`.`book_id` =  `books`.`book_id`
					WHERE `genres`.`genre_id` = {genre_id}
				"
			],
			"getBooksNotInGenre" => [
				"attributes" => [
					[ "book_id", "book_id", "int"],
					[ "book_name","book_name"],
					[ "first_publication_date", "first_publication_date"],
					[ "cover_image", "cover_image"],
					[ "shortsummary","summary"]
				],

				"strSQL" => "
 					SELECT 
						`books`.`book_id`, 
						`books`.`book_name`, 
						`books`.`first_publication_date`,  
						`books`.`cover_image`, 
						`books`.`shortsummary` 
					FROM `books`
					WHERE `books`.`book_id` NOT IN (
						SELECT `books_genres`.`book_id`
						FROM `books_genres`
						WHERE `books_genres`.`genre_id` = {genre_id}
					)
					ORDER BY `books`.`book_name`
				"
			],
			"getAllCountries" => [
				"attributes" => [
					[ "iso3", "iso3"],
					[ "country_name", "country_name"]
				],

				"strSQL" => "SELECT 
						`iso3`, 
						`country_name`
					FROM `countries`
					ORDER BY `iso3`"
			],
			"login" => [
				"attributes" => [
					[ "user_id", "user_id"],
					[ "username", "username"],
					[ "email", "email" ],
					[ "user_password", "password" ],
					[ "date_birth", "date_birth" ],
					[ "created_at", "created_at" ],
					[ "active", "active" ],
					[ "ISO3", "ISO3" ],
				],
				"strSQL" => "SELECT 
						`users`.`user_id`, 
						`users`.`username`, 
						`users`.`email`, 
						`users`.`user_password`, 
						`users`.`date_birth`, 
						`users`.`created_at`, 
						`users`.`active`, 
						`users`.`ISO3` 
						FROM `users` 
						WHERE `users`.`email` = '{email}'"
			]
		];

		return $queries[$queryName];
	}

	// getData
	function mod002_getData( $queryName, $queryData = []){
 		$querySentence = mod002_getDetailQueries($queryName);
		$strSQL = $querySentence["strSQL"];
		$attributes = $querySentence["attributes"];
		// Parameters substitution
		foreach ( $queryData as $key => $value) {
			$strSQL = str_replace('{' . $key . '}', $value, $strSQL);
		}
		return mod002_executeQuery( $strSQL, $attributes );
	}

?>