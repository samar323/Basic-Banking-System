<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel='stylesheet' href='css/index.css'>
<meta charset="ISO-8859-1">
<title>Basic Bank App</title>
</head>
<body>
	<%@include file='NavBar.jsp'%>
	<div class='home'>
		<div id='site'>
			<h1>Basic Bank App</h1>
		</div>
		<div id='homeBtn'>
			<a class='btn btn-outline-danger' href='Customer.jsp'><strong>GetStarted</strong></a>
		</div>
	</div>



	<!-- Optional JavaScript; choose one of the two! -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>