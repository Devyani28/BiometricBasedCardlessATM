<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/a7926a9838.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="img/bank.png" type="image/x-icon">
    <style>
        body {
            background-color: #e8e8e8;
            font-family: arial;
            font-size: 10px;
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

        /*.headerLogo{
                height: 14vh;
                width:10%;
            }*/
        h1 {
            margin-left: 25px;
            color: #EEB205;
        }

        div {
            margin: 10px auto;
            height: 75vh;
            width: 70%;
            padding-left: 15px;
            background-color: #fff;
            border: outset;
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
            border-right-style: hidden;
            border-top-style: hidden;
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
    <header class="header">
        <!--<img src="clr.jpg" class="headerLogo">-->
        <!--<i class="fas fa-piggy-bank" style="font-size:75px;color:#EEB205;"></i>-->
        <i class="fa fa-bank" style="font-size:75px;color:#EEB205;"></i>
        <h1>BANK OF INDIA</h1>
    </header>
    <div>
        <h2 style="color:#9E1C40;font-family: arial;">Welcome</h2>
        <span
            style="color:#fff;background-color: rgb(0, 255, 98);border-radius: 50%;font-weight: bold;font-size: 12px;border:none;">&#10003</span>
        <!-- Your account has been successfully updated. Below are your Aadhaar detail. <br> -->
        <hr><br>

        <form action="exit" method="post" style="color:rgb(111, 122, 122)">
            <label style="font-weight: bold;color:#000;">DETAILS</label>
            
<h1>Your KYC status <br><%=request.getParameter("kycStatus") %></h1>
            <br>
          
            <input type="submit" value="EXIT" style="background-color:#9E1C40;color:#fff;border: none;border-radius: 5px;margin:5px;padding:5px;width:auto;">
        </form>
        
    </div>
</body>

</html>
