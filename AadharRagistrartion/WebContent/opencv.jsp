<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Aadhaar Registration</title>
    <link rel="shortcut icon" href="img/aadhaar.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/a7926a9838.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
</head>
    <body>
    <header class="header" style="height:fit-content;">
        <img src="img/aadhaar.png" class="headerLogo">
        <h1>Unique Identification Authority of India<br>Goverment of India</h1>
        <img src="img/ashok.png" class="headerLogo">
    </header>

	<div id="photoClickPage">
        <ul>
            <li>&#10003</li>
            <li class="active">&#10003</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
            <button type="submit" value="Submit" form="FaceForm" id="photoClickPageNextBtn" class="backnext">Next</button>
            <button id="photoClickPageBackBtn" class="backnext">Back</button>
        </ul>
    </div>
    <div class="opencvFrame" style="width:500px;margin:auto;border:2px solid blue;">
		<div style="display: flex;
	    align-items: center;
	    justify-content: space-around;
	    border: 2px solid red;
	    background-image: linear-gradient(#fff 50%, #87ceeb);">
			<i class="fas fa-trash" onclick="retake()"></i>
			<h3>Face Capture</h3>
		<i class="fas fa-camera-retro" onclick="snap()"></i>
		</div>
		<div>
			<video id="video" width="300" height="300" autoplay style="margin: auto;
    		display: flex;margin-top: -5vh;"></video><br>
			<canvas style="display:none;" id="preview" width="300" height="250"></canvas>
			
			<form id="FaceForm" method="post" action="NewServlet"> 
			<input type="hidden" name="ImageData" id="ImageData" />
			<%
			String Name = request.getParameter("name");
			System.out.println(Name);
			request.setAttribute("ImageName", String.valueOf(Name)); %>
			</form>
		</div>
</div>

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
canvas.width = 300;
canvas.height = 250;

var snap = function()  {
	document.getElementById("video").style.display="none";
	document.getElementById("preview").style.display="flex";
	document.getElementById("preview").style.margin="auto";
	document.getElementById("preview").style.padding="0 0 3vh 0";
  canvas.getContext('2d').drawImage(video, 0, 0, 300, 250);
  preview.getContext('2d').drawImage(canvas, 0, 0, 300, 250);
document.getElementById('ImageData').value = canvas.toDataURL("image/png");


};
    
    </script>
    
    </body>
</html>
