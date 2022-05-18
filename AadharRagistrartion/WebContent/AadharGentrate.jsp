<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>

<html>

<head>
<title>Aadhaar Registration</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="shortcut icon" href="img/aadhaar.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/a7926a9838.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<header class="header" style="height: fit-content;">
		<img src="img/aadhaar.png" class="headerLogo">
		<h1>
			Unique Identification Authority of India<br>Goverment of India
		</h1>
		<img src="img/ashok.png" class="headerLogo">
	</header>

	<div>
		<ul>
			<li>&#10003</li>
			<li>&#10003</li>
			<li>&#10003</li>
			<li>&#10003</li>
			<li class="active">&#10003</li>
			<button id="reviewPageNextBtn" type="submit" form="myForm"
				class="backnext">
				<a href="index.jsp">Exit</a>
			</button>
			<button id="reviewPageBackBtn" class="backnext">Back</button>
		</ul>
		<div class="aadharCard">
			<header>
				<img src="img/ashok.png"
					style="height: 5vh; width: 10%; margin: auto 1vw;">
				<div class="aadharMiddleMsg">
					<span style="background-color: orangered; width: 15vw;">Bharat
						sarkar</span><br> <span style="background-color: green;">Goverment
						of India</span>
				</div>
				<img src="img/aadhaar.png"
					style="height: 5vh; width: 10%; margin: auto 1vw;">
			</header>
			<div class="userAadharInfo">
				
				<%
					try {
						String name = request.getParameter("name");
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aadhardata", "root", "");
						/* Connection con = new JdbcConnection().getConnection(); */

						String sql = "SELECT * FROM `useraadhardata` WHERE Name=" + "'" + name + "'";

						PreparedStatement ps = con.prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						if (rs.next() == false)
							out.println(sql);
						else {

							System.out.println(rs.getString(9));
							String path = rs.getString("PhotoPath");
							/* System.out.println(pageContext.request.contextPath); */
				%>
				<div>
					<img src="http://localhost:7618/img/<%=path %>" style="border: 2px solid #000; height: 18vh; width: 8vw; margin: 10px;">

					<p style="margin-top: 5vh;">
						Name: <span> <%=rs.getString("Name")%></span><br> DOB: <span><%=rs.getString("DOB")%></span><br>
						Gender:<span> <%=rs.getString("Gender")%>
						</span>
					</p>
				</div>
				<span style="font-weight: bold;"><%=rs.getString("AadharNum")%></span>
				<%
					}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>

			</div>
			<footer>
				<label>AADHAAR : Aam Aadmi Ka Adhikar </label>
			</footer>
		</div>


	</div>


</body>
</html>