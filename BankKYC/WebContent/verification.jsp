<%@page import="com.otp.SendOTP"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/a7926a9838.js"
	crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<link rel="shortcut icon" href="img/bank.png" type="image/x-icon">
<style>
body {
	background-color: #e8e8e8;
	font-family: arial;
	font-size: 13px;
}

header {
	background-color: #9E1C40;
	height: 15vh;
	width: 100%;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}


h1 {
	margin-left: 25px;
	color: #EEB205;
}

button {
	background-color: #9E1C40;
	color: #fff;
	border: none;
	border-radius: 5px;
	margin: 5px;
	padding: 5px;
	width: auto;
}

input {
	border: none;
	height: 5vh;
	border-bottom: 1px solid #3e3d3d;
	margin-top: 7px;
	margin-bottom: 3px;
	border-left-style: hidden;
}

input:focus {
	outline: none;
}

input:checked {
	background-color: red;
}
</style>
</head>

<body>
<%
	String s = "hello";
	if(request.getParameter("status")!=null){
		s = request.getParameter("status");
	}
	
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
	<header class="header">
		<i class="fa fa-bank" style="font-size: 75px; color: #EEB205;"></i>
		<h1>BANK OF INDIA</h1>
	</header>
	<div style="margin: 10px auto;
	height: 70vh;
	width: 70%;
	padding-left: 15px;
	background-color: #fff;
	border: outset;">
		<h2 style="color: #9E1C40; font-family: arial;">Verification</h2>
		Kindly input your <b>Mobile Number linked to your Aadhar</b><br>
		<br>
		<!-- <form action="AccountVerify" method="post" id="account"> -->
		<label style="font-weight: bold;">Account Number<font
			color="red" size="4px"> *</font></label><br> 
			
			<input type="text" name="user" placeholder="Enter Your Account Number" id="user" /><br> 
			
			<input type="checkbox" required>
				 <label>I approved bank and
				it's representation to call and SMS regarding my Fetching Account
				application. I confirm that i am a resident of India.</label><br>
		<br> 
		<input type="button" value="PROCEED" id="proceed"
			style="background-color: #9E1C40; color: #fff; border: none; border-radius: 5px; margin: 5px; padding: 5px; width: auto;"><br>
		<font size="1px">On doing PROCEED, an OTP will be sent to your
			Mobile number for authentication.</font>
		<!-- </form> -->
		<div class="popup"
			style="display: none; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: auto; z-index: 50; background: #F3F3F3; box-shadow: 0 15px 25px #9E1C40; height: 80vh; text-align: center;">
			<br> <img src="img/otp.png" heigth="40vh" width="40%"><br>
			<h2 style="color: #9E1C40;">
				<b>Aadhar OTP Verification </b>
			</h2>
			<p>Please enter the 6-digits OTP that has been sent to the mobile
				number linked to your account number</p>
			<span id="userAccountNumOnPopUp">10******23 </span><a href="verification.jsp" id="changeAcountLink"> Change
				Account Number</a><br>
			<form action="AccountVerify" method="post" id="otpForm">
				<input name="otpFstDigit" id="otpFstDigit"
					style="width: 5%; border: none; border-bottom: 1px solid #3e3d3d;"
					onkeyup="fn(this,'otpSecDigit')" maxlength="1" required> <input
					name="otpSecDigit" id="otpSecDigit"
					style="width: 5%; border: none; border-bottom: 1px solid #3e3d3d;"
					onkeyup="fn(this,'otpThrDigit')" maxlength="1" required> <input
					name="otpThrDigit" id="otpThrDigit"
					style="width: 5%; border: none; border-bottom: 1px solid #3e3d3d;"
					onkeyup="fn(this,'otpFourDigit')" maxlength="1" required> <input
					name="otpFourDigit" id="otpFourDigit"
					style="width: 5%; border: none; border-bottom: 1px solid #3e3d3d;"
					onkeyup="fn(this,'otpFifthDigit')" maxlength="1" required>
				<input name="otpFifthDigit" id="otpFifthDigit"
					style="width: 5%; border: none; border-bottom: 1px solid #3e3d3d;"
					onkeyup="fn(this,'otpSixDigit')" maxlength="1" required> <input
					name="otpSixDigit" id="otpSixDigit"
					style="width: 5%; border: none; border-bottom: 1px solid #3e3d3d;"
					maxlength="1" required> <input form="otpForm" type="submit"
					style="background-color: #9E1C40; color: #fff; border: none; border-radius: 5px; margin: 5px; padding: 5px; width: auto;">
			</form>
			<br> <a href="#" id="resendOtp">Resend OTP button will activate in <span id="otpCountDown">32</span>
				second
			</a>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script>
	
	<%
	if(s.equals("failedOtp")){
	//response.sendRedirect("/BankKYC/verification.jsp");
		%>
	swal("Wrong Otp","","error");
	
		<%
	}
	%>
	
	
	$(document).ready(function() {
		//console.log($);
		$('#proceed').click(function(event) {
			var username = $('#user').val();
			
			var chk = $('input[type="checkbox"]');
	        
	            if(username==""){
	            	swal("Oops!", "Please Enter Acount Number!", "warning");
	            }
	            else if(chk.prop("checked") == false){
	            	swal("Oops!", "Please check the checkbox!", "warning");
	            }
	            else{
	            	
			$.get('AccountVerify', {
				user : username
			}, function(data,status) {
				/* alert(data); */
					$("body").css("filter","blur(8px)");
				if(data==="404"){
					$("body").removeAttr("style");
					swal("Oops!", "Please Enter valid Acount Number!", "error");
				}else{
					$("body").removeAttr("style");
					swal("Great!","Otp is send successfully to your phone"+data,"success");
					document.getElementById("resendOtp").style.color="grey"
					document.querySelector('.popup').style.display = 'block';
					document.getElementById("userAccountNumOnPopUp").innerHTML = data.substring(0, 1)+"*******"+data.substring(7, 10);
				
					var timerLimit = setInterval(seconds, 1000)
					var timer=32;
					function seconds() {
						timer--;
					  document.getElementById("otpCountDown").innerHTML = timer;
					  if(timer==0)
						  {
						  clearTimeout(timerLimit);
					  	  document.getElementById("resendOtp").style.color="blue"
						  }
					}
				}
				
			});
	            }
			
		});
	});
	
	$("#resendOtp").click(function(){
		console.log("d");
	});
	
        function fn(current,next) {
            var len = current.value.length;
            var mx = current.getAttribute("maxlength");
            if(len==mx){
                document.getElementById(next).focus();
            }
        }
        
    </script>
</body>

</html>