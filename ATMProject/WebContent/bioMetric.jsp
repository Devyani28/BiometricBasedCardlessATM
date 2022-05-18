<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/a7926a9838.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="img/atms.jpg" type="image/x-icon">
    <style>
    
        #mainPanel {
            float: left;
            height: 40vh;
            border: 5px outset lightgrey;
            width: 66%;
            padding: 1%;
            display: flex;
            align-items: center;
        }

        #panelImg {
            /* main panel */
            height: inherit;
            width: 100%;
            opacity: 0.7;
        }

        #rightPanel {
            float: right;
            height: 96vh;
            border-width: 0 0 4px 4px;
            border: 4px inset lightgrey;
            width: 29%;
        }

        #atmImg {
            height: inherit;
            width: 100%;
        }

        button:active {
            background-color: lightgrey;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }

        #buttonPanel {
            /* box */
            float: left;
            margin-top: 5px;
            height: 51vh;
            border: 5px outset lightgrey;
            width: 68%;
        }

        #buttonTable {
            height: inherit;
            width: inherit;
            margin-top: 2vh;
        }

        td button {
            /* height: 6vh;
            width:16vw; */
            height: fit-content;
            width: fit-content;
            padding: 5px;
            margin: 2.5px;
            text-align: center;
            border: 4px outset lightgrey;
        }

        .noBtnImg {
            height: 8vh;
            width: 14vw;
        }

        .input {
            background: transparent;
            height: 5vh;
            border: 2px inset #fff;
            color: #fff;
            font-size: 2vw;
        }
        .biometricTable{
           /*  border: 3px solid red;  */
            color:#fff;
            margin:auto ;
            transform:translateY(8%);
            text-align: center;
            margin-top:0;
            padding-top: 0;
        }
        

    </style>

</head>

<body>

    <div id="mainPanel">
        <div style="width:6.5vw;">
            <button
                style="height:50%;width:100%;font-weight: bold;font-size: 4vw;border:4px outset lightgrey;"> >> </button>
            <button
                style="height:50%;width:100%;font-weight: bold;font-size: 4vw;border:4px outset lightgrey;">>></button>
        </div>

          <div class="biometricPanel" style="height:inherit;width:80%;background-image: url(img/bg.jpg);background-size: cover;text-align: center;color:#fff;">
            <h2 style="text-align: center;margin-bottom: 1px;font-size:2vw;">Biometric Authentication</h2>
            <table class="biometricTable">
                <tr>
                    <td style="padding: 0 10vw 0 0;border:2px solid blue;">
                    <!-- <video id="videoInput" width="110vw" height="125vh" style="border:2px solid #fff;" muted autoplay> -->
                    <video id="video" width="300vw" height="100vh" style="border:2px solid #fff;margin: 0 0 0 20vh;" autoplay>
			<canvas id="preview" width="300" height="100"></canvas>
			
			<form id="FaceForm" method="post" action="NewServlet"> 
			<input type="hidden" name="ImageData" id="ImageData" />
			
			</form>
                    </td>
                    <!-- <td><video " width="110vw" height="125vh" style="border:2px solid #fff;" muted autoplay></td> -->
                </tr>
                <tr>
                    <td style="width:25vw;border:2px solid hotpink;">
	                    <i class="fas fa-trash" style="padding:1px;" onclick="retake();"></i>
	                    Face Captures
	                    <i class="fas fa-camera-retro" onclick="snap();"></i>
                    </td>
                    <!-- <td><i class="fas fa-trash" style="padding:1px;" onclick="retake()"></i>Thumb Impression<i class="fas fa-camera-retro" style="padding:1px;" onclick="snap()"></i></td> -->
                </tr>
            </table>
            <p style="margin:2vw;font-size: 2vw;float:left;" onclick="biometricToMenu()"> SUBMIT</p>
        </div> 


       


    

        <div>
            <button style="text-align: center;height:50%;width:100%;font-weight: bold;font-size: 4vw;border:4px outset lightgrey;">
                <<</button><br>
                    <button style="height:50%;width:100%;font-weight: bold;font-size: 4vw;border:4px outset lightgrey;">
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
                    <td><button id="button1"><img src="img/1.png" class="noBtnImg" /></button></td>
                    <td><button id="button1"><img src="img/2.png" class="noBtnImg" /></button></td>
                    <td><button id="button1"><img src="img/3.png" class="noBtnImg" /></button></td>
                    <!-- <td><button id="button1"><img src="img/2.png" class="noBtnImg"/></button></td> -->
                    <td><button id="cancel" style="height:9vh;width:15vw;border-width:0 3.5px 3.5px 0;border-color:#000; background-color: red;font-size: 25px;font-weight: bold;">CANCEL</button>
                    </td>
                </tr>
                <tr>
                    <td><button id="button4"><img src="img/4.png" class="noBtnImg" /></button></td>
                    <td><button id="button5"><img src="img/5.png" class="noBtnImg" /></button></td>
                    <td><button id="button6"><img src="img/6.png" class="noBtnImg" /></button></td>
                    <td><button id="clear"
                            style="height:9vh;width:15vw;border-width:0 3.5px 3.5px 0;border-color:#000;background-color: yellow;font-size: 25px;font-weight: bold;">CLEAR</button>
                    </td>
                </tr>
                <tr>
                    <td><button id="button7"><img src="img/7.png" class="noBtnImg" /></button></td>
                    <td><button id="button8"><img src="img/8.png" class="noBtnImg" /></button></td>
                    <td><button id="button9"><img src="img/9.png" class="noBtnImg" /></button></td>
                    <td><button id="enter"
                            style="height:9vh;width:15vw;border-width:0 3.5px 3.5px 0;border-color:#000;border-width:0 3.5px 3.5px 0;border-color:#000;background-color: green;font-size: 25px;font-weight: bold;">ENTER</button>
                    </td>
                </tr>
                <tr>
                    <td><button id="button0"><img src="img/0.png" class="noBtnImg" /></button></td>
                    <td><button id="button00"><img src="img/00.png" class="noBtnImg" /></button></td>
                    <td><button id="notKnow"><img src="img/blank.png" class="noBtnImg" /></button></td>
                    <td><button id="blank"><img src="img/blank.png" class="noBtnImg" /></button></td>
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
canvas.width = 300;
canvas.height = 100;

var snap = function()  {
	console.log("snap fun call hua");
	document.getElementById("video").style.display="none";
	document.getElementById("preview").style.display="block";
	/* document.getElementById("preview").style.margin="auto";
	document.getElementById("preview").style.padding="0 0 3vh 0"; */
  canvas.getContext('2d').drawImage(video, 0, 0, 250, 100);
  preview.getContext('2d').drawImage(canvas, 0, 0, 250, 100);
document.getElementById('ImageData').value = canvas.toDataURL("image/png");
console.log("snap fun call hua");


};

</script>
</body>
</html>