<!DOCTYPE html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div id='intro'>
<p>
On a boring day with a heavy thunderstorm outside and nothing on the internet, a mysterious impulse draws you into ascending to your house's attic, descending to the basement, or delving into another seldom-visited place where old and strange artifacts could easily be hidden. It is here, from under a pile of other items, covered in a layer of dust, that you find an unfamiliar eldritch tome.
</p>
<p>
When you open the book, a powerful magical light shines out and you find yourself looking at a series of incredibly detailed landscapes, people, and villains of fantasy straight from another world; a world full of adventure, mystery, and danger. The first few pages of are different: instead of pictures, they concern themselves with sheets and questions, multiple-choices and boxes to fill, with enough space for you to answer. As you do so, you find that the book imprints itself upon you, becoming yours forever and something only you can use.
<br>For this book is not a book at all, but rather a portal... and as its new owner, you have become its gatekeeper!
</p>
</div>
<div id='classes'>
<?php
// Create connection
$con=mysqli_connect("localhost:3306","root","****","adventure_time");
// Check connection
if(mysqli_connect_errno()) {
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
// Execute SQL queries
$classes = mysqli_query($con, "SELECT * FROM class");
// Parse results
for ($i=0; $i<mysqli_num_rows($classes); $i++) {
	$class_row = mysqli_fetch_array($classes);
	$skills = mysqli_query($con, "SELECT * FROM skills WHERE base_class = \"" . $class_row['class_id'] . "\"");
	
	echo "
	<div id='" . $class_row['name'] . "' class='class_panel'>";
	echo "<p class='class_title'>" . $class_row['name'] . "</p>";
	echo "<p class='class_desc'>" . $class_row['description'] . "</p>";
	for ($j=0; $j<mysqli_num_rows($skills); $j++) {
		$skill_row = mysqli_fetch_array($skills);
		echo "<p class='skills'>
		<span class='skill_name'>" . $skill_row['name'] . ":</span> " . $skill_row['description'] . "</p>";
	}
	echo "</div>";
}

mysqli_close($con);
?>

</div>
</body>

</html>