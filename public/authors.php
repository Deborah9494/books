<?php
	session_start();
	// authors.php
	require "../src/models/authors/mod004_presentacion.php";

	if (isset($_GET["author_id"])) {
		// show detail of the author
		$author_id = $_GET["author_id"];
		$html = mod004_getAuthorDetail($author_id);
	} else {
		// show list of authors
		$firstItem = isset($_GET["firstItem"]) ? (int)$_GET["firstItem"] : 0;
		$itemsPerPage = isset($_GET["itemsPerPage"]) ? (int)$_GET["itemsPerPage"] : 8;
		$view = isset($_GET["view"]) ? $_GET["view"] : "table";
		$html = mod004_getAuthorsPagination($firstItem, $itemsPerPage, $view);
	}


	require "../src/views/view_authors.php";
?>
