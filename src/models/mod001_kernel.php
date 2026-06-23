
<?php
	// mod001_kernel.php
	function mod001_conectoBD () {
		$direccion  = "localhost";
		$usuario    = "root";
		$contrasena = "";
		$database   = "books_v3";
		
		try {
			return mysqli_connect( $direccion, $usuario, $contrasena, $database );
		} catch ( mysqli_sql_exception $e ) {
			//echo "Revisa el nombre de la base de datos.";
			error_log( "mod001_conectoBD: " . $e->getMessage() );
			return null;
		}
	}

	function mod001_desconectoBD ( $link ) {
		// Realizar la query de desconexión.
        mysqli_close( $link );
	}
?>
