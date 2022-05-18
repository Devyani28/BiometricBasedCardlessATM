<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
       <meta name="viewport" content="width=device-width,initial-scale=1">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="shortcut icon" href="img/bank.png" type="image/x-icon">
       
        <style>
            body{
                background-color:#e8e8e8;
                font-family: times new roman;
                font-size: 13px;
            }
            header{
                background-color: #9E1C40;
                height:15vh;
                width:100%;
                margin:0;
                padding:0;
                display:flex;
                justify-content: center;
                align-items: center;
            }
            /*.headerLogo{
                height: 14vh;
                width:10%;
            }*/
            h1{
                margin-left:25px;
                color:#EEB205;
            }
            .maindiv{
                margin:10px auto;
                height:70vh;
                width:70%;
                padding-left:15px;
                background-color:#fff;
                border:outset;
                }
            button{
                background-color:#9E1C40; 
                color:#fff;
                border: none;
                border-radius: 5px;
                margin:5px;
                padding:5px;
                width:auto;
            }
            ul li::before{
                color:#9E1C40;
                content:"\2022";
                font-weight: bold;
                display:inline-block;
                position: relative;
                
            }
            
        </style>
    </head>
    <body>
        <header class="header">
            <i class="fa fa-bank" style="font-size:75px;color:#EEB205;"></i>
            <h1>BANK OF INDIA</h1>
        </header>
        <div class="maindiv">
            <h2 style="color:#9E1C40;font-family: arial;">Consent Form</h2>
            <ul style="list-style:none;">
                <li> I wish to open Saving Account with Punjab National bank and i authorize the Bank to open my account through Video KYC process.</li>
                <li> I understand that account opening through this channel is intended for individual account only.</li>
                <li> I confirm that I am resident of India and above 18 years of age.</li>
                <li> I am neither a politically exposed person nor related to politically exposed person.</li>
                <li> My country of Tax residence is India and not any other country.</li>
                <li> I am not an existing customer of Bank.</li>
                <li> I do not maintain a Basic Saving Bank Deposite Account(BSBDA) with any other Bank/Branch.</li>
                <li> I have my Aadhar,PAN and other details as required by selected product category.</li>
            </ul>
            <form action="verification.jsp">
            <input type="checkbox" required> <label>I Agree</label><br>
            <button>PROCEED</button>
            </form>
        </div>
<script>
$(document).ready(function(){
  $("button").click(function(){
	  var chk = $('input[type="checkbox"]');
	  if(chk.prop("checked") == false){
      	swal("Oops!", "Please check the checkbox!", "warning");
      }
  });
});
</script>
    </body>
</html>