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
    <div id="irisPage">
        <ul>
            <li>&#10003</li>
            <li>&#10003</li>
            <li>&#10003</li>
            <li class="active">&#10003</li>
            <li>5</li>
            <a href="Ragister"><button id="reviewPageNextBtn" class="backnext">submit</button></a>
            <a href="fingure.jsp"><button id="irisPageBackBtn" class="backnext">Back</button></a>
        </ul>
        <div class="col">
            <div class="photo">
                <header>
                    <i class="fas fa-camera-retro"></i>
                    <span>Left Iris</span>
                    <i class="fas fa-trash"></i>
                </header>
                <div style="height:30vh;"></div>
                <footer>
                    <label>Score: </label>
                    <div class="progressBorder">
                        <div class="progress" style="width:60%;background-color: red;height:inherit;"></div>
                    </div>
                </footer>
            </div>
            <div class="photo">
                <header>
                    <i class="fas fa-camera-retro"></i>
                    <span>Right Iris</span>
                    <i class="fas fa-trash"></i>
                </header>
                <div style="height:30vh;"></div>
                <footer>
                    <label>Score: </label>
                    <div class="progressBorder">
                        <div class="progress" style="width:60%;background-color: red;height:inherit;"></div>
                    </div>
                </footer>
            </div>
        </div>
    </div>

</body>
</html>