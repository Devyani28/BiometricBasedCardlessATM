<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Aadhaar Registration</title>
    <link rel="shortcut icon" href="img/aadhaar.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/a7926a9838.js" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<link rel="shortcut icon" href="img/atms.jpg" type="image/x-icon">
    
</head>
    <body>
<%
				response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				if (session.getAttribute("userAccountNum") == null)
					response.sendRedirect("/ATMProject/index.jsp");
				else {
					String a = session.getAttribute("userAccountNum").toString();
					try {
						String name = request.getParameter("name");
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankdata", "root", "");
						
						String sql = "SELECT * FROM `afterkyc` WHERE AccountNum=" + "'" + a + "'";

						PreparedStatement ps = con.prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						if (rs.next() == false)
							out.println(sql);
						else {

							System.out.println(rs.getString(9));
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
			style="height: inherit;
    width: 90%;
    background-image: url(img/bg.jpg);
    background-size: cover;
    display: flex;
    text-align: center;
    color: #fff;
    flex-direction: column-reverse;
">
    
    <div class="otpSubmitBtnSection"
				style="width: fit-content;">
				
	<button style="background: transparent; color: #fff; font-size: 2vw; text-align: left; width: fit-content;" style="margin-left:2%;" type="submit" value="Submit" form="FaceForm" id="photoClickPageNextBtn" class="backnext">SUBMIT</button>
			</div>
			<div class="opencvFrame" style="width:fit-content;border:5px solid #24C2C3;margin:auto;height:300px;">
	<div style="display: flex;
	    align-items: center;
	    justify-content: space-around;
	    background-image: linear-gradient(white 30%,70%, grey);">
			<i class="fas fa-trash" style="color:red;" onclick="retake()"></i>
			<h3>Face Capture</h3>
		<i class="fas fa-camera-retro" style="color:green;" onclick="snap()"></i>
	</div>
		<div style="display: flex;">
			<video id="video" width="200" height="150" autoplay style="margin: auto;"></video><br>
			<canvas style="display:none;" id="preview" width="200" height="150"></canvas>
			<form id="FaceForm" method="post" action="faceAuth"> 
				<input type="hidden" name="ImageData" id="ImageData"/>
			</form>
		</div>
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

var start =
navigator.mediaDevices.getUserMedia({video: true})

.then(function(stream){ 
	video.srcObject = stream
});

function retake(){
	console.log("retake called");
	document.getElementById("preview").style.display="none";
	document.getElementById("video").style.display="flex";
}
var canvas = document.createElement("canvas");
canvas.width = 200;
canvas.height = 150;

var snap = function()  {
	document.getElementById("video").style.display="none";
	document.getElementById("preview").style.display="flex";
	document.getElementById("preview").style.margin="auto";
  canvas.getContext('2d').drawImage(video, 0, 0, 200, 150);
  preview.getContext('2d').drawImage(canvas, 0, 0, 200, 150);
document.getElementById('ImageData').value = canvas.toDataURL("image/png");


};
    
    </script>
 <%}
				} catch (Exception e) {
					e.printStackTrace();
				}

			}%>
    
    </body>
</html>
