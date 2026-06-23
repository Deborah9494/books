 <?php
	// mod003_logica.php
	require __DIR__ . "/../mod002_accesoadatos.php";
	
	function mod003_getAuthorsPagination( $firstItem, $itemsPerPage ) {
		$arDataAuthors = mod002_getData(
			"getPaginatedAuthors", 
			[ 
				"firstItem" 		=> $firstItem, 
			  	"itemsPerPage" 	=> $itemsPerPage 
			]  
		);

		if ($arDataAuthors[ "status" ][ "codError" ] === "000" ){
			$authors = $arDataAuthors["data"];
			// var_dump($authors);
			foreach ($authors as &$author) {
				// Shorten summary to 60 chars
				if (strlen($author["summary"]) > 60) {
					$author["summary"] = substr($author["summary"], 0, 60) . "...";
				}
			}
		}
		return $arDataAuthors;
	}
	
	function mod003_getTotalAuthors() {
		$totalAuthors = mod002_getData("getTotalAuthors");
		if ($totalAuthors[ "status" ][ "codError" ] === "000" ){
			return $totalAuthors["data"][0]["totalAuthors"];
		}
		return 0;
	}

	function mod003_getAuthorDetail($author_id) {
		$author = mod002_getData(
			"getAuthorsByID",
			[
				"author_id" => $author_id
			]
		);
 		$books = mod002_getData(
			"getBooksByAuthorID",
			[
				"author_id" => $author_id
			]
		);
		if ($books[ "status" ][ "codError" ] === "000" ){
			foreach ($books["data"] as &$book) {
				// Shorten summary
				if (strlen($book["summary"]) > 230) {
					$book["summary"] = substr($book["summary"], 0, 226) . "...";
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

		return [
			"author" => $author,
			"books" => $books
		];
	}
?>
