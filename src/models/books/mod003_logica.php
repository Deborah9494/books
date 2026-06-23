<?php
	// mod003_logica.php
	require __DIR__ . "/../mod002_accesoadatos.php";

	function mod003_getBooksPagination( $firstItem, $itemsPerPage ) {
		$books = mod002_getData(
			"getPaginatedBooks",
			[ 
				"firstItem" 		=> $firstItem, 
			  	"itemsPerPage" 	=> $itemsPerPage 
			] 
		);
		if ($books[ "status" ][ "codError" ] === "000" ){
			foreach ($books["data"] as &$book) {
				// Shorten short summary to 80 chars
				if (strlen($book["shortsummary"]) > 80) {
					$book["shortsummary"] = substr($book["shortsummary"], 0, 80) . "...";
				}
				// Format date
				if (!empty($book["first_publication_date"])) {
					$book["first_publication_date"] = date(
						"d F Y",
						strtotime($book["first_publication_date"])
					);
				}
				
			}
		}
		return $books;
	}

	function mod003_getTotalBooks() {
		$totalBooks = mod002_getData("getTotalBooks");
		if ($totalBooks[ "status" ][ "codError" ] === "000" ){
			return $totalBooks[ "data" ][ 0 ][ "totalBooks" ];
		}
		return 0;
	}

	function mod003_getBookDetail($book_id) {
		$book = mod002_getData(
			"getBookByID",
			[
				"book_id" => $book_id
			]
		);
		$authors = mod002_getData(
			"getBookAuthors",
			[
				"book_id" => $book_id
			]
		);
		// Format date
		if ($authors[ "status" ][ "codError" ] === "000" ){
			if (!empty($book["data"][0]["first_publication_date"])) {
				$book["data"][0]["first_publication_date"] = date(
					"d F Y",
					strtotime($book["data"][0]["first_publication_date"])
				);
			}
		}
		return [
			"authors" => $authors,
			"book" => $book
		];
	}

	


?>
