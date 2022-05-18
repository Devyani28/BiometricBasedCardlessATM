<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<link rel="shortcut icon" href="img/atms.jpg" type="image/x-icon">
</head>

<body>
	<div id="mainPanel">
		<div style="width: 6.5vw;">
			<button
				style="height: 50%; width: 100%; font-weight: bold; font-size: 4vw; border: 4px outset lightgrey;">
				>></button>
			<button
				style="height: 50%; width: 100%; font-weight: bold; font-size: 4vw; border: 4px outset lightgrey;">>></button>
		</div>

		<div class="menuPanel"
			style="height: inherit; width: 80%; background-image: url(img/bg.jpg); background-size: cover; text-align: center; color: #fff;">
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
						/* Connection con = new JdbcConnection().getConnection(); */

						String sql = "SELECT * FROM `afterkyc` WHERE AccountNum=" + "'" + a + "'";

						PreparedStatement ps = con.prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						if (rs.next() == false)
							out.println(sql);
						else {

							System.out.println(rs.getString(9));
			%>
			<h1 style="text-align: center;">
				WELCOME
				<%=rs.getString("AccountHolder").toUpperCase()%></h1>


			<div class="transactionStatusPanel">

				<div class="optionPanel">
					<button onclick="menuToBalancePanel()">BALANCE</button>
					<button onclick="menuToWithdrawPanel()">WITHDRAW</button>
				</div>
				<div class="optionPanel">
					<form action="logout" method="post">
						<button type="submit">EXIT</button>
					</form>
					<button onclick="menuToCreditPanel()">DEPOSIT</button>
				</div>
			</div>


		</div>


		<div class="balancePanel"
			style="height: inherit; width: 90%; background-image: url(img/bg.jpg); background-size: cover; color: #fff">
			<br>
			<h2 style="margin: 2vw;">
				Your Balance is <span> <%=rs.getString("Balance")%></span>
			</h2>
			<button
				style="background: transparent; color: #fff; margin: 7vw 2vw 2vw 2vw; font-size: 2vw; cursor: pointer; font-size: 2vw; text-align: right; padding-right: 4px;"
				onclick="balanceToMenu()">BACK</button>
		</div>
		
		<div class="withdrawPanel"
			style="height: inherit; width: 90%; background-image: url(img/bg.jpg); background-size: cover; color: #fff;text-align: center;">
			<br>
			<h1>Enter Amount To Withdraw</h1>
			<form action="balanceWithdraw" method="post" id="withdrawForm">
				<div class="inputWithdraw">
					<input length="12" class="input" onkeyup="checkbal(this.value)"
						id="balInput" name="balInput"
						style="width: 15vw; margin-left: 2vw;text-align: center;">
				</div>
			</form>
				<div class="withdrawSection"
					style="display: flex; justify-content: space-between;">
					<button type="submit" class="submitBalance" form="withdrawForm"
						style="background: transparent; color: #fff; margin: 4vw 2vw 2vw 2vw; font-size: 2vw; cursor: pointer; font-size: 2vw; text-align: right; padding-right: 4px;">SUBMIT</button>
					<button
						style="background: transparent; color: #fff; margin: 4vw 2vw 2vw 2vw; font-size: 2vw; cursor: pointer; font-size: 2vw; text-align: right; padding-right: 4px;"
						onclick="withdrawPanelToMenu()">BACK</button>

				</div>
		</div>

		<div class="creditPanel"
			style="height: inherit; width: 90%; background-image: url(img/bg.jpg); background-size: cover; color: #fff;text-align: center;"">
			<br>
			<h1>Enter Amount To Deposit</h1>
			<form action="balanceCredit" method="post" id="depositedrawForm">
				<div class="inputDeposite">
				<input length="12" class="input" id="balInput" name="balInput"
					style="width: 15vw; margin-left: 2vw;text-align: center;">
				</div>
			</form>
			<div class="depositeSection"
					style="display: flex; justify-content: space-between;">
				<button type="submit" form="depositedrawForm" class="submitBalance" style="background: transparent; color: #fff; margin: 4vw 2vw 2vw 2vw; font-size: 2vw; cursor: pointer; font-size: 2vw; text-align: right; padding-right: 4px;">SUBMIT</button>
				<button style="background: transparent; color: #fff; margin: 4vw 2vw 2vw 2vw; font-size: 2vw; cursor: pointer; font-size: 2vw; text-align: right; padding-right: 4px;" onclick="creditPanelToMenu()">BACK</button>
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
					<td><button id="button1">
							<img src="img/1.png" class="noBtnImg" />
						</button></td>
					<td><button id="button1">
							<img src="img/2.png" class="noBtnImg" />
						</button></td>
					<td><button id="button1">
							<img src="img/3.png" class="noBtnImg" />
						</button></td>
					<!-- <td><button id="button1"><img src="img/2.png" class="noBtnImg"/></button></td> -->
					<td><button id="cancel"
							style="height: 9vh; width: 15vw; border-width: 0 3.5px 3.5px 0; border-color: #000; background-color: red; font-size: 25px; font-weight: bold;">CANCEL</button>
					</td>
				</tr>
				<tr>
					<td><button id="button4">
							<img src="img/4.png" class="noBtnImg" />
						</button></td>
					<td><button id="button5">
							<img src="img/5.png" class="noBtnImg" />
						</button></td>
					<td><button id="button6">
							<img src="img/6.png" class="noBtnImg" />
						</button></td>
					<td><button id="clear"
							style="height: 9vh; width: 15vw; border-width: 0 3.5px 3.5px 0; border-color: #000; background-color: yellow; font-size: 25px; font-weight: bold;">CLEAR</button>
					</td>
				</tr>
				<tr>
					<td><button id="button7">
							<img src="img/7.png" class="noBtnImg" />
						</button></td>
					<td><button id="button8">
							<img src="img/8.png" class="noBtnImg" />
						</button></td>
					<td><button id="button9">
							<img src="img/9.png" class="noBtnImg" />
						</button></td>
					<td><button id="enter"
							style="height: 9vh; width: 15vw; border-width: 0 3.5px 3.5px 0; border-color: #000; border-width: 0 3.5px 3.5px 0; border-color: #000; background-color: green; font-size: 25px; font-weight: bold;">ENTER</button>
					</td>
				</tr>
				<tr>
					<td><button id="button0">
							<img src="img/0.png" class="noBtnImg" />
						</button></td>
					<td><button id="button00">
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

    var menuPanel=document.querySelector(".menuPanel");
    var balancePanel=document.querySelector(".balancePanel");
    var withdrawPanel=document.querySelector(".withdrawPanel");
    var creditPanel=document.querySelector(".creditPanel");
    ////yhan onload vali jquery dalni hai 
    const button = document. querySelector('.submitBalance')


    withdrawPanel.style.display="none";
    menuPanel.style.display="block";
    creditPanel.style.display="none";
    balancePanel.style.display="none";
   
    function checkbal(){
    	
    	var inputBal=document.querySelector(".input").value;
    	<%String bal = rs.getString("balance");%>
    	if(<%=bal%>>inputBal){
		button.disabled = false;
    	}else{
		button.disabled = true;  		
    	}
    	
    }
    
    function wlcmToOTP(){
        otpPanel.style.display="block";
        welPanel.style.display="none";
    }
    function menuToBalancePanel(){
        balancePanel.style.display="block";
        swal("Hello <%=rs.getString("AccountHolder").toUpperCase()%>","Your Current Balance is <%=rs.getString("Balance")%>")
        menuPanel.style.display="none";
    }
    function balanceToMenu(){
        balancePanel.style.display="none";
        menuPanel.style.display="block";
    }
    <%-- function exitToWelPanel(){
        // destroy the sassion and open the first page
        <%
        System.out.print("session destroyed already");
        session.invalidate();
        
        %>
        window.location.replace("/ATMProject/");
        
        
    } --%>
    function otpToBiometric(){
        otpPanel.style.display="none";
        biometricPanel.style.display="block";
    }
    function biometricToMenu(){
        menuPanel.style.display="block";
        biometricPanel.style.display="none";
    }
    function menuToWithdrawPanel(){
        menuPanel.style.display="none";
        withdrawPanel.style.display="block";
    }
    function withdrawPanelToMenu(){
        menuPanel.style.display="block";
        withdrawPanel.style.display="none";
    }
    function menuToCreditPanel(){
        menuPanel.style.display="none";
        creditPanel.style.display="block";
    }
    function creditPanelToMenu(){
        menuPanel.style.display="block";
        creditPanel.style.display="none";
    }
    
    
    function fn(current, next) {
        var len = current.value.length;
        var mx = current.getAttribute("maxlength");
        if (len == mx) {
            document.getElementById(next).focus();
        }
    }
        <%}
				} catch (Exception e) {
					e.printStackTrace();
				}

			}%>

    
			
</script>
</body>
</html>