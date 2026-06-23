<?php
    /* fetch.php */
    require_once '../../src/models/fetch/mod003_logica.php';

    header( "Content-Type: application/json" );
    $dataReceivedWithoutFormat = trim( file_get_contents( "php://input" ) );
    //var_dump($dataReceivedWithoutFormat);
    $dataReceived = json_decode( $dataReceivedWithoutFormat, true );
    //var_dump($dataReceived[ "action" ] );

    switch ( $dataReceived[ "action" ] ) {
        // search bar
        case "searchBooksByNameAndAuthorFullName":
            $searchQuery = $dataReceived[ "query" ];
            $data = mod003_searchBooks( $searchQuery );
           
            echo json_encode( $data );
            break;

        // page genres
        case "getGenres":
            $data = mod003_getGenres();
            echo json_encode( $data );
            break;

        case "updateGenre":
            $genre_id = $dataReceived[ "genre_id" ];
            $genre_name = $dataReceived[ "genre_name" ];
            $data = mod003_updateGenre( $genre_id, $genre_name );
            echo json_encode( $data );
            break;

        case "addGenre":
            $genre_name = $dataReceived[ "genre_name" ];
            $data = mod003_addGenre($genre_name);
            echo json_encode($data);
            break;
        
        case "deleteGenre":
            $genre_id = $dataReceived[ "genre_id" ];
            $data = mod003_deleteGenre($genre_id);
            echo json_encode( $data );
            break;
        
        case "getBooksGenre":
            $genre_id = $dataReceived[ "genre_id" ];
            $data = mod003_getBooksGenre($genre_id);
            echo json_encode( $data );
            break;

        case "getBooksNotInGenre":
            $genre_id = $dataReceived[ "genre_id" ];
            $data = mod003_getBooksNotInGenre($genre_id);
            echo json_encode( $data );
            break;
            
        case "addBookToGenre":
            $genre_id = $dataReceived[ "genre_id" ];
            $book_id = $dataReceived[ "book_id" ];
            $data = mod003_addBookToGenre($genre_id, $book_id);
            echo json_encode( $data );
            break;

        case "removeBookFromGenre":
            $genre_id = $dataReceived[ "genre_id" ];
            $book_id = $dataReceived[ "book_id" ];
            $data = mod003_removeBookFromGenre($genre_id, $book_id);
            echo json_encode( $data );
            break; 
        case "getAllAuthors":
            $data = mod003_getAllAuthors();
            echo json_encode( $data );
            break;
        case "getAllCountries":
            $data = mod003_getAllCountries();
            echo json_encode( $data );
            break;
        case "updateAuthor":
            $author_id = $dataReceived[ "id" ];
            $full_name = $dataReceived[ "name" ];
            $summary = $dataReceived[ "summary" ];
            $iso3 = $dataReceived[ "iso3" ];
            $data = mod003_updateAuthor( $author_id, $full_name, $summary, $iso3 );
            echo json_encode( $data );
            break;

        default:
            echo json_encode( [ "error" => "action probably misspelled." ] );
    }