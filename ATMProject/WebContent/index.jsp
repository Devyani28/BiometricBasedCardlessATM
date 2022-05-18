<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<link rel="shortcut icon" href="img/atms.jpg" type="image/x-icon">

</head>
<body>

	<%
	String s = "hello";
	if(request.getParameter("status")!=null){
		s = request.getParameter("status");
	}
	
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
	<div id="mainPanel">
		<div style="width: 6.5vw;">
			<button
				style="height: 50%; width: 100%; font-weight: bold; font-size: 4vw; border: 4px outset lightgrey;">
				>></button>
			<button
				style="height: 50%; width: 100%; font-weight: bold; font-size: 4vw; border: 4px outset lightgrey;">>></button>
		</div>

		<div class="welcomePanel"
			style="height: inherit; width: 90%; background-image: url(img/bg.jpg); background-size: cover; text-align: center; color: #fff">
			<div>
			<h1 style="text-align: center;">WELCOME</h1>
			<h2>PLEASE ! ENTER YOUR ACCOUNT NUMBER</h2>
			<input class="input" style="width: 30vw" id="AccNo" name="AccNo">
			</div>
			<div style="width: fit-content;">
			<button style="background: transparent; color: #fff; margin: 2vw; font-size: 2vw; text-align: left; width: fit-content;"
				name="accVerify" id="accVerify">SUBMIT</button>
				</div>
		</div>


		<div class="otpPanel"
			style="height: inherit; width: 80%; background-image: url(img/bg.jpg); background-size: cover; text-align: center; color: #fff">
			<div class="otpFormSection">
				<form action="validityOfAccount" id="otpForm" method="post">
					<h1 style="text-align: center;">ENTER OTP</h1>
					<h2>SENDING ON REGISTERED MOBILE</h2>
					<div class="otpInput">
						<input name="otpFstDigit" id="otpFstDigit" class="input"
						style="width: 3vw;" onkeyup="fn(this,'otpSecDigit')" maxlength="1"
						required> <input name="otpSecDigit" id="otpSecDigit"
						class="input" style="width: 3vw;" onkeyup="fn(this,'otpThrDigit')"
						maxlength="1" required> <input name="otpThrDigit"
						id="otpThrDigit" class="input" style="width: 3vw;"
						onkeyup="fn(this,'otpFourDigit')" maxlength="1" required>
					<input name="otpFourDigit" id="otpFourDigit" class="input"
						style="width: 3vw;" onkeyup="fn(this,'otpFifthDigit')"
						maxlength="1" required> <input name="otpFifthDigit"
						id="otpFifthDigit" class="input" style="width: 3vw;"
						onkeyup="fn(this,'otpSixDigit')" maxlength="1" required> <input
						name="otpSixDigit" id="otpSixDigit" class="input"
						style="width: 3vw;" maxlength="1" required>
					</div>
					<!-- <button type="submit" margin:2vw;font-size: 2vw;text-align:left;" > SUBMIT</button> -->
				</form>
			</div>
			<div class="otpSubmitBtnSection"
				style="width: fit-content;">
				<button
					style="background: transparent; color: #fff; margin: 2vw; font-size: 2vw; text-align: left; width: fit-content;"
					submit" form="otpForm" class="otpFormBtn">SUBMIT</button>
			</div>
		</div>

		

		<div>
			<button
				style="text-align: center; height: 50%; width: 100%; font-weight: bold; font-size: 4vw; border: 4px outset lightgrey;">
				<<</button>
			<br>
			<button
				style="height: 50%; width: 100%; font-weight: bold; font-size: 4vw; border: 4px outset lightgrey;">
				<<</button>
		</div>
	</div>
	<div id="rightPanel">
		<img src="img/atms.jpg" id="atmImg">
	</div>
	<div id="buttonPanel">
		<center>
			<table id="buttonTable">
				<tr>
					<td><button id="button1" value="1" onclick="btnClick(1)">
							<img src="img/1.png" class="noBtnImg" />
						</button></td>
					<td><button id="button2" onclick="btnClick(2)">
							<img src="img/2.png" class="noBtnImg" />
						</button></td>
					<td><button id="button3" onclick="btnClick(3)">
							<img src="img/3.png" class="noBtnImg" />
						</button></td>
					<td><button id="cancel"
							style="height: 9vh; width: 15vw; border-width: 0 3.5px 3.5px 0; border-color: #000; background-color: red; font-size: 25px; font-weight: bold;">CANCEL</button>
					</td>
				</tr>
				<tr>
					<td><button id="button4" onclick="btnClick(4)">
							<img src="img/4.png" class="noBtnImg" />
						</button></td>
					<td><button id="button5" onclick="btnClick(5)">
							<img src="img/5.png" class="noBtnImg" />
						</button></td>
					<td><button id="button6" onclick="btnClick(6)">
							<img src="img/6.png" class="noBtnImg" />
						</button></td>
					<td><button id="clear"
							style="height: 9vh; width: 15vw; border-width: 0 3.5px 3.5px 0; border-color: #000; background-color: yellow; font-size: 25px; font-weight: bold;">CLEAR</button>
					</td>
				</tr>
				<tr>
					<td><button id="button7" onclick="btnClick(7)">
							<img src="img/7.png" class="noBtnImg" />
						</button></td>
					<td><button id="button8" onclick="btnClick(8)">
							<img src="img/8.png" class="noBtnImg" />
						</button></td>
					<td><button id="button9" onclick="btnClick(9)">
							<img src="img/9.png" class="noBtnImg" />
						</button></td>
					<td><button id="enter"
							style="height: 9vh; width: 15vw; border-width: 0 3.5px 3.5px 0; border-color: #000; border-width: 0 3.5px 3.5px 0; border-color: #000; background-color: green; font-size: 25px; font-weight: bold;">ENTER</button>
					</td>
				</tr>
				<tr>
					<td><button id="button0" onclick="btnClick(0)">
							<img src="img/0.png" class="noBtnImg" />
						</button></td>
					<td><button id="button00" onclick="btnClick('00')">
							<img src="img/00.png" class="noBtnImg" />
						</button></td>
					<td><button id="notKnow">
							<img src="img/blank.png" class="noBtnImg" />
						</button></td>
					<td><button id="blank">
							<img src="img/blank.png" class="noBtnImg" />
						</button></td>
				</tr>
			</table>
		</center>
	</div>
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script>
		console.log("ho rhi h");
		var welPanel = document.querySelector(".welcomePanel");
		var otpPanel = document.querySelector(".otpPanel");
		var biometricPanel = document.querySelector(".biometricPanel");
		var menuPanel = document.querySelector(".menuPanel");
		var balancePanel = document.querySelector(".balancePanel");
		var withdrawPanel = document.querySelector(".withdrawPanel");
		////yhan onload vali jquery dalni hai 

		otpPanel.style.display = "none";

		welPanel.style.display = "block";

		var submitClicked = false;
		function wlcmToOTP() {
			otpPanel.style.display = "block";
			welPanel.style.display = "none";
			submitClicked = true;
		}
		function menuToBalancePanel() {
			balancePanel.style.display = "block";
			menuPanel.style.display = "none";
		}
		function balanceToMenu() {
			balancePanel.style.display = "none";
			menuPanel.style.display = "block";
		}
		function exitToWelPanel() {
			menuPanel.style.display = "none";
			welPanel.style.display = "block";
		}
		function otpToBiometric() {
			otpPanel.style.display = "none";
			biometricPanel.style.display = "block";
		}
		function biometricToMenu() {
			menuPanel.style.display = "block";
			biometricPanel.style.display = "none";
		}
		function menuToWithdrawPanel() {
			menuPanel.style.display = "none";
			withdrawPanel.style.display = "block";
		}
		function withdrawPanelToMenu() {
			menuPanel.style.display = "block";
			withdrawPanel.style.display = "none";
		}
		
		function fn(current, next) {
			var len = current.value.length;
			var mx = current.getAttribute("maxlength");
			if (len == mx) {
				document.getElementById(next).focus();
			}
		}
		console.log("khtm");

		//*************************button pe input set krne wala code*****************************************
		var currentNum = $('#AccNo').val();
		function btnClick(currentBtn) {
			currentNum += currentBtn;
			//	if(!submitClicked){
			$('#AccNo').val(currentNum);
			//	}else{
			//		$("input").keyup(function () {
			//			console.log(submitClicked)
			//			var index = $(this).index("input");
			//			$("input").val(currentBtn);
			//			$("input").eq(index + 1).focus(); 
			//		});
			//	}

		}

		//*************************button pe input set krne wala khtm*****************************************

			/* console.log(s); */
				<%
	if(s.equals("logout")){
		%>
		swal("Logout SuccessFull","","success");
	
		<%
	}
	%>
	
	
	
	<%
	if(s.equals("failedOtp")){
		%>
		swal("Oops!","Please Enter correct otp","error");
	
		<%
	}
	%>
	
	<%
	if(s.equals("2")){
		%>
		swal("Please Contact Your Brance Immeediately","Your Account Blocked","error");
		<%
	}
	%>
	
	<%
	if(s.equals("faceAuthFailed")){
		%>
		swal("Error!","Unauthorized User !Contact Your Branch","error");
	
		<%
	}
	%>
	
	<%
	if(s.equals("failedOtp")){
		%>
		swal("Wrong Otp","You Have Last One Chance","error");
		wlcmToOTP();
		<%
			}else{
				%>
			
		$(document).ready(function() {
			$('#accVerify').click(function(event) {
				var accNum = $('#AccNo').val();
					if (accNum == "") {
						swal(
								"Oops!",
								"Enter Account Number",
								"error");
					} else {
							$("body").css("filter","blur(8px)");
							$.get('validityOfAccount',{
								accNo : accNum
								},function(data,status) {
									$("body").removeAttr("style");
										if (data === "404") {
											swal(
													"Oops!",
													"Please Enter valid Acount Number!",
													"error");
										} else if(data == "kycKra"){
											swal(
													"Oops!",
													"Please Complete your kyc First!",
													"warning");
										}
										
										else if(data == "AccountBlock"){
											
											swal("Please Contact Your Brance Immeediately","Your Account has been Blocked too Many wrong attepts","error");
										}
										
										else {
											$("body").removeAttr("style");
											swal(
													"Great!",
													"Otp is send successfully to your phone",
													"success");
											wlcmToOTP();
											}
										});
									}

								});
						});
		<%
			}
			%>
	</script>


</body>
</html>