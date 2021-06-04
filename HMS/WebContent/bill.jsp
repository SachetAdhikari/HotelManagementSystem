<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>bill</title>
</head>
<body>
	<div class="bill">
		<h1>Bill</h1>
		<p style="text-align: right;"><%= request.getAttribute("CurrentDate") %></p>
		<ul> 
			<li>Booking Number: <%= request.getAttribute("BookingId") %> </li>
			<li>Hotel Name: <%= request.getAttribute("Name") %></li>
			<li>Room Number: <%= request.getAttribute("RoomNo") %></li>
			<li>Guests: <%= request.getAttribute("NoOfGuests") %></li>
		</ul>
		<hr>
		<span>Bill Amount: Rs 500</span>
		<form>
			<input type="submit" value="Pay">
		</form>
	</div>
</body>
</html>