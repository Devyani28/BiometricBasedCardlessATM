<%@ page language="java"
			contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AJAX calls using Jquery in Servlet</title>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		console.log($);
		$('#submit').click(function(event) {
			var username = $('#user').val().concat($('#userName').val());
			$.get('ActionServlet', {
				user : username
			}, function(data,status) {
				alert(data);
				
			});
		});
	});
</script>
</head>
<body>
	<form id="form1">
		<h1>AJAX Demo using Jquery in JSP and Servlet</h1>
		Enter your Name: <input type="text" id="user" /><br>
		<input type="text" id="userName" />
		 
		<input type="button" id="submit" value="Ajax Submit" /> <br />
		<div id="welcometext"></div>
	</form>
</body>
		</html>
