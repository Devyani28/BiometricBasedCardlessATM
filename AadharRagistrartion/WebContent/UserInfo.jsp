<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Aadhaar Registration</title>
<link rel="shortcut icon" href="img/aadhaar.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/a7926a9838.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<header class="header" style="height: fit-content;">
		<img src="img/aadhaar.png" class="headerLogo">
		<h1>
			Unique Identification Authority of India<br>Goverment of India
		</h1>
		<img src="img/ashok.png" class="headerLogo">
	</header>
	

	<div id="mainPage">
		<ul>
			<li class="active">&#10003</li>
			<li>2</li>
			<li>3</li>
			<li>4</li>
			<li>5</li>
			<button type="submit" form="myForm" id="mainPageNextBtn"
				class="backnext">Next</button>
			<button id="mainPageBackBtn" class="backnext">Back</button>
		</ul>
		<div class="container">
			<form id="myForm" method="post" style="width: 100%;"
				action="userInfo">
				<fieldset>
					<legend style="color: #9E1C40;">Personal Details</legend>
					<table>
						<tr>
							<td><label>Name <span>*</span></label></td>
							<td><label>Gender <span>*</span></label></td>
							<td><label>Date of Birth <span>*</span></label></td>
						</tr>
						<tr>
							<td><input id="name" name="uname" type="text"
								placeholder="Enter Name" required></td>
							<td><select name="gender" placeholder="Select Gender">
									<option>Male</option>
									<option>Female</option>
									<option>Other</option>
							</select></td>
							<td><input name="dob" type="date" max="2019-01-01"
								min="1910-01-01" placeholder="Choose Date of Birth"></td>
						</tr>
					</table>
				</fieldset>
				<fieldset>
					<legend style="color: #9E1C40;">Contact Details</legend>
					<table>
						<tr>
							<td><label>Mobile No. <span>*</span></label></td>
							<td><label>Email </label></td>
							<td><label>Pincode <span>*</span></label></td>
						</tr>
						<tr>
							<td><input type="text" name="phoneNum"
								placeholder="Enter Mobile No."></td>
							<td><input type="email" name="uemail"
								placeholder="Enter Email"></td>
							<td><input type="text" name="pincode" maxlength="6"
								minlength="6" placeholder="Enter Pincode"></td>
						</tr>
						<tr>
							<td><label>State <span>*</span></label></td>
							<td><label>Distict <span>*</span></label></td>
							<td><label>Village/Town <span>*</span></label></td>
						</tr>
						<tr>
							<td><select class="form-control" name="state" placeholder="Select State" id="select1">
									<option value="UP">UP</option>
									<option value="Bihar">Bihar</option>
									<option value="MP">MP</option>
									<option value="AP">AP</option>
							</select></td>
							<td><select class="form-control" name="district" placeholder="Select State" id="select2">
									<option value="UP">Agra</option>
									<option value="UP">Aligarh</option>
									<option value="UP">Allahabad</option>
									<option value="UP">Etawah</option>
									<option value="UP">Farrukhabad</option>
									<option value="UP">Hathras</option>
									<option value="UP">Jhansi</option>
									<option value="UP">Lucknow</option>
									<option value="UP">Mathura</option>
									
									<option value="Bihar">Arwal</option>
									<option value="Bihar">Aurangabad</option>
									<option value="Bihar">Bhagalpur</option>
									<option value="Bihar">Buxar</option>
									<option value="Bihar">Darbhanga</option>
									<option value="Bihar">Gaya</option>
									<option value="Bihar">Muzaffarpur</option>
									<option value="Bihar">Patna</option>
									<option value="Bihar">Rohtas</option>
									
									<option value="MP">Anuppur</option>
									<option value="MP">Bhopal</option>
									<option value="MP">Chhatarpur</option>
									<option value="MP">Dindori</option>
									<option value="MP">Gwalior</option>
									<option value="MP">Indore</option>
									<option value="MP">Jabalpur</option>
									<option value="MP">Khandwa</option>
									<option value="MP">Rajgarh</option>
									<option value="MP">Shivpuri</option>
									<option value="MP">Ujjain</option>
									<option value="MP">Umaria</option>
									
									
									<option value="AP">Anantapur</option>
									<option value="AP">Chittoor</option>
									<option value="AP">East Godavari</option>
									<option value="AP">Krishna</option>
									<option value="AP">Prakasam</option>
									<option value="AP">Srikakulam</option>
									<option value="AP">Visakhapatnam</option>
									<option value="AP">West Godavari</option>
									<option value="AP">YSR District, Kadapa (Cuddapah)</option>
							</select></td>
							<td><input type="text" placeholder="Enter Village/Town"></td>
						</tr>

					</table>
				</fieldset>
			</form>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		var $select1 = $('#select1'), $select2 = $('#select2'), $options = $select2
				.find('option');

		$select1.on('change', function() {
			$select2.html($options.filter('[value="' + this.value + '"]'));
		}).trigger('change');
	</script>

</body>
</html>