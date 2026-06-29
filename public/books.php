<?php
	session_start();
	// books.php
	require "../src/models/books/mod004_presentacion.php";

	if (isset($_GET["book_id"])) {
		// show detail of the books
		$book_id = $_GET["book_id"];
		$html = mod004_getBookDetail($book_id);
	} else {
		// show list of books
		$firstItem = isset($_GET["firstItem"]) ? $_GET["firstItem"] : 0;
    	$itemsPerPage = isset($_GET["itemsPerPage"]) ? $_GET["itemsPerPage"] : 8;
	    $view = isset($_GET["view"]) ? $_GET["view"] : "table";
		$html = mod004_getBooksPagination( $firstItem, $itemsPerPage, $view );
	}

	require "../src/views/view_books.php";


	



?>
