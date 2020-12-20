<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background: url(img/banking.jpeg);
	background-repeat: no-repeat;
	background-size: cover;
}
.mainBtn {
    height: fit-content;
    width: fit-content;
    margin: auto;
    margin-top: 10%;
}

div#headText {
	margin-top: 20%;
}
</style>
<link rel='stylesheet' href='css/style.css'>
<meta charset="ISO-8859-1">
<title>Banking App</title>
</head>
<body>
	<%@include file='NavBar.jsp'%>
	<%
		DAO dao = new DAO();
		ArrayList<HashMap> allCustomers = dao.getAllCustomer();
	%>
	<div class="heading">
		<div id='headText'>
			<h1>Transfer Money</h1>
		</div>
		<%
			String m = (String) session.getAttribute("message");
			if (m != null) {
		%>
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">
			<strong><%=m%></strong>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
			session.setAttribute("message", null);
			}
		%>
		<div class='mainBtn'>
			<p>
				<button class="btn btn-danger" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseExample"
					aria-expanded="false" aria-controls="collapseExample">
					Transfer Money</button>
			</p>
		</div>
	</div>
	<div class="collapse" id="collapseExample">
		<div class="container-form">
			<form action="TransferMoney" method="post">
				Sender's Email: <select class="form-select"
					aria-label="Default select example" name='semail'>
					<%
						for (HashMap customer : allCustomers) {
					%>
					<option><%=customer.get("email")%></option>
					<%
						}
					%>
				</select> <br> Receiver's Email: <select class="form-select"
					aria-label="Default select example" name='remail'>
					<%
						for (HashMap customer : allCustomers) {
					%>
					<option><%=customer.get("email")%></option>
					<%
						}
					%>
				</select> <br>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">Amount</label>
					<input type="number" class="form-control"
						id="exampleFormControlInput1" name='amount' required />
				</div>
				<br>
				<div class="d-grid gap-2 col-6 mx-auto">
					<button class="btn btn-primary btn-lg" type="submit">Transfer</button>
				</div>
			</form>
		</div>
	</div>
	<div class='container'>
		<h2>Customer details:</h2>
		<table class="table table-dark table-striped">
			<thead>
				<tr>
					<th scope="col">S.No.</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Account Balance</th>
				</tr>
			</thead>
			<tbody>
				<%
					int c = 1;
					for (HashMap customer : allCustomers) {
				%>
				<tr>
					<th scope="row"><%=c++%></th>
					<td><%=customer.get("name")%></td>
					<td><%=customer.get("email")%></td>
					<td><%=customer.get("ac_balance")%></td>
				</tr>


				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>