<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<%
String dbUrl = "jdbc:mysql://remotemysql.com:3306/jBsMU8OOWb";
String dbUsername = "jBsMU8OOWb";
String dbPassword = "GPkoS7miTH";
String dbDriver = "com.mysql.cj.jdbc.Driver";
String cus_id = String.valueOf(session.getAttribute("loggedInUserId"));
try{
Class.forName(dbDriver); 
}
catch(Exception e){
	System.out.println(e);
}
Connection con=null;
PreparedStatement st=null;
ResultSet rs=null;
%>
<!DOCTYPE html>
<html>
<head>
<title>
UserHistory
</title>
</head>
<body class="history-body">
<h1>Your History</h1>
<div  class="table">
<table>
<tr>
<th>Hotel</th>
<th>Hotel Location</th>
<th>Room No</th>
<th>No of guests</th>
<th>Check in Date</th>
<th>Check out Date</th>
<th>Total Amount</th>

</tr>
<%
try{
con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
st= con.prepareStatement("SELECT h.name, h.address, r.roomno, b.noofguests, b.checkindate, b.checkoutdate, bi.`total amount` from hotels h inner join booking b inner join room r inner join bills bi inner join customerbill cb where h.id = r.hotelid and b.cusid =" +cus_id+ "b.roomid = r.id and cb.cusid = b.cusid");
rs = st.executeQuery();
int i = 1;
while(rs.next()){
%>
<tr>
<td><%=rs.getString("checkindate") %></td>
<td><%=rs.getString("checkoutdate") %></td>
<td><%=rs.getString("noofguests") %></td>
</tr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>