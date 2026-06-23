<?php
	// mod004_generate_error.php
	function mod004_generateError($dataStatus) {
		$title = "Error";
		$html = "";
		if ( $dataStatus[ "codError" ] === "001" ) {
				$html .= "<h1>Error</h1>";
				$html .= "<p class='error'>Error <b>#{$dataStatus[ "codError" ]}</b>:<br>No hay datos</p>";
		} else {
			$html .= "<h1>Error</h1>";
			$html .= "<p class='error'>Error <b>#{$dataStatus[ "codError" ]}</b>:<br>";
			$html .= "{$dataStatus[ "msgError" ]}</p>";
		}
		return [
				"title" => $title,
				"html" => $html
			];

	}


?>