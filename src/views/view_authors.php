<!-- view_authores.php -->
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8" />
		<title><?php echo $html["title"];?></title>
		<!-- Custom CSS -->
		<link rel="stylesheet" href="../public/assets/css/style.css">
		
	</head>
	<body>
		<?php require "../src/views/header.php"; ?>
		<div class='main_content'>
		<?php
			echo $html["html"];
		?>
		</div>
		<?php require "../src/views/footer.php"; ?>	
	</body>


</html>