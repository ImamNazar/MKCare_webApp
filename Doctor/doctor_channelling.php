
<?php

include('connector.php');

session_start();

$patient_id = $_SESSION['patient_id'];

if(!isset($patient_id)) {
	header('location:login.php');
}

if(isset($_POST['send'])){
	
	$name = mysqli_real_escape_string($conn, $_POST['name']);
	$email = mysqli_real_escape_string($conn, $_POST['email']);
	$phone_number = $_POST['phone_number'];
	$d_name = mysqli_real_escape_string($conn, $_POST['d_name']);
	$d_email = mysqli_real_escape_string($conn, $_POST['d_email']);
	$placed_on = date('d-m-y');
	
	
	$select_appointments = mysqli_query($conn, "SELECT * FROM `appointments` WHERE name ='$name' AND email = '$email' AND phone_number ='$phone_number' AND d_name = '$d_name' AND d_email = '$d_email' AND placed_on = '$placed_on'" ) or die('Query failed!');
	
	
	if(mysqli_num_rows($select_appointments) > 0) {
		$message[] = 'Appointment has been scheduled already!';
	}else{
		mysqli_query($conn, "INSERT INTO `appointments`(patient_id, name, phone_number, email, d_name, d_email, placed_on) VALUES('$patient_id', '$name', '$number', '$email', '$d_name', '$d_email', '$placed_on')") or die('Query failed!');
		$message[] = 'Appointment has been scheduled successfully';
	}
}

?>







<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>About Us | MKCare - MK Hospitals</title>
	
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
	
	<!---custom css file--->
	
	<link rel="stylesheet" href="styles.css">
	
	
	
	
</head>

<body>
	
	<?php include('header.php'); ?>
	
	
	<div class="heading">
	
			<h3>Contact Us</h3>
			<p><a href="home.php">Home</a> / MKCare.</p>
			
		</div>

	
	<section class="contact">
	
		
		<form action="" method="post">
			<h3>Help Us Improve</h3>
		
			<input type="text" name="name" required placeholder="Enter your name" class="formbox">
			<input type="email" name="email" required placeholder="Enter your email" class="formbox">
			<input type="number" name="phone_number" required placeholder="Enter your phone number" class="formbox">
			<textarea name="address" id="" cols="30" rows="10" placeholder="Type in your address" class="formbox"></textarea>
			<textarea name="message" id="" cols="30" rows="10" placeholder="Type in your message" class="formbox"></textarea>
			<input type="submit" value="Send Message" name="send" class="btn">
			
			<hr>
			
		
			
		</form>
		
	</section>
	
	
	<section class="banner-contact">
	
	<div class="content">
	
		<p>Call us regarding any inquiry <em>+94(0)-11-553-0000</em></p>
	
	</div>
	
	</section>
	
	
	
	
	
	<?php include('features.php'); ?>
	
	<?php include('footer.php'); ?>
	
	
	
	<!--admin js file link------>
	
	<script src="script.js"></script>
	
</body>
</html>