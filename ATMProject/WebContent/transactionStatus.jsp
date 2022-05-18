<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<link rel="shortcut icon" href="img/atms.jpg" type="image/x-icon">
</head>

<body>


    <div id="mainPanel">
        <div style="width:6.5vw;">
            <button
                style="height:50%;width:100%;font-weight: bold;font-size: 4vw;border:4px outset lightgrey;"> >> </button>
            <button
                style="height:50%;width:100%;font-weight: bold;font-size: 4vw;border:4px outset lightgrey;">>></button>
        </div>

        <div class="menuPanel" style="height:inherit;width:80%;background-image: url(img/bg.jpg);background-size: cover;text-align: center;color:#fff;">
			<%
			response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
			if (session.getAttribute("userAccountNum") == null)
				response.sendRedirect("/ATMProject/index.jsp");
			else{
			
			String a = session.getAttribute("userAccountNum").toString();
					try {
					
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankdata", "root", "");
						/* Connection con = new JdbcConnection().getConnection(); */

						String sql = "SELECT * FROM `afterkyc` WHERE AccountNum=" + "'" + a + "'";

						PreparedStatement ps = con.prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						if (rs.next() == false)
							out.println(sql);
						else {

							System.out.println(rs.getString(9));
							
							
				%>
           <h1 style="text-align: center;">Hello <%=rs.getString("AccountHolder").toUpperCase() %></h1>
           
        <div class="transactionStatusPanel">
                   <h1>Your Current Balance is <%=rs.getString("balance")%></h1>
                   <!-- <div class="optionPanel">
					<form action="logout" method="post">
						<button id="exitBtn" type="submit">EXIT</button>
					</form>
					<button id="menuBtn">GO TO MENU</button>
				</div> -->
                   <div class="optionPanel">
                   <form action="logout" method="post">
						<button id="exitBtn" type="submit">EXIT</button>
					</form>
                   <button id="menuBtn">GO TO MENU</button>
                   
                   </div>
        
        </div>
        
        
        
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
                    <td><button id="cancel"
                            style="height:9vh;width:15vw;border-width:0 3.5px 3.5px 0;border-color:#000; background-color: red;font-size: 25px;font-weight: bold;">CANCEL</button>
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

$("#menuBtn").click(function(){
	
	window.location.replace("/ATMProject/mainMenu.jsp");
});

$("#exitBtn").click(function(){
	
	window.location.replace("/ATMProject/index.jsp");
});
<%
if(request.getParameter("transactionStatus").equals("success")){
	%>
	
	swal("Thank You","YOur Transaction successfull","success");
	<%
}else{
	%>
	swal("Oops","Try Again Later","error");

        <%
}
					}
					} catch (Exception e) {
						e.printStackTrace();
					}
			}
				%>

    
</script>
</body>
</html>