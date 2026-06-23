<?php
	// mod004_presentacion.php
	require __DIR__ . "/mod003_logica.php";
	require __DIR__ . "/../mod004_handle_errors.php";
	require __DIR__ . "/../mod004_pagination.php";


	function mod004_getAuthorsPagination( $firstItem, $itemsPerPage, $view = "table" ) {
		$data = mod003_getAuthorsPagination( $firstItem, $itemsPerPage );
		// todo: handle error in case totalAuthors endpoint is not working, number or 0
		$totalAuthors = mod003_getTotalAuthors(); 

		$title = "Autores";
		$html = "";
		if ($data[ "status" ][ "codError" ] === "000" ){
			$authors_data = $data["data"];
			$html .= "<h1>Listado Autores</h1>";

			// View switch
			$html .= "<div class='view_switch'>";
			$html .= "<a href='authors.php?view=table&firstItem=$firstItem&itemsPerPage=$itemsPerPage'>Tabla</a> | ";
			$html .= "<a href='authors.php?view=cards&firstItem=$firstItem&itemsPerPage=$itemsPerPage'>Cards</a>";
			$html .= "</div>";

			// Items per page options
			$html .= mod004_itemsPerPageOptions("authors.php?view=$view", $itemsPerPage, "autores");

			if ($view === "cards"){
				$html .= "<div class='card_container'>";
				foreach ($authors_data as $author) {
					$html.= "<div class='card'><a href='authors.php?author_id=".$author["author_id"]."'>";
					$html.= "  <div class='card_inner'>";

					// FRONT (imagen completa)
					$html.= "      <div class='card_front no_image'>";
					$html.= "          <div class='card_title_overlay'>" . $author["full_name"] . "</div>";
					$html.= "      </div>";

					// BACK (info)
					$html.= "      <div class='card_back'>";	
					$html.= "          <h3>" . $author["full_name"] . "</h3>";
					$html.= "          <p>" . $author["summary"] . "</p>";
					$html.= "      </div>";

					$html.= "  </div>"; // card_inner
					$html.= "</a></div>"; // card
				}
				$html .= "</div>"; // card_container
			}else{

				$html .= "<table id='authors_table'>";
				$html .= "<thead><tr>
					<th>Full Name</th>
					<th>Country</th>
					<th>Summary</th>
				</tr></thead>";

				$html .= "<tbody>";

				foreach ( $authors_data as $author ) {
					$html .= "<tr>"
								. "<td><a href='authors.php?author_id=".$author["author_id"]."'>".$author["full_name"]."</a></td>"
								. "<td>".$author["ISO3"]."</td>"
								. "<td>".$author["summary"]."</td>"
								. "</tr>";
				}
				$html .= "</tbody></table>";
			}

			// Pagination controls
			$html .= mod004_controlsPagination(
				"authors.php?view=$view",
				$firstItem,
				$itemsPerPage,
				$totalAuthors,
				"autores"
			);
			return [
				"title" => $title,
				"html" => $html
			];
		} else {
			return mod004_generateError($data[ "status" ]);
		}
	}

	function mod004_getAuthorDetail($author_id) {
		$data = mod003_getAuthorDetail($author_id);
		if ( $data["author"][ "status" ][ "codError" ] !== "000" ){
			return mod004_generateError($data["author"][ "status" ]);
		}elseif( $data["books"][ "status" ][ "codError" ] !== "000" ){
			return mod004_generateError($data["books"][ "status" ]);
		}else{
			//var_dump($data);
			$data_author = $data["author"]["data"][0];
			$data_books = $data["books"]["data"];
			$html = "<div class='main_content'>";
			$html .= "<h1 class='detail_title'>".$data_author["full_name"]."</h1>";

			$html .= "<div class='detail_meta'>";
			$html .= "<p><b>Summary: </b>".$data_author["summary"]."</p>";
			$html .= "</div>";

			$html .= "<div class='detail_footer'>";
			$html .= "<a href='authors.php' class='btn back_btn'>← Back to authors</a>";
			$html .= "</div>";

			$html .= "<h3>Books</h3>";
			
			$html .= "<div class='card_container'>";
			foreach ($data_books as $book) {
				$html.= "<div class='card'><a href='books.php?book_id=".$book["book_id"]."'>";
				$html.= "  <div class='card_inner'>";

				// FRONT (imagen completa)
				$html.= "      <div class='card_front'>";
				$html.= "          <img class='card_image_full' src='" . $book["cover_image"] . "' alt='" . $book["book_name"] . "'>";
				$html.= "          <div class='card_title_overlay'>" . $book["book_name"] . "</div>";
				$html.= "      </div>";

				// BACK (info)
				$html.= "      <div class='card_back'>";
				$html.= "          <h3>" . $book["book_name"] . "</h3>";
				$html.= "          <p class='date'>" . $book["first_publication_date"] . "</p>";
				$html.= "          <p>" . $book["summary"] . "</p>";
				$html.= "      </div>";

				$html.= "  </div>"; // card_inner
				$html.= "</a></div>"; // card
			}
			$html .= "</div>"; // card_container
			$html.= "</div>"; // main_content

			return [
				"title" => $data_author["full_name"],
				"html" => $html
			];
		}
	}

	

?>