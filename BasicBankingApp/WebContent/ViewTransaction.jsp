<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
	body{
	background: url(img/banking.jpeg);
	background-repeat: no-repeat;
    background-size: cover;
}

.headText {
    height: fit-content;
    width: fit-content;
    margin: auto;
    margin-top: 5%;
    border: 5px solid #ce6d19;
    border-radius: 20px;
    padding: 10px;
}
.table{
	 margin-top: 5%;
}
</style>
<meta charset="ISO-8859-1">
<title>Recent Transactions</title>
</head>
<body>
	<%@include file='NavBar.jsp' %>
	<div class='container'>
	<div class='headText'>
	<h2>Transaction Details:</h2>
	</div>
	<div class='table'>
	<table class="table table-dark table-striped">
		<thead>
		    <tr>
		      <th scope="col">S.No.</th>
		      <th scope="col">Sender's Email</th>
		      <th scope="col">Receiver's Email</th>
		      <th scope="col">Amount</th>
		      <th scope="col">Transaction Date</th>
		    </tr>
  		</thead>
  		<tbody>
  		<%
  		int c=1;
	DAO dao=new DAO();
	ArrayList<HashMap> allTransaction=dao.getAllTransaction();
	for(HashMap transaction:allTransaction){
	%>
  		<tr>
	      <th scope="row"><%=c++ %></th>
	      <td><%=transaction.get("semail") %></td>
	      <td><%=transaction.get("remail")%></td>
	      <td>Rs.<%=transaction.get("amount")%></td>
	      <td><%=transaction.get("date")%></td>
    	</tr>
  		
	<%} %>
	</tbody>
	</table>
	</div>
	</div>
</body>
</html>